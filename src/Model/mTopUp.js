const db = require("../Helpers/db");

const topupModel = {
  getDataTopUp: () => {
    return new Promise((resolve, reject) => {
      db.query("SELECT * FROM top_up ORDER BY step ASC", (err, res) => {
        if (!err) {
          resolve(res);
        }
        reject(err);
      });
    });
  },
  setDataTopUp: (body) => {
    return new Promise((resolve, reject) => {
      const query = "INSERT INTO top_up SET ?";
      db.query(query, body, (err, data) => {
        if (!err) {
          resolve(body);
        } else {
          reject(err);
        }
      });
    });
  },
  updateDataTopUp: (param, body) => {
    return new Promise((resolve, reject) => {
      const query = `UPDATE top_up SET ? WHERE id=${param.id}`;
      db.query(query, body, (err, data) => {
        console.log(data);
        if (!err) {
          resolve(body);
        } else {
          reject(err);
        }
      });
    });
  },
  deleteDataTopUp: (param) => {
    return new Promise((resolve, reject) => {
      (sql = "DELETE FROM top_up WHERE id=?"),
        db.query(sql, param, (err, res) => {
          if (!err) {
            resolve(res);
          }
          reject(err);
        });
    });
  },
};
module.exports = topupModel;
