const db = require("../Helpers/db");

const transferModel = {
  transfer: (tokenId, dataBody) => {
    const { amount, receiver_id } = dataBody;
    return new Promise((resolve, reject) => {
      const query =
        "INSERT INTO transfer SET `profile_id`='" + tokenId + "', ?";
      db.query(query, dataBody, (err, data) => {
        // console.log(query);
        if (!err) {
          db.query(
            `UPDATE profile SET balance=balance-${amount} WHERE id=${tokenId}`,
            (err, dataUser) => {
              if (!err) {
                db.query(
                  `SELECT balance FROM profile where id=${receiver_id}`,
                  (err, NewBalance) => {
                    if (!err) {
                      const balance =
                        NewBalance[0].balance === null
                          ? amount
                          : Number(NewBalance[0].balance) + Number(amount);
                      db.query(
                        `UPDATE profile SET balance=${balance} WHERE id=${receiver_id}`,
                        (err, dataReceiver) => {
                          if (!err) {
                            resolve(dataBody);
                          } else {
                            reject(err);
                          }
                        }
                      );
                    } else {
                      reject(err);
                    }
                  }
                );
              } else {
                reject(err);
              }
            }
          );
        } else {
          reject(err);
        }
      });
    });
  },
  getAllDataTransferHistory: (tokenId, data) => {
    // console.log(tokenId);
    let { limit, page } = data;
    if (!limit) limit = 5;
    else limit = parseInt(limit);
    if (!page) page = 1;

    // console.log(data);
    // console.log(page);

    return new Promise((resolve, reject) => {
      const query = `
        SELECT
            profile_id,
            a.first_name AS from_,
            a.photo AS from_photo,
            receiver_id,
            b.first_name AS to_,
            b.photo AS to_photo,
            amount,
            trans_name,
            trans_type,
            note,
            date 
        FROM
            transfer
            JOIN profile a ON a.id = transfer.profile_id
            JOIN profile b ON b.id = transfer.receiver_id 
        WHERE
            profile_id = ${tokenId} 
            OR receiver_id = ${tokenId}
        ORDER BY
            date DESC
        LIMIT ${limit} OFFSET ${page}
        `;
      db.query(query, (err, res) => {
        if (!err) {
          resolve(res);
        }
        reject(err);
      });
    });
  },
  getAllDataTransferSearch: (tokenId, search) => {
    // console.log(search);
    return new Promise((resolve, reject) => {
      const query = `
      SELECT
        profile_id,
        a.first_name AS from_,
        receiver_id,
        b.first_name AS to_,
        amount,
        note,
        date 
    FROM
        transfer
        JOIN profile a ON a.id = transfer.profile_id
        JOIN profile b ON b.id = transfer.receiver_id 
    WHERE
    profile_id = ${tokenId} 
            OR receiver_id = ${tokenId} and
        b.first_name LIKE '%${search}%'
    ORDER BY
        date DESC
      `;
      console.log(query);
      db.query(query, (err, data) => {
        if (!err) {
          resolve(data);
        } else {
          reject(err);
        }
      });
    });
  },
  setTransfer: (id, body) => {
    return new Promise((resolve, reject) => {
      const query = "INSERT INTO transfer SET `profile_id`='" + id + "', ?";
      db.query(query, body, (err, data) => {
        console.log(query);
        if (!err) {
          resolve(body);
        } else {
          reject(err);
        }
      });
    });
  },
  updateTransfer: (param, body) => {
    // console.log(param);
    return new Promise((resolve, reject) => {
      const query = `UPDATE transfer SET ? WHERE transfer_id=${param.id}`;
      db.query(query, body, (err, data) => {
        // console.log(query);
        if (!err) {
          resolve(body);
        } else {
          reject(err);
        }
      });
    });
  },
  deleteTransfer: (params) => {
    return new Promise((resolve, reject) => {
      const query = `DELETE FROM transfer WHERE transfer_id=${params.id}`;
      db.query(query, (err, res) => {
        if (!err) {
          resolve(res);
        }
        reject(err);
      });
    });
  },
  getDataIncome: (id, start, end) => {
    return new Promise((resolve, reject) => {
      const query = `SELECT
        profile_id,
        a.first_name AS from_,
        receiver_id,
        b.first_name AS to_,
        amount,
        note,
        date
        FROM
        transfer
        JOIN profile a ON a.id = transfer.profile_id
        JOIN profile b ON b.id = transfer.receiver_id
        WHERE
        receiver_id = ${id}
        ORDER BY
        date DESC
        LIMIT 4 OFFSET 1`;
      db.query(query, (err, res) => {
        if (!err) {
          // console.log(res);
          // console.log(res, "IN");
          resolve(res);
        }
        // console.log(err);
        reject(err);
      });
    });
  },
  getDataOutcome: (id, start, end) => {
    return new Promise((resolve, reject) => {
      const query = `SELECT
        profile_id,
        a.first_name AS from_,
        receiver_id,
        b.first_name AS to_,
        amount,
        note,
        date
        FROM
        transfer
        JOIN profile a ON a.id = transfer.profile_id
        JOIN profile b ON b.id = transfer.receiver_id
        WHERE
        profile_id = ${id}
        ORDER BY
        date DESC
        LIMIT 4 OFFSET 1`;
      db.query(query, (err, res) => {
        if (!err) {
          // console.log(res);
          // console.log(res, "Out");
          resolve(res);
        }
        // console.log(err);
        reject(err);
      });
    });
  },
  getDataFilter: (section, startend) => {
    console.log(section);
    console.log(startend);
    return new Promise((resolve, reject) => {
      const query = `
        SELECT
            profile_id,
            a.first_name AS from_,
            a.photo AS from_photo,
            receiver_id,
            b.first_name AS to_,
            b.photo AS to_photo,
            amount,
            trans_name,
            trans_type,
            note,
            date
        FROM
            transfer
            JOIN profile a ON a.id = transfer.profile_id
            JOIN profile b ON b.id = transfer.receiver_id
        WHERE
            ${section}
            and (date BETWEEN ${startend})
        ORDER BY
            date ASC
            LIMIT 4 OFFSET 1
        `;
      // console.log(query);
      db.query(query, (err, res) => {
        if (!err) {
          console.log(res);
          // console.log(res, "netr<al");
          resolve(res);
        }
        console.log(err);
        reject(err);
      });
    });
  },
};
module.exports = transferModel;
