/*
  Warnings:

  - You are about to drop the column `userId` on the `cache` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `cache` DROP FOREIGN KEY `Cache_userId_fkey`;

-- DropIndex
DROP INDEX `Cache_userId_fkey` ON `cache`;

-- AlterTable
ALTER TABLE `cache` DROP COLUMN `userId`,
    ADD COLUMN `city` VARCHAR(255) NOT NULL DEFAULT 'Unknown City',
    ADD COLUMN `country` VARCHAR(255) NOT NULL DEFAULT 'Unknown Country';
