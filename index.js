require("dotenv/config");

const express = require("express");
const app = express();
const http = require("http").createServer(app);
const bodyParser = require("body-parser");
const logger = require("morgan");
const cors = require("cors");
const indexRoutes = require("./src/routes/index");
const io = require("socket.io")(http);
const SocketListener = require("./src/Helpers/socketHandler");

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use("/api/v1/", indexRoutes);
// SocketListener(io);

io.on("connection", (socket) => {
  const id = socket.handshake.query.id;
  socket.join(id);
  console.log("a user connected with id: ", id);
  socket.on("disconnect", () => {
    console.log(`user with id: ${id} has disconnected`);
  });
});

app.use(logger("dev"));
app.use(cors());

app.get("/", function (req, res) {
  res.send("hello for use this API you can enter '/api/v1' ");
});

http.listen(process.env.PORT, () => {
  console.log(`Server started on port ${process.env.PORT}`);
});
// app.listen(process.env.PORT, () => {
//   console.log(`Server started on port ${process.env.PORT}`);
// });
// http.listen(process.env.SOCKET_PORT, () => {
//   console.log(`Socket listening at " ${process.env.SOCKET_PORT}`);
// });
