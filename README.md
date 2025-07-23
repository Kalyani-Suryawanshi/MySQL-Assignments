# 📘 MySQL Assignments – Classic Models DB

This repository contains **day-wise SQL assignments** focused on core and advanced SQL concepts using the **Classic Models** sample database. It is designed for learners and aspiring professionals preparing for roles like **SQL Developer**, **Data Analyst**, and **Data Engineer**.

---

## ✅ What's Included

Each assignment covers a major SQL concept, and files include:

- 📄 Assignment Questions  
- 🧾 SQL Query Solutions  

---

## 📚 Topics Covered

- SELECT, WHERE, AND, LIKE, DISTINCT  
- CASE statements for segmentation  
- GROUP BY, HAVING, and aggregation  
- JOINS and SELF JOINS  
- DDL Commands: CREATE, ALTER, RENAME  
- Constraints: PRIMARY KEY, FOREIGN KEY, CHECK, NOT NULL, UNIQUE  
- Views  
- Stored Procedures with parameters  
- Window Functions: RANK, DENSE_RANK, LEAD, LAG  
- Subqueries  
- Error Handling  
- Triggers  

---

## 📝 Assignment Questions Overview

---

### 🔹 SELECT Clause

1. Fetch employee number, first name, and last name for Sales Reps reporting to employee number 1102.
   
3. Show unique `productLine` values ending with the word **cars** from the `products` table.

---

### 🔹 CASE Statement Segmentation

Segment customers based on country:  
- **North America**: USA or Canada  
- **Europe**: UK, France, Germany  
- **Other**: All remaining countries  
> Output: customerNumber, customerName, CustomerSegment

---

### 🔹 GROUP BY, Aggregation, and Date Functions

1. Top 10 products by total ordered quantity (`OrderDetails` table).  
2. Count monthly payments and show only those months with more than 20 payments (`Payments` table).

---

### 🔹 Table Creation with Constraints

- **Customers Table**:
  - `customer_id` (PK, AUTO_INCREMENT)  
  - `first_name`, `last_name` (NOT NULL)  
  - `email` (UNIQUE), `phone_number`

- **Orders Table**:
  - `order_id` (PK, AUTO_INCREMENT)  
  - `customer_id` (FK), `order_date`, `total_amount` (CHECK > 0)

---

### 🔹 JOINS & SELF JOIN

- Top 5 countries by order count using `Customers` and `Orders` tables.  
- Use a self join to show employees and their managers from the `project` table.

---

### 🔹 DDL Commands

- Create `facility` table and:
  - Add `PRIMARY KEY` and `AUTO_INCREMENT` to `Facility_ID`  
  - Add a non-null `city` column after `name`

---

### 🔹 SQL Views

Create view `product_category_sales` showing:
- `productLine`  
- `total_sales` = `quantity * priceEach`  
- `number_of_orders`  
> Use: `products`, `orders`, `orderDetails`, `productLines`

---

### 🔹 Stored Procedure

- `Get_country_payments(year, country)`  
- Output: total payment amount (formatted in thousands, K)  
> Tables: `Customers`, `Payments`

---

### 🔹 Window Functions

1. Rank customers by order frequency.  
2. Calculate year-wise, month-wise order count and YoY % change (no decimals, % sign).  
> Table: `Orders`

---

### 🔹 Subqueries

- Count how many product lines have `buyPrice` greater than average `buyPrice`.

---

### 🔹 Error Handling

- Create `Emp_EH` table  
- Write a procedure to insert values with exception handling  
> Show “Error occurred” on failure

---

### 🔹 Triggers

- Create `Emp_BIT` table with fields: `Name`, `Occupation`, `Working_date`, `Working_hours`  
- Write a **BEFORE INSERT trigger** to convert any negative `Working_hours` to positive.

---

## 🎯 Ideal For

This repository is ideal for:
- SQL learners
- Final-year students
- Entry-level job seekers in Data/SQL roles
- Interview preparation and revision

---

