/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "MemberRole" AS ENUM ('ADMIN', 'MODERATOR', 'GUEST');

-- CreateEnum
CREATE TYPE "ChannelType" AS ENUM ('TEXT', 'AUDIO', 'VIDEO');

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Profile" (
    "id" STRING NOT NULL,
    "UserId" STRING NOT NULL,
    "name" STRING NOT NULL,
    "imageUrl" STRING NOT NULL,
    "email" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Server" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "imageUrl" STRING NOT NULL,
    "inviteCode" STRING NOT NULL,
    "profileId" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Server_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Member" (
    "id" STRING NOT NULL,
    "role" "MemberRole" NOT NULL DEFAULT 'GUEST',
    "profileId" STRING NOT NULL,
    "serverId" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Member_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Channel" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "type" "ChannelType" NOT NULL DEFAULT 'TEXT',
    "profileId" STRING NOT NULL,
    "serverId" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Channel_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile_UserId_key" ON "Profile"("UserId");

-- CreateIndex
CREATE INDEX "Server_profileId_idx" ON "Server"("profileId");

-- CreateIndex
CREATE INDEX "Member_profileId_idx" ON "Member"("profileId");

-- CreateIndex
CREATE INDEX "Member_serverId_idx" ON "Member"("serverId");

-- CreateIndex
CREATE INDEX "Channel_profileId_idx" ON "Channel"("profileId");

-- CreateIndex
CREATE INDEX "Channel_serverId_idx" ON "Channel"("serverId");

-- AddForeignKey
ALTER TABLE "Server" ADD CONSTRAINT "Server_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Member" ADD CONSTRAINT "Member_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Member" ADD CONSTRAINT "Member_serverId_fkey" FOREIGN KEY ("serverId") REFERENCES "Server"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Channel" ADD CONSTRAINT "Channel_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "Profile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Channel" ADD CONSTRAINT "Channel_serverId_fkey" FOREIGN KEY ("serverId") REFERENCES "Server"("id") ON DELETE CASCADE ON UPDATE CASCADE;
