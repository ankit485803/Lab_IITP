

-- 28th Feb 2025 (Friday) Lab on Relational Algebra and Relational Calculus, SQL 

-- create a database for library management system with table: Books, Borrow, Supplied_By, Supplier, Users


CREATE DATABASE libraryManagementSystem;

USE libraryManagementSystem;
CREATE TABLE books (
	Account_No INT PRIMARY KEY,
    Year_of_Pub INT,
    Title VARCHAR(100)
);

CREATE TABLE borrow (
	Acc_No INT PRIMARY KEY,
    Card_No INT,
    DOI INT
);

CREATE TABLE supplied_By (
	S_Name VARCHAR(50),
    Acc_No INT,
    Date_of_Supply DATE
);

CREATE TABLE supplier (
	S_Name VARCHAR(50),
    address VARCHAR(50)
);

CREATE TABLE users (
	card_no INT UNIQUE,
    B_Name VARCHAR(50),
    B_Address VARCHAR(50)
);











