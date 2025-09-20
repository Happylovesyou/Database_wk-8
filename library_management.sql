-- ===========================================
-- LIBRARY MANAGEMENT SYSTEM DATABASE
-- ===========================================

-- 1. Create the database
CREATE DATABASE library_db;

-- Use the database
USE library_db;

-- ===========================================
-- 2. Create Tables
-- ===========================================

-- Table: Members (people who borrow books)
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,  -- unique ID for each member
    first_name VARCHAR(50) NOT NULL,           -- member's first name
    last_name VARCHAR(50) NOT NULL,            -- member's last name
    email VARCHAR(100) UNIQUE NOT NULL,        -- email must be unique
    phone VARCHAR(20),                         -- optional phone number
    join_date DATE NOT NULL                    -- date when the member joined
);

-- Table: Authors (book writers)
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,  -- unique ID for each author
    name VARCHAR(100) NOT NULL                 -- author's full name
);

-- Table: Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,     -- unique ID for each book
    title VARCHAR(150) NOT NULL,                -- book title
    isbn VARCHAR(20) UNIQUE NOT NULL,           -- unique book ISBN
    published_year YEAR,                        -- year the book was published
    author_id INT NOT NULL,                     -- foreign key → Authors table

    -- relationship: each book is written by 1 author
    CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Table: Loans (records of members borrowing books)
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,    -- unique ID for each loan
    member_id INT NOT NULL,                    -- foreign key → Members
    book_id INT NOT NULL,                      -- foreign key → Books
    loan_date DATE NOT NULL,                   -- when the book was borrowed
    due_date DATE NOT NULL,                    -- when the book should be returned
    return_date DATE,                          -- actual return date (nullable)

    -- relationships
    CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES Members(member_id),
    CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- ===========================================
-- 3. Example Relationships
-- ===========================================
-- One-to-Many:
--   One Author → Many Books
--   One Member → Many Loans
--
-- Many-to-Many (resolved with Loans table):
--   Many Members ↔ Many Books
--
-- Example: If Rose borrows 2 books, there will be 2 rows in the Loans table.

-- ===========================================
-- 4. Sample Data (optional, for testing)
-- ===========================================

-- Insert Authors
INSERT INTO Authors (name) VALUES
('Chinua Achebe'),
('Ngugi wa Thiong\'o'),
('J.K. Rowling');

-- Insert Members
INSERT INTO Members (first_name, last_name, email, phone, join_date) VALUES
('Rose', 'Maina', 'rose@example.com', '0712345678', '2024-01-15'),
('John', 'Doe', 'john@example.com', '0798765432', '2024-02-10');

-- Insert Books
INSERT INTO Books (title, isbn, published_year, author_id) VALUES
('Things Fall Apart', 'ISBN12345', 1958, 1),
('The Wizard of Oz', 'ISBN67890', 1900, 2),
('Harry Potter and the Philosopher\'s Stone', 'ISBN11111', 1997, 3);

-- Insert Loans
INSERT INTO Loans (member_id, book_id, loan_date, due_date, return_date) VALUES
(1, 1, '2025-09-01', '2025-09-15', NULL), -- Rose borrowed "Things Fall Apart"
(2, 3, '2025-09-05', '2025-09-20', NULL); -- John borrowed "Harry Potter"

-- ===========================================
-- END OF FILE
-- ===========================================
