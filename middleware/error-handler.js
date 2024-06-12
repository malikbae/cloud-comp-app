const { StatusCodes } = require("http-status-codes");

const errorHandlerMiddleware = (err, req, res, next) => {
  let customError = {
    statusCode: err.statusCode || StatusCodes.INTERNAL_SERVER_ERROR,
    msg: err.message || "Something went wrong, try again later",
  };

  // if (err instanceof CustomAPIError) {
  //   return res.status(err.statusCode).json({ msg: err.message });
  // }

  if (err.name === "SequelizeValidationError") {
    customError.msg = err.errors.map((error) => error.message).join(", ");
    customError.statusCode = 400;
  }

  if (err.parent) {
    if (err.parent.errno === 1062) {
      customError.msg = `Duplicate value entered for ${err.errors[0].path} field, please choose another value`;
      customError.statusCode = 400;
    }
  }

  // return res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ err });
  return res.status(customError.statusCode).json({ msg: customError.msg });
};

module.exports = errorHandlerMiddleware;
