// apiResponse.js
module.exports = (res, data, message = "Success", status = 200) => {
  res.status(status).json({
    message,
    data,
  });
};
