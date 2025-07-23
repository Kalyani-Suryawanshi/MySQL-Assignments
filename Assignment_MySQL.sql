use classicmodels;

# SELECT clause with WHERE, AND,DISTINCT, Wild Card (LIKE)
/* 1.Fetch the employee number, first name and last name of those employees who are working
as Sales Rep reporting to employee with employeenumber 1102 (Refer employee table)*/

select employeeNumber, firstName, lastName from employees 
where jobTitle = "Sales Rep" and reportsTo = 1102;


/* 2.Show the unique productline values containing the word cars at the end from the products table.*/

select distinct(productline) from products
where productline like "%cars";

#CASE STATEMENTS for Segmentation
/*1. Using a CASE statement, segment customers into three categories based on their 
country:(Refer Customers table)
"North America" for customers from USA or Canada 
"Europe" for customers from UK, France, or Germany
"Other" for all remaining countries 
Select the customerNumber, customerName, and the assigned region as "CustomerSegment".*/

select customernumber, customername, case
when country in("USA","Canada") then "North America"
when country in("UK","France","German") then "Europe"
else "Other"
end as "CustomerSegment"
from customers ;


/* Group By with Aggregation functions and Having clause, Date and Time functions
1. Using the OrderDetails table, identify the top 10 products (by productCode) 
with the highest total order quantity across all orders. */

select productcode, sum(quantityordered) as total_ordered 
from orderdetails group by productcode order by  total_ordered desc limit 10;

/* 2.Company wants to analyze payment frequency by month. Extract the month name from the payment 
date to count the total number of payments for each month and include only 
those months with a payment count exceeding 20 (Refer Payments table). */

select monthname(paymentDate) as payment_month , count(*) as num_payments 
from payments group by payment_month having num_payments > 20;

/*CONSTRAINTS: Primary, key, foreign key, Unique, check, not null, default
1.Create a new database named and Customers_Orders and add the following tables as per the description
a.Create a table named Customers to store customer information. 
Include the following columns:
customer_id: This should be an integer set as the PRIMARY KEY and AUTO_INCREMENT.
first_name: This should be a VARCHAR(50) to store the customer's first name.
last_name: This should be a VARCHAR(50) to store the customer's last name.
email: This should be a VARCHAR(255) set as UNIQUE to ensure no duplicate email addresses exist.
phone_number: This can be a VARCHAR(20) to allow for different phone number formats.
Add a NOT NULL constraint to the first_name and last_name columns to ensure they always have a value.
*/

create database customers_orders ;

use customers_orders ;

create table customers(
customer_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(255) unique,
phone_number varchar(20));

select * from customers ;

/*b.Create a table named Orders to store information about customer orders. 
Include the following columns:
order_id: This should be an integer set as the PRIMARY KEY and AUTO_INCREMENT.
customer_id: This should be an integer referencing the customer_id in the Customers table (FOREIGN KEY).
order_date: This should be a DATE data type to store the order date.
total_amount: This should be a DECIMAL(10,2) to store the total order amount.
Constraints:
a)Set a FOREIGN KEY constraint on customer_id to reference the Customers table.
b)Add a CHECK constraint to ensure the total_amount is always a positive value.
*/

create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date,
total_amount decimal(10,2) check(total_amount > 0),
foreign key(customer_id) 
references customers(customer_id));

select * from orders ;

/*JOINS
1.List the top 5 countries (by order count) that Classic Models ships to. 
(Use the Customers and Orders tables)
*/

use classicmodels;

select country, count(orderNumber) as order_count from customers 
inner join 
orders using(customerNumber) group by country order by order_count desc limit 5 ;


/* 2.Create a table project with below fields.
●EmployeeID : integer set as the PRIMARY KEY and AUTO_INCREMENT.
●FullName: varchar(50) with no null values
●Gender : Values should be only ‘Male’ or ‘Female’
●ManagerID: integer
Add below data into it.
Find out the names of employees and their related managers */


create table project(
employeeid int primary key auto_increment,
fullname varchar(50) not null,
gender enum("male", "female"),
managerid int );


insert into project(fullname,gender,managerid) 
values("pranaya","male",3),
	  ("priyanka","female",1),
	  ("preety","female",null),
	  ("anurag","male",1),
	  ("sambit","male",1),
	  ("rajesh","male",3),
	  ("hina","female",3);
      
select * from project ;

select t1.fullname as manager_name, t2.fullname as emp_name from project t1
cross join project t2 where t1.employeeid = t2.managerid order by t1.employeeid;


/* DDL Commands: Create, Alter, Rename
1.Create table facility. Add the below fields into it.
●Facility_ID
●Name
●State
●Country */

drop table facility ;
create table facility (
facility_id int,
name varchar(100),
state varchar(100),
country varchar(100));

select * from facility;

# i) Alter the table by adding the primary key and auto increment to Facility_ID column.

alter table facility modify column facility_id int primary key auto_increment;

/*ii) Add a new column city after name with data type as varchar
 which should not accept any null values.*/

