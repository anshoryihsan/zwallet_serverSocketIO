const upload = require("../Helpers/upload");
const { failed } = require("../Helpers/res");

module.exports = {
  upload: (req, res) => {
    const uploadImage = upload.single("image");
    uploadImage(req, res, (err) => {
      if (!req.file) {
        failed([], res, "must be a picture!");
      } else {
        if (!err) {
          res.status(201).send({
            success: true,
            image: `${process.env.BASE_URL}/public/image/${req.file.filename}`,
          });
        } else {
          failed(err, res);
        }
      }
    });
  },
  hy: () => {
    console.log("hy");
  },
};
