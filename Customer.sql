-- Create the "bank" database (if it doesn't already exist)
CREATE DATABASE IF NOT EXISTS bank;

-- Use the "bank" database
USE bank;

-- table for customer login 
CREATE TABLE customerTable(
	firstName varchar(255),
    lastName  varchar(255),
    userId    int PRIMARY KEY AUTO_INCREMENT,
    password  varchar(255) 
);
SELECT
	firstName AS "First Name",
    lastName  AS "Last Name",
    userID    AS "UserId",
    password  AS "PassWord"
FROM customerTable;

-- table for the account for each customer
-- customers to accounts has a 1 to many relationship
CREATE TABLE accounts
(
	userId       int,
    accountNum   int PRIMARY KEY AUTO_INCREMENT,
    routingNum   int,
    statementId  int,
	FOREIGN KEY (statementId) REFERENCES statements(statementId),
	FOREIGN KEY (userId) REFERENCES customerTable(userId)
);

SELECT
	userId      AS "User Id",
    accountNum  AS "Account Number",
    routingNum  AS "Routing Number",
    statementId AS "Statement ID"
FROM accounts;

CREATE TABLE statements
(
	
    statementId    int PRIMARY KEY AUTO_INCREMENT,
    currentBalance float,
    withdrawAmount float,
    depositAmount  float,
    dateOfOccasion DATE NOT NULL,
    theDescription varchar(255),
    userId         varchar(255)
);

SELECT
	statementId    as "Statement Id",
    currentBalance as "Current Balance",
    withdrawAmount as "Withdrawal Balance",
    depositAmount  as "Deposit Balance",
    dateOfOccasion as "Date",
    theDescription as "Description",
    userId         as "User Id"
From statements;


drop table accounts;
drop table statements;
drop table customerTable;
    