const db = require("../Helpers/db");

const bcrypt = require("bcrypt");

const profieModel = {
  getDataProfile: () => {
    return new Promise((resolve, reject) => {
      db.query("SELECT * FROM profile ORDER BY id DESC", (err, res) => {
        if (!err) {
          resolve(res);
        }
        reject(err);
      });
    });
  },
  getDataProfileById: (id) => {
    return new Promise((resolve, reject) => {
      (sql = `SELECT * FROM profile WHERE id=?`),
        db.query(sql, id, (err, res) => {
          if (!err) {
            resolve(res);
          }
          reject(err);
        });
    });
  },
  getDataProfileByName: (data) => {
    let { name, limit, page } = data;
    if (!limit) limit = 20;
    else limit = parseInt(limit);
    if (!page) page = 0;
    return new Promise((resolve, reject) => {
      db.query(
        `SELECT * FROM profile WHERE first_name LIKE "%${name}%" LIMIT ${limit} OFFSET ${page}`,
        (err, res) => {
          if (!err) {
            resolve(res);
          }
          reject(err);
        }
      );
    });
  },
  setDataProfile: (body) => {
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
  updateDataProfile: (id, body) => {
    console.log(id, "m");
    return new Promise((resolve, reject) => {
      db.query(`SELECT * FROM profile WHERE id=${id.id}`, (err, result) => {
        if (err) {
          reject(err);
        } else {
          body.photo = !body.photo ? result[0].photo : body.photo;
          // console.log(body);
          const { password } = body;
          bcrypt.hash(password, 10, function (err, hashPass) {
            const newBody = { ...body, password: hashPass };
            // console.log(body);
            if (err) {
              reject(err);
            }
            const query = `UPDATE profile SET ? WHERE id=${id.id}`;
            db.query(query, newBody, (err, data) => {
              // console.log(data);
              if (!err) {
                resolve(newBody);
              } else {
                reject(err);
              }
            });
          });
        }
      });
    });
  },
  updatePatchDataProfile: (id, body) => {
    return new Promise((resolve, reject) => {
      // console.log(body);
      db.query(`SELECT * FROM profile WHERE id=${id}`, (err, result) => {
        if (err) {
          reject(err);
        } else {
          body.photo = !body.photo ? result[0].photo : body.photo;
          let password = undefined;
          if (!body.password) {
            password = result[0].password;
          } else {
            password = bcrypt.hashSync(body.password, bcrypt.genSaltSync(10));
          }
          const newBody = { ...body, password: password };
          const query = `UPDATE profile SET ? WHERE id=${id}`;
          db.query(query, newBody, (err, data) => {
            // console.log(data);
            if (!err) {
              resolve(newBody);
            } else {
              reject(err);
            }
          });
        }
      });
    });
  },
  deleteDataProfile: (param) => {
    return new Promise((resolve, reject) => {
      (sql = "DELETE FROM profile WHERE id=?"),
        db.query(sql, param, (err, res) => {
          if (!err) {
            resolve(res);
          }
          reject(err);
        });
    });
  },
  // updatePatchDataProfile: (id, body) => {
  //   return new Promise((resolve, reject) => {
  //     // const { password } = body;
  //     // bcrypt.hash(password, 10, function (err, hashPass) {
  //     // const newBody = { ...body, password: hashPass };
  //     // if (err) {
  //     //   reject(err);
  //     // }
  //     // const query = `UPDATE profile SET ? WHERE id=${id}`;
  //     // db.query(query, body, (err, data) => {
  //     //   console.log(body);
  //     //   if (!err) {
  //     //     resolve(body);
  //     //   } else {
  //     //     reject(err);
  //     //   }
  //     // });
  //     // });
  //   });
  // },
  // updateDataProfile: (param, body) => {
  //   return new Promise((resolve, reject) => {
  //     const { password } = body;
  //     bcrypt.hash(password, 10, function (err, hashPass) {
  //       const newBody = { ...body, password: hashPass };
  //       if (err) {
  //         reject(err);
  //       }
  //       const query = `UPDATE profile SET ? WHERE id=${param.id}`;
  //       db.query(query, newBody, (err, data) => {
  //         console.log(data);
  //         if (!err) {
  //           resolve(newBody);
  //         } else {
  //           reject(err);
  //         }
  //       });
  //     });
  //   });
  // },
};
module.exports = profieModel;
