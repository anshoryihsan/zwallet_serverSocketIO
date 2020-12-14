require("dotenv").config();

const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const logger = require("morgan");
const cors = require("cors");

app.use(logger("dev"));
app.use("*", cors());

const indexRoutes = require("./src/routes/index");
const http = require("http").createServer(app);
const io = require("socket.io")(http, {
  pingInterval: 2000,
  pingTimeout: 5000,
});
const db = require("./src/Helpers/db");

const socketListener = require("./src/Helpers/socketHandler");

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use("/api/v1/", indexRoutes);
// SocketListener(io);

app.get("/", function (req, res) {
  res.send("hello for use this API you can enter '/api/v1' ");
});

io.on("connection", (socket) => {
  const id = socket.handshake.query.id;
  socket.join(id);
  console.log(`user ${id} connected`);
  // db.query(`SELECT balance FROM profile where id=${id}`, (err, data) => {
  //   if (!err) {
  //     io.to(id).emit("get_info_balance", data);
  //   } else {
  //     console.log(err);
  //   }
  // });

  // socket.on("info_balance", (id) => {
  // console.log(id);
  if (id) {
    db.query(`SELECT balance FROM profile where id=${id}`, (err, data) => {
      if (!err) {
        // console.log(data);
        // socket.join(id);
        io.to(id).emit("get_info_balance", data);
      } else {
        console.log(err);
      }
    });
  }
  // });

  // io.to(id).emit("transaction", { title: " message " });
  socket.on("disconnect", () => {
    console.log(`user with id: ${id} has disconnected`);
  });
});

app.use(express.static("public"));
http.listen(process.env.PORT, () => {
  console.log(`Socket listening on port ${process.env.PORT}`);
});
