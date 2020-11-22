const indexRoute = require("express").Router();
const authRoute = require("./auth");
const profileRoutes = require("./profile");
const topupRoutes = require("./topup");
const transferRoutes = require("./transfer");
const uploadRoutes = require("../controller/upload");

indexRoute.use("/auth", authRoute);

indexRoute.post("/upload", uploadRoutes.upload);

indexRoute.use("/profile", profileRoutes);
indexRoute.use("/top-up", topupRoutes);
indexRoute.use("/transfer", transferRoutes);
// indexRoute.use("/wallet", profileRoutes);

module.exports = indexRoute;
