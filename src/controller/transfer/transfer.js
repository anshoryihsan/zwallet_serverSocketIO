const response = require("../../Helpers/res");
const transferModel = require("../../Model/mTransfer");
const { io } = require("../../Helpers/socketHandler");

module.exports = {
  transfer: (req, res) => {
    transferModel
      .transfer(req.tokenId, req.body)
      .then((data) => {
        const { receiver_id, trans_name, amount } = data;
        const title = `${trans_name} Success`;
        const message = `you have receive Rp. ${amount.toLocaleString(
          "id-ID"
        )}`;
        io.to(receiver_id).emit("transaction", { title, message });
        response.success(data, res);
      })
      .catch((err) => response.failed(err, res));
  },
  getAllDataTransferHistory: (req, res) => {
    transferModel
      .getAllDataTransferHistory(req.tokenId, req.query)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  getAllDataTransferSearch: (req, res) => {
    transferModel
      .getAllDataTransferSearch(req.tokenId, req.query.search)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  setTransfer: (req, res) => {
    transferModel
      .setTransfer(req.id, req.body)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  updateTransfer: (req, res) => {
    transferModel
      .updateTransfer(req.params, req.body)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  deleteTransfer: (req, res) => {
    transferModel
      .deleteTransfer(req.params)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
};
