CREATE DATABASE company;
USE company;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Subqueries
SELECT CustomerName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Orders
    WHERE OrderAmount > 200
);
-- Nested subqueries
SELECT CustomerName, OrderAmount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE OrderAmount > (
    SELECT AVG(OrderAmount)
    FROM Orders
);