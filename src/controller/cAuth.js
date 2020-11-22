const authModel = require("../Model/mAuth");
const response = require("../Helpers/res");

module.exports = {
  register: (req, res) => {
    authModel
      .register(req.body)
      .then((data) => response.success(data, res, "Register Successfull"))
      .catch((err) => response.failed(err.message, res));
  },
  login: (req, res) => {
    console.log(req.body);
    authModel
      .login(req.body)
      .then((data) => response.success(data, res, "Login Successfull"))
      .catch((err) => response.failed(err, res));
  },
};
