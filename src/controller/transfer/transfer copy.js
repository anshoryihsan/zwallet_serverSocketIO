"use strict";
const e = require("express");
const response = require("../../Helpers/res2");
const db = require("../../Helpers/db");
exports.index = function (req, res) {
  response.ok("res-api aplication running", res);
};

//show data from table transfer
exports.getAllDataTransfer = function (req, res) {
  let query = `SELECT 
    a.wallet_id,
    aa.first_name as from_,
    transfer1.beneficiary_id,
    bb.first_name as to_,
    bb.phone as phone,
    transfer1.amount,
    a.balance,
    transfer1.note 
  FROM
    transfer1
    JOIN wallet a ON a.wallet_id = transfer1.wallet_id
    JOIN wallet b ON b.wallet_id = transfer1.beneficiary_id	
    JOIN profile aa ON aa.id = a.user_id
    JOIN profile bb ON bb.id = b.user_id`;
  db.query(query, function (error, rows, fields) {
    if (error) {
      response.serverError(error, res);
    } else {
      response.ok(rows, res);
    }
  });
};
//show data from table transfer by id
exports.getDataTransferbyId = function (req, res) {
  const { id } = req.params;
  let query = `SELECT 
        aa.first_name as from_,
        bb.first_name as to_,
        bb.phone as phone,
        transfer1.amount,
        a.balance,
        transfer1.note,
        transfer1.date
    FROM
        transfer1
    JOIN wallet a ON a.wallet_id = transfer1.wallet_id
    JOIN wallet b ON b.wallet_id = transfer1.beneficiary_id	
    JOIN profile aa ON aa.id = a.user_id
    JOIN profile bb ON bb.id = b.user_id
    WHERE transfer1.wallet_id=${id} OR transfer1.beneficiary_id=${id}`;
  db.query(query, function (error, rows, fields) {
    if (error) {
      response.serverError(error, res);
    } else {
      response.ok(rows, res);
    }
  });
};
//search data transfer by name
exports.getDataByName = function (req, res) {
  const { first_name, last_name } = req.query;
  if (first_name === "" && last_name === "") {
    response.clientError(req, res);
  } else {
    console.log(first_name, last_name);
    let query = `SELECT 
              profile.first_name,
              profile.last_name,
              profile.phone
          FROM
              transfer1
          JOIN wallet ON wallet.wallet_id = transfer1.beneficiary_id	
          JOIN profile ON profile.id = wallet.user_id
          WHERE profile.first_name LIKE '%${first_name}%' OR profile.last_name LIKE '${last_name}' 
          ORDER BY first_name ASC`;
    db.query(query, (error, rows, fields) => {
      if (error) {
        response.serverError(error, res);
      } else {
        response.ok(rows, res);
      }
    });
  }
};
//insert data transfer
exports.postDataTransfer = function (req, res) {
  const today = new Date();
  const date =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  const { wallet_id, beneficiary_id, amount, note } = req.body;
  if ((wallet_id, beneficiary_id, amount, note)) {
    let query = `INSERT INTO transfer1 (wallet_id,beneficiary_id,amount,date,note)
            VALUE (${wallet_id},${beneficiary_id},${amount},'${date}','${note}')`;
    db.query(query, function (error, rows, fields) {
      if (error) {
        response.serverError(error, res);
      } else {
        response.ok("success insert data", res);
      }
    });
  } else {
    response.clientError(error, res);
  }
};
