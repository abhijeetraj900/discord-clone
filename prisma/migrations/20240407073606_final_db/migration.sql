-- AlterTable
ALTER TABLE "DirectMessage" ALTER COLUMN "fileUrl" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Message" ALTER COLUMN "fileUrl" DROP NOT NULL;
