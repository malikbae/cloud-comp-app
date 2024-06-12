const express = require("express");
const router = express.Router();

const testUser = require("../middleware/test-user");

const { getAllJobs, getJob, createJob, updateJob, deleteJob, showStats } = require("../controllers/jobs");

router.get("/stats", showStats);
router.get("/", getAllJobs);
router.get("/:id", getJob);
router.post("/", testUser, createJob);
router.patch("/:id", testUser, updateJob);
router.delete("/:id", testUser, deleteJob);

module.exports = router;