alter table facility add column city varchar(100) not null after name ;

/*Views in SQL
1.Create a view named product_category_sales that provides insights into sales performance 
by product category. 
This view should include the following information:
productLine: The category name of the product (from the ProductLines table).

total_sales: The total revenue generated by products within that category 
(calculated by summing the orderDetails.quantity * orderDetails.
priceEach for each product in the category).

number_of_orders: The total number of orders containing products from that category.

(Hint: Tables to be used: Products, orders, orderdetails and productlines)*/

use classicmodels;

create view product_category_sales as 
select productline, sum(quantityOrdered*priceEach) as total_sales, 
count(distinct ordernumber) as number_of_orders from productlines
inner join
products using(productline)
inner join 
orderdetails using(productcode)
inner join
orders using(orderNumber)
group by productline;

select * from product_category_sales;

/* Stored Procedures in SQL with parameters 
1.Create a stored procedure Get_country_payments which takes in year and country
 as inputs and gives year wise, country wise total amount as an output.
 Format the total amount to nearest thousand unit (K)
Tables: Customers, Payments*/

delimiter //
create procedure get_country_payments(in para_year int,in para_country varchar(30))
begin 
select year(paymentDate) as year, country, 
concat(round(sum(amount)/1000,0), 'K') as total_amount 
from customers 
inner join 
payments using(customernumber)
where country = para_country
and year(paymentDate) = para_year
group by year(paymentDate), country ;
end //
delimiter ;

call get_country_payments(2003,'france');


/*Window functions - Rank, dense_rank, lead and lag
1a) Using customers and orders tables, rank the customers based on their order frequency*/

select customerName, count(ordernumber) as order_count, 
RANK() OVER(order BY COUNT(orderNumber) desc) as order_frequency_rank 
from customers inner join orders using(customerNumber) 
group by customerName order by order_frequency_rank ;

/*1b) Calculate year wise, month name wise count of orders and year over year (YoY) percentage change. 
Format the YoY values in no decimals and show in % sign.
Table: Orders*/

select year(orderdate) as year, 
monthname(orderdate) as month, 
count(orderNumber) as Total_Orders, 
concat(round(((count(ordernumber) - lag(count(ordernumber),1) over()) / lag(count(ordernumber),1) over())* 100), '%') as "% YOY Change"
from Orders 
group by month, year ;

/*
Subqueries and their applications
1.Find out how many product lines are there for which the buy price value is greater than 
the average of buy price value. Show the output as product line and its count.
*/

select productline, count(productline) as count 
from products where buyprice >= 
(select avg(buyPrice) from products)
group by productline order by count(productline) desc;


/*
ERROR HANDLING in SQL
1.Create the table Emp_EH. Below are its fields.
●EmpID (Primary Key)
●EmpName
●EmailAddress
Create a procedure to accept the values for the columns in Emp_EH. 
Handle the error using exception handling concept. 
Show the message as “Error occurred” in case of anything wrong.
*/

drop procedure err_handler;
drop table emp_eh;


create table emp_eh (
empid int primary key,
empname varchar(30),
emailaddress varchar(50));

delimiter //
create procedure err_handler(in p_empid int, in p_empname varchar(30), in p_emailaddress varchar(50))
begin
	declare continue handler for sqlexception select "Error Occured" as message ;
	insert into emp_eh 
	values (p_empid,p_empname,p_emailaddress);
	select * from emp_eh ;
end //
delimiter ;

DELIMITER //
Create procedure err_handler(in p_empid int, in p_empname varchar(30), in p_emailaddress varchar(50))
Begin
     DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
     Select"Error Occured" As Message;
	 Insert into emp_eh 
     Values (p_empid, p_empname,p_emailaddress);
	 Select * from emp_eh;
     End //
delimiter ;

call err_handler(1,'a','sdh@223');
call err_handler(2,'b');
call err_handler(h,'c','abc@223');

/*TRIGGERS
1.Create the table Emp_BIT. Add below fields in it.
●Name
●Occupation
●Working_date
●Working_hours
Create before insert trigger to make sure any new value of Working_hours, 
if it is negative, then it should be inserted as positive.
*/

use classicmodels;
CREATE TABLE emp_bit (
    name VARCHAR(30),
    occupation VARCHAR(30),
    working_date DATE,
    working_hour INT
);

DELIMITER //
CREATE TRIGGER before_insert
BEFORE INSERT
ON emp_bit 
FOR EACH ROW 
BEGIN
    IF NEW.working_hour < 0 THEN 
        SET NEW.working_hour = -NEW.working_hour;
    END IF;
END //
DELIMITER ;

INSERT INTO emp_bit VALUES
('Robin', 'Scientist', '2020-10-04', 12),
('Warner', 'Engineer', '2020-10-04', 10),
('Peter', 'Actor', '2020-10-04', 13),
('Marco', 'Doctor', '2020-10-04', 14),
('Brayden', 'Teacher', '2020-10-04', 12),
('Antonio', 'Business', '2020-10-04', 11);


