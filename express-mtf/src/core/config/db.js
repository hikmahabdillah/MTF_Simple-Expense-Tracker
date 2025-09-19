// db.js (Prisma MySQL connection)
const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

const connectDB = async () => {
  try {
    await prisma.$connect();
    console.log("MySQL (Prisma) connected");
  } catch (err) {
    console.error("MySQL (Prisma) connection error:", err);
    process.exit(1);
  }
};

module.exports = connectDB;
module.exports.prisma = prisma;
