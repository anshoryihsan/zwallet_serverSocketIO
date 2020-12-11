// const { failed } = require("../../Helpers/res");
const response = require("../../Helpers/res");
// const upload = require("../../Helpers/upload");
const profileModel = require("../../Model/mProfile");
const app = require("express")();
const http = require("http").createServer(app);
const io = require("socket.io")(http);

module.exports = {
  getDataProfile: (req, res) => {
    profileModel
      .getDataProfile()
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  getDataProfileById: (req, res) => {
    profileModel
      .getDataProfileById(req.params.id)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  getDataProfileByTokenId: (req, res) => {
    profileModel
      .getDataProfileById(req.tokenId)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  getDataProfileByName: (req, res) => {
    profileModel
      .getDataProfileByName(req.query)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  getBalance: (req, res) => {
    profileModel
      .getBalance(req, tokenId)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  setDataProfile: (req, res) => {
    profileModel
      .setDataProfile(body)
      .then((data) => response.success(data, res, "insert data success"))
      .catch((err) => response.failed(err, res));
  },

  updateDataProfile: (req, res) => {
    profileModel
      .updateDataProfile(req.params, req.body)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  updatePatchDataProfile: (req, res) => {
    console.log(req.body);
    profileModel
      .updatePatchDataProfile(req.tokenId, req.body)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  deleteDataProfile: (req, res) => {
    profileModel
      .deleteDataProfile(req.params.id)
      .then(() => response.success([], res, "data has been deleted"))
      .catch((err) => response.failed(err, res));
  },
};
