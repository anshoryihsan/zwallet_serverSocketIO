const route = require("express").Router();
const authJWT = require("../Helpers/Midellware/auth");
const uploadImg = require("../Helpers/upload");
const profile = require("../controller/profile/profile");
const uploadRoutes = require("../controller/upload");
route
  .get("/", authJWT.authorization, authJWT.permitAdmin, profile.getDataProfile)
  .get("/tokenId", authJWT.authorization, profile.getDataProfileByTokenId) //, profile.getDataProfileByTokenId
  .get("/search", authJWT.authorization, profile.getDataProfileByName)
  .get("/:id", profile.getDataProfileById)
  // .get("/:id", authJWT.authorization, profile.getDataProfileById)
  .post(
    "/",
    authJWT.authorization,
    authJWT.permitAdmin,
    uploadImg.singleUpload,
    profile.setDataProfile
  )
  .put(
    "/:id",
    authJWT.authorization,
    authJWT.permitAdmin,
    uploadImg.singleUpload,
    profile.updateDataProfile
  )
  .patch(
    "/",
    authJWT.authorization,
    uploadImg.singleUpload,
    profile.updatePatchDataProfile
  )
  .delete(
    "/:id",
    authJWT.authorization,
    authJWT.permitAdmin,
    profile.deleteDataProfile
  );
// .post("/upload", profile.uploadImg)
// .post("/upload", uploadRoutes.upload);

module.exports = route;
