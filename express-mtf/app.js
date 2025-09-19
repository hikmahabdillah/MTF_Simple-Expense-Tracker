// app.js
const express = require("express");
const app = express();
const errorHandler = require("./src/core/utils/errorHandler");

// Middleware
app.use(express.json());

// Routes
app.use("/api/auth", require("./src/features/auth/auth.routes"));
app.use(
  "/api/transactions",
  require("./src/features/transactions/transactions.routes")
);

// Error handler
app.use(errorHandler);

module.exports = app;
