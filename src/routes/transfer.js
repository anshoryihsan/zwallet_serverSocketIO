// "use strict";
const transferTopUp = require("express").Router();
const authJWT = require("../Helpers/Midellware/auth");
const transfer = require("../controller/transfer/transfer");
transferTopUp
  .get("/", authJWT.authorization, transfer.getAllDataTransferHistory)
  .patch("/", authJWT.authorization, transfer.transfer)
  .get("/search", authJWT.authorization, transfer.getAllDataTransferSearch)
  .post("/", authJWT.authorization, transfer.setTransfer)
  .post("/filter", authJWT.authorization, transfer.transferFilter)
  .put(
    "/:id",
    authJWT.authorization,
    authJWT.permitAdmin,
    transfer.updateTransfer
  )
  .delete(
    "/:id",
    authJWT.authorization,
    authJWT.permitAdmin,
    transfer.deleteTransfer
  );
// .post("/filter", (req, res) => {
//   console.log(req.query);
//   console.log(req.body);
// });

module.exports = transferTopUp;
