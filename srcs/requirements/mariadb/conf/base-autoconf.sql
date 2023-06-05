-- Creates the LetterCrunch database if it doesn't already exist.
-- Then specifies that it should be used going forward.
CREATE DATABASE IF NOT EXISTS lettercrunch;
USE lettercrunch;


-- The Dockerfile will substitute PASSWD and USRNAME with data provided by the .env file.
CREATE USER IF NOT EXISTS 'USRNAME'@'%' IDENTIFIED BY 'PASSWD';
-- Grants all privileges: SELECT, INSERT, DELETE, DROP, etc.. to the user created above.
GRANT ALL PRIVILEGES ON lettercrunch.* TO 'USRNAME'@'%';
-- Applies the granting of privilege.
FLUSH PRIVILEGES;

-- Creating the regular user.
CREATE USER IF NOT EXISTS 'REGVSRNAME'@'%' IDENTIFIED BY 'REGPVSSWD';
GRANT SELECT ON lettercrunch.* TO 'REGVSRNAME'@'%';
FLUSH PRIVILEGES;
