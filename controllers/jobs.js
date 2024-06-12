const Job = require("../models/Job");
const { Op } = require("sequelize");
const { StatusCodes } = require("http-status-codes");
const { BadRequestError, NotFoundError } = require("../errors");
const sequelize = require("sequelize");
const moment = require("moment");

const getAllJobs = async (req, res) => {
  const { status, jobType, sort, search } = req.query;

  const queryObject = {
    createdBy: req.user.userId,
  };

  if (search) {
    queryObject.position = { [Op.regexp]: search };
  }

  if (status && status !== "all") {
    queryObject.status = status;
  }

  if (jobType && jobType !== "all") {
    queryObject.jobType = jobType;
  }

  console.log(queryObject);

  let sortValue;

  if (sort === "latest") {
    sortValue = [["createdAt", "DESC"]];
  }
  if (sort === "oldest") {
    sortValue = [["createdAt", "ASC"]];
  }
  if (sort === "a-z") {
    sortValue = [["position", "ASC"]];
  }
  if (sort === "z-a") {
    sortValue = [["position", "DESC"]];
  }

  const page = Number(req.query.page) || 1;
  const limit = Number(req.query.limit) || 10;
  const skip = (page - 1) * limit;

  let result = Job.findAll({ where: queryObject, order: sortValue, limit, offset: skip });
  const jobs = await result;

  const totalJobs = await Job.count({ where: queryObject });
  const numOfPages = Math.ceil(totalJobs / limit);

  res.status(StatusCodes.OK).json({ jobs, totalJobs, numOfPages });
};

const getJob = async (req, res) => {
  const {
    user: { userId },
    params: { id: jobId },
  } = req;

  const job = await Job.findOne({ where: { id: jobId, createdBy: userId } });

  if (!job) {
    throw new NotFoundError(`No job with id ${jobId}`);
  }

  res.status(StatusCodes.OK).json({ job });
};

const createJob = async (req, res) => {
  req.body.createdBy = req.user.userId;
  const job = await Job.create(req.body);
  res.status(StatusCodes.CREATED).json({ job });
};

const updateJob = async (req, res) => {
  const {
    body: { company, position },
    user: { userId },
    params: { id: jobId },
  } = req;

  if (company === "" || position === "") {
    throw new BadRequestError("Company or Position fields cannot be empty");
  }

  const updateJob = await Job.update(req.body, { where: { id: jobId, createdBy: userId } });

  if (updateJob[0] > 0) {
    const job = await Job.findOne({ where: { id: jobId, createdBy: userId } });
    res.status(StatusCodes.OK).json({ job });
  } else {
    throw new NotFoundError(`No job with id ${jobId}`);
  }
};

const deleteJob = async (req, res) => {
  const {
    user: { userId },
    params: { id: jobId },
  } = req;

  const job = await Job.destroy({ where: { id: jobId, createdBy: userId } });

  if (!job) {
    throw new NotFoundError(`No job with id ${jobId}`);
  }

  res.status(StatusCodes.OK).send();
};

const showStats = async (req, res) => {
  let stats = await Job.findAll({
    attributes: ["status", [sequelize.fn("COUNT", sequelize.col("status")), "count"]],
    where: { createdBy: req.user.userId },
    group: ["status"],
    raw: true,
  });

  stats = stats.reduce((acc, curr) => {
    const { status, count } = curr;
    acc[status] = count;
    return acc;
  }, {});

  const defaultStats = {
    pending: stats.pending || 0,
    interview: stats.interview || 0,
    declined: stats.declined || 0,
  };

  let monthlyApplications = await Job.findAll({
    attributes: [
      [sequelize.fn("YEAR", sequelize.col("createdAt")), "year"],
      [sequelize.fn("MONTH", sequelize.col("createdAt")), "month"],
      [sequelize.fn("COUNT", sequelize.col("id")), "count"],
    ],
    group: [sequelize.fn("YEAR", sequelize.col("createdAt")), sequelize.fn("MONTH", sequelize.col("createdAt"))],
    order: [
      [sequelize.fn("YEAR", sequelize.col("createdAt")), "DESC"],
      [sequelize.fn("MONTH", sequelize.col("createdAt")), "DESC"],
    ],
    limit: 6,
    raw: true,
  });

  monthlyApplications = monthlyApplications
    .map((item) => {
      const { year, month, count } = item;
      const date = moment()
        .month(month - 1)
        .year(year)
        .format("MMM Y");
      return { date, count };
    })
    .reverse();

  res.status(StatusCodes.OK).json({ defaultStats, monthlyApplications });
};

module.exports = {
  getAllJobs,
  getJob,
  createJob,
  updateJob,
  deleteJob,
  showStats,
};
