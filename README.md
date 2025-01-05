# Express Sholatku

Express Sholatku adalah backend dari website [sholatku.my.id](https://sholatku.my.id), yang bertujuan untuk memudahkan masyarakat Indonesia dalam mengecek jadwal sholat. Aplikasi ini dibuat menggunakan framework **Express.js** oleh **Faqihuddin Habibi** dan dilisensikan di bawah lisensi **GNU GPL v3**.

## Fitur Utama
1. **Registrasi Pengguna**: Menyimpan informasi pengguna untuk pengalaman yang lebih personal.
2. **Login Pengguna**: Memberikan token autentikasi untuk mengakses fitur tambahan.
3. **Jadwal Sholat**: Mengambil jadwal sholat berdasarkan kota dan negara yang diminta.
4. **Caching Data**: Mengurangi permintaan API berulang untuk efisiensi.

## Cara Menggunakan API

Base URL: `https://api.sholatku.my.id/api/`

### 1. Registrasi Pengguna
**Endpoint**: `POST /register`

**Body Parameters**:
- `name` (string): Nama pengguna.
- `email` (string): Email pengguna.
- `password` (string): Password pengguna.

**Response**:
```json
{
    "success": true,
    "message": "Register successfully",
    "data": {
        "id": 4,
        "name": "test",
        "email": "test@gmail.com",
        "password": "$2a$10$85DG850tEjb6PiBdFisXV.oXNF9cOGv1knLsLHElHsoWyteoHNlfi",
        "city": null,
        "country": null,
        "createdAt": "2025-01-05T13:02:12.782Z",
        "updatedAt": "2025-01-05T13:02:12.782Z"
    }
}
```

### 2. Login Pengguna
**Endpoint**: `POST /login`

**Body Parameters**:
- `email` (string): Email pengguna.
- `password` (string): Password pengguna.

**Response**:
```json
{
    "success": true,
    "message": "Login successfully",
    "data": {
        "user": {
            "id": 4,
            "name": "test",
            "email": "test@gmail.com",
            "city": null,
            "country": null
        },
        "token": "<JWT Token>"
    }
}
```

### 3. Mengambil Jadwal Sholat
**Endpoint**: `GET /prayertime`

**Query Parameters**:
- `city` (string): Nama kota.
- `country` (string): Indonesia.

**Headers** (opsional):
- `Authorization`: Bearer token yang didapat dari endpoint login.

**Response**:
```json
{
    "success": true,
    "message": "Prayer times retrieved from cache",
    "source": "cache",
    "data": {
        "timings": {
            "Fajr": "04:00",
            "Sunrise": "05:25",
            "Dhuhr": "11:42",
            "Asr": "15:08",
            "Maghrib": "17:58",
            "Isha": "19:14",
            "Imsak": "03:50"
        },
        "date": {
            "readable": "2025-01-05",
            "hijri": {
                "date": "05-07-1446"
            }
        }
    }
}
```

## Cara Menjalankan Proyek
1. Clone repository ini:
   ```bash
   git clone https://github.com/fhabibiii/express-sholatku.git
   ```
2. Masuk ke direktori proyek:
   ```bash
   cd express-sholatku
   ```
3. Instal dependensi:
   ```bash
   npm install
   ```
4. Buat file `.env` berdasarkan contoh di `.env.example` dan sesuaikan dengan konfigurasi Anda.
5. Jalankan server:
   ```bash
   npm start
   ```
6. Server akan berjalan pada `http://localhost:3000` secara default.

## Struktur Proyek
- `routes/`: Berisi definisi endpoint.
- `controllers/`: Logika utama aplikasi.
- `models/`: Definisi skema database menggunakan Prisma.
- `middlewares/`: Middleware seperti autentikasi JWT.
- `utils/`: Fungsi-fungsi pendukung.

## Lisensi
Program ini dilisensikan di bawah [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.html). Anda bebas untuk menggunakan, memodifikasi, dan mendistribusikan ulang program ini selama mengikuti ketentuan lisensi.

---
Dibuat dengan ❤ oleh **Faqihuddin Habibi** 🍉

