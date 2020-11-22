"use strict";
const e = require("express");
const response = require("../../Helpers/res2");
const db = require("../../Helpers/db");
exports.index = function (req, res) {
  response.ok("res-api aplication running", res);
};

//show data from table top up
exports.getDataTopUp = function (req, res) {
  db.query(`SELECT * FROM top_up ORDER BY step ASC`, function (
    error,
    rows,
    fields
  ) {
    if (error) {
      response.serverError(error, res);
    } else {
      response.ok(rows, res);
    }
  });
};
//insert data top up
exports.setDataTopUp = function (req, res) {
  const { step, article } = req.body;
  db.query(
    `INSERT INTO top_up (step,article) VALUE('${step}','${article}')`,
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("success insert data", res);
      }
    }
  );
};

//update data top up by id
exports.updateDataTopUp = function (req, res) {
  const { id } = req.params;
  const { step, article } = req.body;
  db.query(
    `UPDATE top_up set step=${step}, article='${article}' WHERE id=${id}`,
    function (error, rows, fields) {
      if (error) {
        console.log(error);
      } else {
        response.ok("Success updated data", res);
      }
    }
  );
};

//delete data top up by id
exports.deleteDataTopUp = function (req, res) {
  const { id } = req.params;
  db.query(`DELETE FROM top_up WHERE id=${id}`, function (error, rows, fields) {
    if (error) {
      console.log(error);
    } else {
      response.ok("Success deleted data", res);
    }
  });
};
