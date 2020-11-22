const multer = require("multer");
const path = require("path");
const { failed } = require("./res");
// require('../../public/image')
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, "../../public/image"));
  },
  filename: function (req, file, cb) {
    console.log(req, "requesREQUESSSS");
    console.log(file, "fileFILEEEEE");
    str = file.originalname;
    const fileName = str.replace(/\s/g, "-");
    cb(null, `${Date.now()}-${fileName}`);
  },
});
const limits = { fileSize: 3e6 }; //1000000
const fileFilter = (req, file, cb) => {
  const fExtens = /jpg|png|jpeg|svg/;
  const extName = fExtens.test(path.extname(file.originalname).toLowerCase());
  if (extName) {
    cb(null, true);
  } else {
    cb("format image (jpg,png,jpeg,svg)", null);
  }
};

const upload = multer({ storage, limits, fileFilter });

module.exports = upload;
