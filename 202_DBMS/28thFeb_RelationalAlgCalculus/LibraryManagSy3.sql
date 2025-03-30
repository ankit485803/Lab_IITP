

-- Create the library management database
CREATE DATABASE LibraryManagSy3;

USE LibraryManagSy3;

-- Create Books table
CREATE TABLE books (
    Account_No INT PRIMARY KEY,        -- Unique identifier for each book
    Year_of_Pub YEAR,                   -- Year the book was published (changed to YEAR)
    Title VARCHAR(100)                  -- Title of the book
);

-- Create Users table
CREATE TABLE users (
    card_no INT PRIMARY KEY,           -- Unique card number for each user
    B_Name VARCHAR(50),                -- User's name
    B_Address VARCHAR(255)             -- User's address (increased length for addresses)
);

-- Create Borrow table to track which books are borrowed by which users
CREATE TABLE borrow (
    Acc_No INT,                        -- Book Account Number (foreign key)
    Card_No INT,                       -- User Card Number (foreign key)
    DOI DATE,                          -- Date of Issue
    PRIMARY KEY (Acc_No, Card_No),     -- Composite primary key (book + user)
    FOREIGN KEY (Acc_No) REFERENCES books(Account_No), -- Foreign key to books
    FOREIGN KEY (Card_No) REFERENCES users(card_no)     -- Foreign key to users
);

-- Create Supplier table to store supplier information
CREATE TABLE supplier (
    S_Name VARCHAR(50) PRIMARY KEY,    -- Supplier Name (unique)
    address VARCHAR(255)               -- Supplier's address (increased length)
);

-- Create Supplied_By table to track the books supplied by a supplier
CREATE TABLE supplied_By (
    S_Name VARCHAR(50),                -- Supplier Name (foreign key)
    Acc_No INT,                        -- Book Account Number (foreign key)
    Date_of_Supply DATE,               -- Date the book was supplied
    PRIMARY KEY (S_Name, Acc_No),      -- Composite primary key (supplier + book)
    FOREIGN KEY (S_Name) REFERENCES supplier(S_Name), -- Foreign key to supplier
    FOREIGN KEY (Acc_No) REFERENCES books(Account_No)  -- Foreign key to books
);



-- Insert books
INSERT INTO books (Account_No, Year_of_Pub, Title) VALUES (1, 2000, 'The Great Machine Learning');
INSERT INTO books (Account_No, Year_of_Pub, Title) VALUES (2, 1995, 'Intro to Remote Sensing');
SELECT * FROM books;
SELECT Title FROM books WHERE Year_of_Pub = '1995';





-- Insert users
INSERT INTO users (card_no, B_Name, B_Address) VALUES (101, 'Purnasha Priya', 'Gaya Bihar');
INSERT INTO users (card_no, B_Name, B_Address) VALUES (102, 'Ankit Kumar', '851201 Khagaria Bihar India');
SELECT * FROM users;


-- Insert suppliers
INSERT INTO supplier (S_Name, address) VALUES ('Bristy Mahato', 'West Begal');
INSERT INTO supplier (S_Name, address) VALUES ('Jyotika Jayani', 'Odisha');
SELECT * FROM supplier;


-- Insert borrow records
INSERT INTO borrow (Acc_No, Card_No, DOI) VALUES (1, 101, '2025-02-28');
INSERT INTO borrow (Acc_No, Card_No, DOI) VALUES (2, 102, '2025-02-28');
SELECT * FROM borrow;


-- Insert supplied_by records
INSERT INTO supplied_By (S_Name, Acc_No, Date_of_Supply) VALUES ('Bristy Mahato', 1, '2025-02-01');
INSERT INTO supplied_By (S_Name, Acc_No, Date_of_Supply) VALUES ('Jyotika Jayani', 2, '2025-01-15');
SELECT * FROM supplied_By;


-- Ques2: Join queries to check relationships
-- Find all borrowed books with user details
SELECT b.Title, u.B_Name, br.DOI 
FROM borrow br
JOIN books b ON br.Acc_No = b.Account_No
JOIN users u ON br.Card_No = u.card_no;

-- Find all books supplied by a specific supplier
SELECT s.S_Name, b.Title, sb.Date_of_Supply
FROM supplied_By sb
JOIN supplier s ON sb.S_Name = s.S_Name
JOIN books b ON sb.Acc_No = b.Account_No;

SHOW TABLES;



