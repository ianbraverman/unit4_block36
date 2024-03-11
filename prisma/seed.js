const prisma = require("../prisma/index.js");

const seed = async (number = 10) => {
  for (let i = 1; i < number; i++) {
    await prisma.user.upsert({
      where: { id: i },
      update: {},
      create: {
        username: `user${i}`,
        password: `password${i}`,
      },
    });
    await prisma.product.upsert({
      where: { id: i },
      update: {},
      create: {
        name: `Product ${i}`,
      },
    });
    await prisma.favorite.upsert({
      where: { id: i },
      update: {},
      create: {
        product_Id: i,
        user_Id: i,
      },
    });
  }
};
seed()
  .then(async () => await prisma.$disconnect())
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
