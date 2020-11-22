require("dotenv/config");
const response = require("../res");

jwt = require("jsonwebtoken");

module.exports = {
  authorization: (req, res, next) => {
    const token = req.headers.token;
    if (!token) {
      return response.unauth(res, "Require token");
    } else {
      jwt.verify(token, process.env.SECRET_KEY, (err, data) => {
        if (err) {
          return response.forbiden(res, "you not have access");
        }
        req.tokenId = data.id;
        next();
      });
    }
  },
  permitAdmin: (req, res, next) => {
    const token = req.headers.token;
    jwt.verify(token, process.env.SECRET_KEY, (err, data) => {
      if (data.role_id == 24) next();
      else {
        return response.forbiden(res, "you not have access");
      }
    });
  },
};
