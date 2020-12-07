const response = require("../../Helpers/res");
const transferModel = require("../../Model/mTransfer");
const express = require("express");
const app = express();
const http = require("http").createServer(app);
const io = require("socket.io")(http);
const { DateTime } = require("luxon");
const convertDate = require("../../Helpers/date");

module.exports = {
  transfer: (req, res) => {
    transferModel
      .transfer(req.tokenId, req.body)
      .then((data) => {
        // const { receiver_id, amount } = data;
        io.on("connection", (socket) => {
          // console.log(receiver_id, amount, "sdasdaksdkasjdkajskdjakjs");
          //   const title = `Transfer Success`;
          //   const message = `you have receive Rp. ${amount.toLocaleString(
          //     "id-ID"
          //   )}`;
          //   // console.log(socket.handshake.query);
          //   const id = socket.handshake.query.id;
          socket.join(receiver_id);
          console.log(receover_id, "transfer");
          //   console.log(`user ${id} connected`);
          //   // io.to(id).emit("transaction", { tes: "hy notif" });
          //   io.to(idreceiver_id).emit("transaction", { title, message });
          //   socket.on("disconnect", () => {
          //     // console.log(`user disconnected`);
          //     console.log(`user with id: ${id} has disconnected`);
          //   });
          // });
          // const title = `Transfer Success`;
          // const message = `you have receive Rp. ${amount.toLocaleString(
          //   "id-ID"
          // )}`;
          io.to(receiver_id).emit("transaction", { title: " message" });
        });
        // io.to(receiver_id).emit("transaction", { title: " message" });
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
  transferFilter: (req, res) => {
    const { start, end, filter } = req.query;
    const startDate = convertDate.date(start);
    const endDate = convertDate.date(end);
    let a = `profile_id= ${req.tokenId} OR receiver_id= ${req.tokenId}`;
    let b = `"" AND ""`;
    // console.log(req.query);
    if (filter == "outcome") {
      a = ` profile_id= ${req.tokenId}`;
    } else if (filter == "income") {
      a = ` receiver_id= ${req.tokenId}`;
    }
    if (startDate && endDate) {
      b = `"${startDate}" AND "${endDate}"`;
    } else {
      b = `"" AND ""`;
    }
    // console.log(a);
    // console.log(b);

    transferModel
      .getDataFilter(a, b)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
    // if (filter === "income") {
    //   transferModel
    //     .getDataIncome(req.tokenId, startDate, endDate)
    //     .then((data) => response.success(data, res))
    //     .catch((err) => response.failed(err, res));
    // } else if (filter == "outcome") {
    //   // console.log(filter);
    //   transferModel
    //     .getDataOutcome(req.tokenId, startDate, endDate)
    //     .then((data) => response.success(data, res))
    //     .catch((err) => response.failed(err, res));
    // }
    // else if (filter === "date") {
    //   transferModel
    //     .getDataFilter(req.tokenId, startDate, endDate)
    //     .then((data) => response.success(data, res))
    //     .catch((err) => response.failed(err, res));
    // }
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
