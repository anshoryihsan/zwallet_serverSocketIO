const response = require("../../Helpers/res");
const topupModel = require("../../Model/mTopUp");

module.exports = {
  getDataTopUp: (req, res) => {
    topupModel
      .getDataTopUp()
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  setDataTopUp: (req, res) => {
    topupModel
      .setDataTopUp(req.body)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  updateDataTopUp: (req, res) => {
    // console.log(req.body);
    topupModel
      .updateDataTopUp(req.params, req.body)
      .then((data) => response.success(data, res))
      .catch((err) => response.failed(err, res));
  },
  deleteDataTopUp: (req, res) => {
    topupModel
      .deleteDataTopUp(req.params.id)
      .then(() => response.success([], res, "data has been deleted"))
      .catch((err) => response.failed(err, res));
  },
};
