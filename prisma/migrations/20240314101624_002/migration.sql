/*
  Warnings:

  - You are about to drop the column `UserId` on the `Profile` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[userId]` on the table `Profile` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userId` to the `Profile` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Profile_UserId_key";

-- AlterTable
ALTER TABLE "Profile" DROP COLUMN "UserId";
ALTER TABLE "Profile" ADD COLUMN     "userId" STRING NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Profile_userId_key" ON "Profile"("userId");
