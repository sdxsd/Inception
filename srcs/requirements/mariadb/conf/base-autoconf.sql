-- Creates the LetterCrunch database if it doesn't already exist.
-- Then specifies that it should be used going forward.
CREATE DATABASE IF NOT EXISTS LetterCrunch;
USE LetterCrunch;

-- The Dockerfile will substitute PASSWD and USRNAME with data provided by the .env file.
CREATE USER IF NOT EXISTS 'USRNAME'@'localhost' IDENTIFIED BY 'PASSWD';
-- Grants all privileges: SELECT, INSERT, DELETE, DROP, etc.. to the user created above.
GRANT ALL PRIVILEGES ON LetterCrunch.* TO 'USRNAME'@'localhost';
-- Applies the granting of privilege.
FLUSH PRIVILEGES;

-- Creating the regular user.
CREATE USER IF NOT EXISTS 'REG_USRNAME'@'localhost' IDENTIFIED BY 'REG_PASSWD';
GRANT SELECT PRIVILEGES ON LetterCrunch.* to 'REG_USRNAME'@'localhost';
FLUSH PRIVILEGES;
