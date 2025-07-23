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

     <img width="322" height="156" alt="image" src="https://github.com/user-attachments/assets/47361bca-9105-4ef8-a892-f39180590948" />
   
2. Show unique `productLine` values ending with the word **cars** from the `products` table.

     <img width="209" height="77" alt="image" src="https://github.com/user-attachments/assets/8c9f14eb-ab39-4361-9224-816c0be0867b" />


---

### 🔹 CASE Statement Segmentation

Segment customers based on country:  
- **North America**: USA or Canada  
- **Europe**: UK, France, Germany  
- **Other**: All remaining countries  
> Output: customerNumber, customerName, CustomerSegment

Expected Output :

   <img width="453" height="322" alt="image" src="https://github.com/user-attachments/assets/52ce0e0b-7f0a-4f9d-a723-fe3edbb602b9" />

---

### 🔹 GROUP BY, Aggregation, and Date Functions

1. Top 10 products by total ordered quantity (`OrderDetails` table).

 Expected output:
   <img width="232" height="236" alt="image" src="https://github.com/user-attachments/assets/784b6f9f-493f-4faf-ba28-79c701ce2034" />

2. Count monthly payments and show only those months with more than 20 payments (`Payments` table).

 Expected output:
    <img width="268" height="147" alt="image" src="https://github.com/user-attachments/assets/031d3cb6-83dc-48e1-b6d5-8b5a26014fd8" />


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

1. Top 5 countries by order count using `Customers` and `Orders` tables.

 Expected Ouptput :
   <img width="231" height="145" alt="image" src="https://github.com/user-attachments/assets/e545d0ec-a74f-4520-bf14-282537704613" />

SELF JOIN – Employee & Manager Relationship

Create a table named project with the following fields:
EmployeeID – INT, set as the PRIMARY KEY and AUTO_INCREMENT
FullName – VARCHAR(50), NOT NULL
Gender – Accept only values 'Male' or 'Female'
ManagerID – INT (can be NULL)

Add below data into it. 
   <img width="352" height="172" alt="image" src="https://github.com/user-attachments/assets/9c25340f-4a8e-4c7e-a42b-1bef4a07fc5d" />

Find out the names of employees and their related managers.
Expected output:
   <img width="282" height="173" alt="image" src="https://github.com/user-attachments/assets/eee8a042-2262-40e0-89ba-da675dc19304" />

---

### 🔹 DDL Commands

Create a table named facility with the following fields:
- Facility_ID
- Name
- State
- Country
Alter the table:
i) Add PRIMARY KEY and AUTO_INCREMENT to the Facility_ID column
ii) Add a new column city after name with data type VARCHAR, which should not accept NULL values
   <img width="1003" height="148" alt="image" src="https://github.com/user-attachments/assets/b75dba81-dc17-4da5-b9f9-1b922c2168f8" />

---

### 🔹 SQL Views

Create view `product_category_sales` showing:
- `productLine`  
- `total_sales` = `quantity * priceEach`  
- `number_of_orders`  
> Use: `products`, `orders`, `orderDetails`, `productLines`

The view when read should show the output as:
   <img width="381" height="177" alt="image" src="https://github.com/user-attachments/assets/b25adf44-cff8-4f9d-a64d-598ce56b70a9" />


---

### 🔹 Stored Procedure

- `Get_country_payments(year, country)`  
- Output: total payment amount (formatted in thousands, K)  
> Tables: `Customers`, `Payments`

Expected Output:
   <img width="406" height="61" alt="image" src="https://github.com/user-attachments/assets/23d3deb5-3bb2-4959-8708-ba83bc67ab5b" />

---

### 🔹 Window Functions

1. Rank customers by order frequency.

Expected Order:
   <img width="590" height="279" alt="image" src="https://github.com/user-attachments/assets/84fb6d93-e4be-412d-ad32-db87a89121be" />

3. Calculate year-wise, month-wise order count and YoY % change (no decimals, % sign).  
> Table: `Orders`
Expected Ouptput:
   <img width="501" height="372" alt="image" src="https://github.com/user-attachments/assets/9d2b5a04-5c6f-455d-be6c-84c5a7098e8e" />


---

### 🔹 Subqueries

- Count how many product lines have `buyPrice` greater than average `buyPrice`.
Expected Output:
     <img width="262" height="193" alt="image" src="https://github.com/user-attachments/assets/d7ded880-bfe8-4c2e-a2a3-85f90a140a92" />

---

### 🔹 Error Handling

**1. Create the table `Emp_EH`. Below are its fields.**

- EmpID (Primary Key)  
- EmpName  
- EmailAddress  

**Create a procedure to accept the values for the columns in `Emp_EH`. Handle the error using exception handling concept. Show the message as “Error occurred” in case of anything wrong.**

---

### 🔹 Triggers

**1. Create the table `Emp_BIT`. Add the below fields in it:**

- **Name**
- **Occupation**
- **Working_date**
- **Working_hours**

**Insert the data as shown in the below query:**

```sql
INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),
('Warner', 'Engineer', '2020-10-04', 10),
('Peter', 'Actor', '2020-10-04', 13),
('Marco', 'Doctor', '2020-10-04', 14),
('Brayden', 'Teacher', '2020-10-04', 12),
('Antonio', 'Business', '2020-10-04', 11);


