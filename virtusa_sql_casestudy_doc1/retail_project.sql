CREATE TABLE Customers (
customer_id INT PRIMARY KEY,
name VARCHAR(100),
city VARCHAR(50));

CREATE TABLE Products (
product_id INT PRIMARY KEY,
name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2));

 CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
date DATE,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id));

CREATE TABLE Order_Items (
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (product_id) REFERENCES Products(product_id));

INSERT INTO Customers VALUES
(1, 'Prasanna', 'Vizag'),
(2, 'Rahul', 'Hyderabad'),
(3, 'Anjali', 'Delhi');



INSERT INTO Products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Phone', 'Electronics', 20000),
(103, 'Shoes', 'Fashion', 2000);


INSERT INTO Orders VALUES
(1, 1, '2026-04-01'),
(2, 2, '2026-04-02'),
(3, 1, '2026-04-05');


 INSERT INTO Order_Items VALUES
(1, 101, 1),
(1, 103, 2),
(2, 102, 1),
(3, 103, 3);

SELECT p.name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC;


SELECT c.name, SUM(p.price * oi.quantity) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;


SELECT MONTH(o.date) AS month,
SUM(p.price * oi.quantity) AS revenue
FROM Orders o
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
GROUP BY MONTH(o.date);

SELECT p.category, SUM(oi.quantity) AS total_sales
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.category;

SELECT name
FROM Customers
WHERE customer_id NOT IN (
SELECT DISTINCT customer_id FROM Orders);

