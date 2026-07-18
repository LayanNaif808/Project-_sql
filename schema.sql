-- =========================================================
-- 1. DATABASE CREATION
-- =========================================================
CREATE DATABASE SmallStoreDB;
USE SmallStoreDB;

-- =========================================================
-- 2. TABLES CREATION (3-4 Related Tables)
-- =========================================================

-- Table A: Customers (العملاء)
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(50)
);

-- Table B: Products (المنتجات)
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0
);

-- Table C: Orders (الطلبات - One-to-Many with Customers)
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Table D: Order_Details (تفاصيل الطلب - Many-to-Many Junction Table)
CREATE TABLE Order_Details (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);

-- =========================================================
-- 3. STORED PROCEDURE
-- =========================================================
-- Procedure to retrieve orders for a specific customer by their ID
DELIMITER //

CREATE PROCEDURE GetCustomerOrders(IN p_customer_id INT)
BEGIN
    SELECT o.order_id, o.order_date, o.total_amount 
    FROM Orders o
    WHERE o.customer_id = p_customer_id;
END //

DELIMITER ;

-- =========================================================
-- 4. INDEX CREATION
-- =========================================================
-- Create an index to speed up searches by product name
CREATE INDEX idx_product_name ON Products(product_name);

