//import express
const express = require('express')

//init express router
const router = express.Router();

//import verifyToken
const { verifyToken, verifyTokenOptional } = require('../middlewares/auth');

//import register controller
const registerController = require('../controllers/RegisterController');

//import login controller
const loginController = require('../controllers/LoginController');

// Import controller
const prayerTimesController = require("../controllers/PrayerTimesController");

// import validate register and login
const { validateRegister, validateLogin } = require('../utils/validators/auth');

// Import validator
const { validatePrayerTimes } = require("../utils/validators/prayerTimesValidator");

//define route for register
router.post('/register', validateRegister, registerController.register);

//define route for login
router.post('/login', validateLogin, loginController.login);

// Define route for Prayer Times
router.get("/prayertime", verifyTokenOptional, validatePrayerTimes, prayerTimesController.getPrayerTimesByCity);

//export router
module.exports = router