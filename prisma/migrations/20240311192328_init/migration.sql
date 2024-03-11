-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Favorite" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_Id" INTEGER NOT NULL,
    "product_Id" INTEGER NOT NULL,
    CONSTRAINT "Favorite_user_Id_fkey" FOREIGN KEY ("user_Id") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Favorite_product_Id_fkey" FOREIGN KEY ("product_Id") REFERENCES "Product" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
