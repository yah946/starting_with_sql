# SQL Documentation — Concepts & Commands

## 1. Data & Metadata

**Data:** Raw information.  
**Metadata:** Information describing data (types, keys, schema…).

---

## 2. Entities, Attributes & Relationships

- **Strong Entity:** Independent (Product, Patient)
- **Weak Entity:** Depends on another (Order Items)
- **Attribute Types:**
  - Simple
  - Composite
  - Multivalued
  - Derived

---

## 3. Database Commands

```sql
CREATE DATABASE hospital;
USE hospital;
CREATE DATABASE IF NOT EXISTS hospital CHARACTER SET utf8;
SHOW DATABASES;
DROP DATABASE hospital;
```

---

## 4. Datatypes

- String: VARCHAR, TEXT
- Numeric: INT, FLOAT
- JSON
- Date & Time: DATE, TIME, DATETIME

---

## 5. CRUD Operations

### SELECT (Read)

```sql
SELECT column FROM table;
SELECT first_name AS FirstName FROM employees;
SELECT salary * 1.15 AS SalaryAfterBonus FROM employees;
SELECT * FROM employees;
```

### WHERE

```sql
SELECT * FROM Products WHERE ProductName LIKE 'Ch%';
SELECT productName FROM Products WHERE UnitPrice BETWEEN 10 AND 20;
```

---

## 6. INSERT (Create)

```sql
INSERT INTO employees (FirstName, LastName, City)
VALUES ('Ali','Hassan','Fes');
```

---

## 7. UPDATE

```sql
UPDATE products SET unitprice = 25 WHERE productName = 'Chai';
```

---

## 8. DELETE

```sql
DELETE FROM table WHERE condition;
```

Transactions:

```sql
BEGIN TRANSACTION;
DELETE FROM table WHERE condition;
ROLLBACK; -- or COMMIT;
```

---

## 9. DISTINCT & ORDER BY

```sql
SELECT DISTINCT country FROM Suppliers ORDER BY country;
SELECT productName, UnitPrice FROM Products ORDER BY UnitPrice DESC;
```

---

## 10. LIMIT & OFFSET

```sql
SELECT * FROM Products ORDER BY UnitPrice DESC LIMIT 3;
SELECT * FROM Orders ORDER BY OrderDate LIMIT 5 OFFSET 10;
```

---

## 11. Aggregate Functions

```sql
SELECT COUNT(*), SUM(freight), AVG(freight), MAX(freight), MIN(freight)
FROM Orders;
```

---

## 12. GROUP BY & HAVING

```sql
SELECT CustomerID, COUNT(OrderID)
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 140;
```

---

## 13. Working with NULL

```sql
SELECT * FROM Customers WHERE Region IS NULL;
SELECT * FROM Customers WHERE Region IS NOT NULL;
```

---

## 14. Formatting (printf & strftime)

```sql
SELECT printf('%.2f USD', UnitPrice) FROM Products;
SELECT strftime('%d/%m/%Y', OrderDate) FROM Orders;
```

---

## 15. CASE Expression

```sql
CASE
  WHEN Freight IS NULL THEN 'Unknown'
  WHEN Freight BETWEEN 0 AND 10 THEN '0-10'
  ELSE '>10'
END AS FreightRange
```

---

## 16. Keys & Constraints

### Primary Key

```sql
CREATE TABLE etudiant (
  cne VARCHAR(50) PRIMARY KEY
);
```

### Foreign Key

```sql
CREATE TABLE groupe (
  id INT PRIMARY KEY
);

CREATE TABLE etudiant (
  cne VARCHAR(50) PRIMARY KEY,
  groupe_id INT,
  FOREIGN KEY (groupe_id) REFERENCES groupe(id)
);
```

---

## 17. Joins

### INNER JOIN

```sql
SELECT Customers.CustomerID, Orders.OrderID
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
```

### Multi-Join

```sql
SELECT
  Customers.CompanyName AS Customer,
  Orders.OrderID,
  CONCAT(Employees.FirstName, ' ', Employees.LastName) AS Employee
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;
```

---

## Popular Errors

- Missing **ON** in JOIN
- Missing table prefix: `Orders.OrderID`

---

**End of documentation.**

