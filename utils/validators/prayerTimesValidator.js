const { query } = require("express-validator");

const validatePrayerTimes = [
    query("city")
        .notEmpty()
        .withMessage("City is required"),
    query("country")
        .notEmpty()
        .withMessage("Country is required"),
];

module.exports = { validatePrayerTimes };