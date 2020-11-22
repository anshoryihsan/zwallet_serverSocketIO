// "use strict";
const routeTopUp = require("express").Router();
const authJWT = require("../Helpers/Midellware/auth");
const topup = require("../controller/top-up/top-up");
routeTopUp
  .get("/", authJWT.authorization, topup.getDataTopUp)
  .post("/", authJWT.authorization, authJWT.permitAdmin, topup.setDataTopUp)
  .put(
    "/:id",
    authJWT.authorization,
    authJWT.permitAdmin,
    topup.updateDataTopUp
  )
  .delete(
    "/:id",
    authJWT.authorization,
    authJWT.permitAdmin,
    topup.deleteDataTopUp
  );

module.exports = routeTopUp;
