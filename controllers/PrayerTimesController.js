const express = require("express");
const axios = require("axios");
const prisma = require("../prisma/client");

const getPrayerTimesByCity = async (req, res) => {
    try {
        let { city, country } = req.query;

        if (req.user) {
            const userId = req.user.id;

            // Periksa apakah user memiliki city dan country di database
            const user = await prisma.user.findUnique({
                where: { id: userId },
                select: { city: true, country: true },
            });

            if (user) {
                if (!city || !country) {
                    // Jika city atau country tidak diberikan, gunakan data user
                    city = user.city;
                    country = user.country;
                } else {
                    // Jika city dan country diberikan, perbarui data user
                    await prisma.user.update({
                        where: { id: userId },
                        data: { city, country },
                    });
                }
            }
        }

        if (!city || !country) {
            return res.status(400).json({
                success: false,
                message: "City and country are required",
            });
        }

        const today = new Date();
        const todayDate = today.toISOString().split("T")[0]; // Format YYYY-MM-DD

        // Hapus cache yang tidak relevan (hari sebelumnya)
        await prisma.cache.deleteMany({
            where: {
                createdAt: {
                    lt: new Date(today.setHours(0, 0, 0, 0)), // Awal hari ini
                },
            },
        });

        // Periksa apakah data sudah ada di cache
        const cachedData = await prisma.cache.findFirst({
            where: {
                city,
                country,
                date: todayDate,
            },
        });

        if (cachedData) {
            // Jika data ditemukan, gunakan cache
            return res.status(200).json({
                success: true,
                message: "Prayer times retrieved from cache",
                source: "cache", // Indikasi bahwa data diambil dari cache
                data: {
                    timings: {
                        Fajr: cachedData.fajr,
                        Sunrise: cachedData.sunrise,
                        Dhuhr: cachedData.dhuhr,
                        Asr: cachedData.asr,
                        Maghrib: cachedData.maghrib,
                        Isha: cachedData.isha,
                        Imsak: cachedData.imsak,
                    },
                    date: {
                        readable: cachedData.date,
                        hijri: { date: cachedData.hijriDate },
                    },
                },
            });
        }

        // Jika data tidak ditemukan, panggil API Aladhan
        const response = await axios.get("https://api.aladhan.com/v1/timingsByCity", {
            params: { city, country, method: 20 },
        });

        const { timings, date } = response.data.data;

        // Simpan data baru ke cache
        await prisma.cache.create({
            data: {
                city,
                country,
                fajr: timings.Fajr,
                sunrise: timings.Sunrise,
                dhuhr: timings.Dhuhr,
                asr: timings.Asr,
                maghrib: timings.Maghrib,
                isha: timings.Isha,
                imsak: timings.Imsak,
                date: todayDate,
                hijriDate: date.hijri.date,
            },
        });

        // Kembalikan response dengan pesan dari API Aladhan
        res.status(200).json({
            success: true,
            message: "Prayer times retrieved from Aladhan API",
            source: "api", // Indikasi bahwa data diambil dari API
            data: { timings, date },
        });
    } catch (error) {
        console.error("Error fetching prayer times:", error);
        res.status(500).json({
            success: false,
            message: "Failed to fetch prayer times",
        });
    }
};

module.exports = { getPrayerTimesByCity };
