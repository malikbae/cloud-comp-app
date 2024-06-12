const { DataTypes } = require("sequelize");
const db = require("../db/connect");
const User = require("./User");

const Job = db.define("jobs", {
  company: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      notNull: {
        msg: "Please provide company name",
      },
      notEmpty: {
        msg: "Please provide company name",
      },
      max: 50,
    },
  },
  position: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      notNull: {
        msg: "Please provide position",
      },
      notEmpty: {
        msg: "Please provide position",
      },
      max: 100,
    },
  },
  status: {
    type: DataTypes.ENUM("interview", "declined", "pending"),
    allowNull: false,
    defaultValue: "pending",
  },
  createdBy: {
    type: DataTypes.INTEGER,
    allowNull: false,
    validate: {
      notNull: {
        msg: "Please provide user",
      },
      notEmpty: {
        msg: "Please provide user",
      },
    },
  },
  jobType: {
    type: DataTypes.ENUM("full-time", "part-time", "remote", "internship"),
    allowNull: false,
    defaultValue: "full-time",
  },
  jobLocation: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: "my city",
    validate: {
      max: 20,
    },
  },
});

Job.belongsTo(User, { foreignKey: "createdBy" });
User.hasMany(Job, { foreignKey: "createdBy", onDelete: "CASCADE" });

module.exports = Job;
