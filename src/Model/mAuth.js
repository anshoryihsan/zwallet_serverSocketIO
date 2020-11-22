const db = require("../Helpers/db");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const authModel = {
  register: (body) => {
    return new Promise((resolve, reject) => {
      const { password } = body;
      bcrypt.hash(password, 10, function (err, hashPass) {
        const newBody = { ...body, password: hashPass };
        if (err) {
          reject(err);
        }
        const query = "INSERT INTO profile SET ?";
        db.query(query, newBody, (err, data) => {
          if (!err) {
            resolve(newBody);
          } else {
            reject(err);
          }
        });
      });
    });
  },
  login: (body) => {
    // console.log(body, 'body');
    return new Promise((resolve, reject) => {
      const { email, password } = body;
      // console.log(email, "email");
      const query = "SELECT * FROM profile WHERE email=?";
      db.query(query, email, async (err, data) => {
        // let dataUser = await data[0];
        // console.log(data[0], 'data');
        if (data[0] === undefined) {
          reject("Email Not Found.");
        } else {
          if (!err) {
            let dataUser = data[0];
            const token = jwt.sign(
              {
                email: dataUser.email,
                id: dataUser.id,
                name: dataUser.name,
                role_id: dataUser.role_id,
                pin: dataUser.pin,
              },
              process.env.SECRET_KEY
              // { expiresIn: "1 days" }
            );
            bcrypt.compare(body.password, dataUser.password, (err, result) => {
              if (err) {
                reject("your password is incorsect");
              } else {
                if (!result) {
                  reject("your password is incorrect");
                } else {
                  const sql = "SELECT * FROM profile WHERE password=?";
                  db.query(sql, dataUser.password, (err, data) => {
                    // console.log(data[0].role_id);
                    if (!err) {
                      resolve({ role: data[0].role_id, token: token });
                    } else {
                      reject("your password is incorect");
                    }
                  });
                }
              }
            });
          } else {
            reject(err);
          }
        }
      });
    });
  },
};
module.exports = authModel;
