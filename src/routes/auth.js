const authRoute = require("express").Router();
const authController = require("../controller/cAuth");

authRoute.post("/register", authController.register);
authRoute.post("/login", authController.login);

module.exports = authRoute;
