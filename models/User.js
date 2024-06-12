const { DataTypes } = require("sequelize");
const db = require("../db/connect");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const User = db.define("users", {
  name: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      notNull: {
        msg: "Please provide name",
      },
      notEmpty: {
        msg: "Please provide name",
      },
      len: [3, 50],
    },
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
    validate: {
      notNull: {
        msg: "Please provide email",
      },
      notEmpty: {
        msg: "Please provide email",
      },
      is: {
        args: /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
        msg: "Please provide valid email",
      },
    },
  },
  password: {
    type: DataTypes.STRING,
    allowNull: false,
    validate: {
      notNull: {
        msg: "Please provide password",
      },
      notEmpty: {
        msg: "Please provide password",
      },
      min: 6,
    },
  },
  lastName: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: "lastname",
    validate: {
      max: 20,
    },
  },
  location: {
    type: DataTypes.STRING,
    allowNull: false,
    defaultValue: "my city",
    validate: {
      max: 20,
    },
  },
});

User.beforeCreate(async (user) => {
  try {
    const salt = await bcrypt.genSalt(10);
    user.password = await bcrypt.hash(user.password, salt);
  } catch (error) {
    console.log(error);
  }
});

User.prototype.createJWT = function () {
  return jwt.sign({ userId: this.id, name: this.name }, process.env.JWT_SECRET, { expiresIn: process.env.JWT_LIFETIME });
};

User.prototype.comparePassword = async function (candidatePassword) {
  const isMatch = await bcrypt.compare(candidatePassword, this.password);
  return isMatch;
};

module.exports = User;
