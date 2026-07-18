USE SmallStoreDB;

-- =========================================================
-- 1. POPULATING SAMPLE DATA (English Only)
-- =========================================================

-- Insert Customers
INSERT INTO Customers (customer_name, email, city) VALUES
('Layan Naif', 'layan@email.com', 'Jeddah'),
('Ahmad Ali', 'ahmad@email.com', 'Riyadh'),
('Sara Omar', 'sara@email.com', 'Dammam'),
('Khaled Fahad', 'khaled@email.com', 'Jeddah');

-- Insert Products
INSERT INTO Products (product_name, price, stock) VALUES
('Laptop', 3500.00, 10),
('Smartphone', 1800.00, 25),
('Headphones', 150.00, 50),
('Keyboard', 100.00, 30);

-- Insert Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2026-07-10', 3650.00),
(2, '2026-07-11', 1800.00),
(1, '2026-07-12', 150.00),
(3, '2026-07-13', 1950.00);

-- Insert Order Details
INSERT INTO Order_Details (order_id, product_id, quantity) VALUES
(1, 1, 1), 
(1, 3, 1), 
(2, 2, 1), 
(3, 3, 1), 
(4, 2, 1), 
(4, 3, 1); 


-- =========================================================
-- 2. THE 5 REQUIRED QUERIES
-- =========================================================

-- Query 1: JOIN (Retrieve order details with Customer Names)
SELECT o.order_id, c.customer_name, o.order_date, o.total_amount
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- Query 2: Aggregate Function (COUNT) - Get total number of orders placed
SELECT COUNT(*) AS 'Total Orders Placed' 
FROM Orders;

-- Query 3: Aggregate Function (SUM) - Calculate total sales revenue
SELECT SUM(total_amount) AS 'Total Sales Revenue' 
FROM Orders;

-- Query 4: Aggregate Function (AVG) - Calculate average price of products
SELECT AVG(price) AS 'Average Product Price' 
FROM Products;

-- Query 5: GROUP BY - Get total spending by city
SELECT c.city, SUM(o.total_amount) AS 'Total Revenue Per City'
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.city;


-- =========================================================
-- 3. CALL THE PROCEDURE (TESTING)
-- =========================================================
-- Call our created procedure to show orders of Customer ID 1 (Layan)
CALL GetCustomerOrders(1);
