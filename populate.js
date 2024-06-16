require("dotenv").config();
const Job = require("./models/Job");
const mockData = require("./mock-data.json");
const { Sequelize } = require("sequelize");

const db = new Sequelize(process.env.DB_NAME, process.env.DB_USER, process.env.DB_PASSWORD, {
  host: process.env.DB_HOST,
  dialect: "mysql",
});

const start = async () => {
  try {
    await db.authenticate();
    await db.sync({ force: true });

    await Job.bulkCreate(mockData);
    console.log("Success!!!");
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

start();
