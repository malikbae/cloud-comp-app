const Job = require("./models/Job");
const mockData = require("./mock-data.json");

const start = async () => {
  try {
    await Job.bulkCreate(mockData);
    console.log("Success!!!");
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

start();
