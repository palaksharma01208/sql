DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
 
CREATE TABLE customers (
    customer_id  INT PRIMARY KEY,
    name         VARCHAR(50) NOT NULL,
    email        VARCHAR(80) UNIQUE,
    city         VARCHAR(30),
    signup_date  DATE
);
 
CREATE TABLE categories (
    category_id    INT PRIMARY KEY,
    category_name  VARCHAR(30) NOT NULL
);
 
CREATE TABLE products (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(50) NOT NULL,
    category_id   INT,
    price         DECIMAL(10,2) CHECK (price > 0),
    stock         INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
 
CREATE TABLE orders (
    order_id     INT PRIMARY KEY,
    customer_id  INT,
    order_date   DATE,
    status       VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
 
CREATE TABLE order_items (
    item_id     INT PRIMARY KEY,
    order_id    INT,
    product_id  INT,
    quantity    INT,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
 
CREATE TABLE employees (
    emp_id      INT PRIMARY KEY,
    emp_name    VARCHAR(50),
    manager_id  INT,
    department  VARCHAR(30),
    salary      INT
);
 
INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'aarav@mail.com',  'Indore', '2024-01-15'),
(2, 'Priya Verma',  'priya@mail.com',  'Bhopal', '2024-02-10'),
(3, 'Rohan Gupta',  'rohan@mail.com',  'Indore', '2024-03-05'),
(4, 'Sneha Patil',  NULL,              'Pune',   '2024-03-20'),
(5, 'Karan Singh',  'karan@mail.com',  'Delhi',  '2024-04-12'),
(6, 'Anjali Mehta', 'anjali@mail.com', 'Mumbai', '2024-05-01'),
(7, 'Vikram Rao',   'vikram@mail.com', 'Pune',   '2024-06-18'),
(8, 'Neha Joshi',   'neha@mail.com',   'Indore', '2024-07-22');
 
INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing'),
(4, 'Home');
 
INSERT INTO products VALUES
(1,  'Wireless Mouse',    1,  599.00, 50),
(2,  'Bluetooth Speaker', 1, 1999.00, 20),
(3,  'USB Cable',         1,  199.00, 100),
(4,  'SQL Basics Book',   2,  450.00, 30),
(5,  'Python Handbook',   2,  550.00, 25),
(6,  'Novel Collection',  2,  350.00, 0),
(7,  'T-Shirt',           3,  499.00, 60),
(8,  'Jeans',             3, 1299.00, 40),
(9,  'Jacket',            3, 2499.00, 15),
(10, 'Headphones',        1, 2999.00, 10),
(11, 'Phone Stand',       1,  299.00, 70);
 
INSERT INTO orders VALUES
(1,  1, '2024-08-01', 'Delivered'),
(2,  2, '2024-08-03', 'Delivered'),
(3,  1, '2024-08-10', 'Delivered'),
(4,  3, '2024-08-12', 'Cancelled'),
(5,  4, '2024-08-15', 'Delivered'),
(6,  5, '2024-09-01', 'Shipped'),
(7,  2, '2024-09-05', 'Delivered'),
(8,  6, '2024-09-10', 'Pending'),
(9,  3, '2024-09-15', 'Delivered'),
(10, 1, '2024-10-02', 'Shipped'),
(11, 7, '2024-10-05', 'Delivered'),
(12, 5, '2024-10-12', 'Pending');
 
INSERT INTO order_items VALUES
(1,  1,  1, 2),
(2,  1,  3, 1),
(3,  2,  4, 1),
(4,  3,  2, 1),
(5,  4,  7, 3),
(6,  5,  8, 1),
(7,  5,  7, 2),
(8,  6, 10, 1),
(9,  7,  5, 2),
(10, 7,  4, 1),
(11, 8,  9, 1),
(12, 9,  1, 1),
(13, 9,  3, 4),
(14, 10, 2, 2),
(15, 11, 8, 2),
(16, 12, 6, 1);
 
INSERT INTO employees VALUES
(1, 'Rakesh', NULL, 'Management', 90000),
(2, 'Sunita', 1,    'Sales',       60000),
(3, 'Amit',   1,    'Support',     55000),
(4, 'Pooja',  2,    'Sales',       40000),
(5, 'Deepak', 2,    'Sales',       42000),
(6, 'Meena',  3,    'Support',     38000);

-- The setup file used CREATE TABLE. Now create a table reviews with: 
-- review_id (primary key), product_id (foreign key), customer_id, rating (between 1 and 5), review_text.
-- Add a new column phone (VARCHAR 15) to customers.
-- Rename the column phone to mobile, or change its size, using ALTER.
-- Drop the column mobile.
-- Create an index on customers(city).
-- Drop the reviews table.

 CREATE TABLE reviews (
  review_id INT PRIMARY KEY,
  product_id INT,
  customer_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  review_text TEXT,
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
create table reviews (
review_id int primary key,
product_id int,
customer_Id int,
rating int check(rating between 1 and 5 ),
review_text text ,
foreign key (product_id) references products(product_id)
);
-- Add a new column phone (VARCHAR 15) to customers.\
alter table customers
add column phone varchar(15) ;
select * from customers;
alter table customers
rename column moblie to mobile;
alter table customers
modify mobile varchar(20);
alter table customers
drop column mobile;

create index idx_cc
on customers(city);
show index from customers;
drop table reviews;

-- Insert a new customer, “Rahul Jain” from Jaipur, with signup date 2024-08-01.
insert into customers ( customer_id,name,city,signup_date)
values ( 9,'rahul jain','jaipur','2024-08-01');

select * from customers;
                                                                                                 
select max(product_id) from products;

-- Insert two products in a single INSERT statement.
insert into products (product_id, product_name, category_id,price,stock)
values (12, 'wireless mouse', 1, 799, 50), 
(13, 'notebook', 2, 149, 100);

-- Increase the price of all Books by 10%.
update products 
set price = price *1.10
where category_id = (select category_id from categories where category_name = "books");

select * from products;

-- Set the stock of “Novel Collection” to 40.
SET SQL_SAFE_UPDATES = 0 ;
update products 
set stock = 40 
where product_name = 'Novel collection';

select * from orders;

-- Change the status of order 8 from Pending to Shipped.
update orders 
set status = ' shipped'
where order_id = 8 ;
	select * from customers;
    
    -- Delete the customer “Rahul Jain”.
    delete from customers 
    where name = 'rahul jain';
    
    select * from order_items;
     select * from orders;
     
    -- how the distinct cities of customers.
     select * from customers; 
     select distinct city from customers; 
     select * FROM products;
     
    
-- Delete all Cancelled orders. 
-- 	(Hint: delete the child rows in order_items first. Why?)
DELETE FROM order_items
WHERE order_id IN (SELECT order_id FROM orders WHERE status = 'Cancelled');

DELETE FROM orders
WHERE status = 'Cancelled';

SET SQL_SAFE_UPDATES = 1;
   delete from orders 
    where status = 'cancelled';
    
   -- Show the product name as item and price as cost (aliases). 
select product_name AS ITEMS , PRICE AS COST from products;
    select * FROM products;
    
    -- Show the first 5 products ordered by price, highest first.
    select * from products
    order by price desc 
     limit 5;
     
     -- Customers from Indore.
     SELECT * FROM products
ORDER BY category_id, price DESC;
select* from customers where city = 'indore';
 
 -- Products priced above 1000.
-- Products priced between 400 and 1500.
      select * from products where price  > 1000;
          select * from products where price  between 400 and 1500;
                select * from customers;
			
-- Customers whose name starts with ‘A’ (LIKE).
-- Customers whose name has ‘a’ as the second letter.
-- Customers who have no email (IS NULL).
          select * from customers where name like 'a%' ;
    select * from customers where name like '_a%' ;
        select * from customers where email is null;
	
-- Products that are out of stock OR priced above 2000.
-- Products that are in category 1 AND priced below 1000.
-- Customers NOT from Indore.
-- Total, average, minimum, and maximum price of products.
        select* from customers where city != 'indore';
    select* from products where category_id = 1 and price < 1000;
      select* from products where stock = 0 or price > 2000;
        select 
        sum(price) as ss,
        avg (price) as aa,
        min(price) as mm,
        max(price) as mx
        from products;
        
        -- Show customer names in UPPERCASE and the length of each name.
        select name, upper(name), length(name) from customers;
        
-- Show the first 3 letters of each product name (SUBSTRING).
-- Combine the name and city into one column like “Aarav Sharma - Indore” (CONCAT).
        select substring(product_name,1,3) as ss from products; 
		select concat(name, ' ', city) as i from customers;
        
-- Show the year and month of each order date.
        select * from orders;
        select year(order_date) as oy , month(order_date) as om from orders;
        
-- Show how many days ago each customer signed up (date difference).
-- Replace NULL emails with ‘not provided’ (COALESCE or IFNULL).
-- Show the price rounded to the nearest hundred (ROUND).
        select name, datediff(curdate(), signup_date) as ss from customers;
        select coalesce(email, 'not provided') from customers; 
        select name, ifnull(email, 'not provided') from customers; 
        select round(price , -2 ) as rounded_price from products;
   
   -- Number of customers in each city.
        select city, count(*) as tt from customers group by city ; 
        select * from products; 
            
            select * from categories;
            select * from customers;
 
 -- Number of products in each category.
	SELECT category_name, COUNT(*) AS total_products
FROM products
GROUP BY category_name;
            
            
SELECT c.category_name, COUNT(*) AS total_products
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name;
 
 -- Average price per category.
SELECT c.category_name, AVG(p.price) AS avg_price
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name; 
	
    -- Cities that have more than 1 customer (HAVING).
         select city, count(*) as tt from customers group by city
         having tt > 1; 
   -- Categories whose average price is above 1000. 
    SELECT c.category_name, AVG(p.price) AS avg_price
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
having avg_price > 1000; 
	
    select * from orders;
    select * from customers;
    
-- Number of orders placed by each customer, showing only customers with 2 or more orders.
select c.customer_id, c.name, count(o.order_id) as tc from customers c
    join orders o on c.customer_id = o.customer_id
    group by c.customer_id, c.name
    having tc >= 2;
    select c.customer_id, c.name, count (o.order_id) as gg from customers c 
    join orders o on c.customer_id = o.customer_id
    group by c.customer_id, c.name
    having gg >= 2; 
   
   -- Label each product: price below 500 is ‘Cheap’, 500 to 1500 is ‘Medium’, above 1500 is ‘Premium’.
    select * from products;
    select product_id, product_name, price,
    case when price < 500 then 'c'
    when price between 500 and 1500 then 'm'
    else 'p'
    end as price_label
    from products;
    
    -- Show stock status: 0 is ‘Out of Stock’, below 20 is ‘Low’, otherwise ‘Available’.
    select product_id, product_name, stock,
    case when stock = 0 then 'ofs'
    when stock < 20 then 'l'
    else 'a'
    end as ss
    from products;
select * from orders;

-- Count how many orders are Delivered and how many are not (a CASE inside SUM or COUNT).
select
     count(CASE WHEN STATUS = 'Delivered' then 1 END) AS DD ,
     count(CASE when STATUS != 'Pending' THEN 1 END ) AS NN
     from orders;
     
     select * from customers;
     select * from orders;
     -- Show each order with the customer name (INNER JOIN).
   select o.order_id, o.order_date, o.status, c.name 
   from orders as o inner join customers as c on o.customer_id = c.customer_id;

     select * from categories;
     select * from products;
-- Show each product with its category name.
select p.product_id , p.product_name , c.category_name from products as p 
inner join categories as c on p.category_id = c.category_id ;

-- Show all customers and their orders, including customers with no orders (LEFT JOIN).
      select * from customers;
     select * from orders;
     select c.name , c.customer_id , o.order_id , o.order_date , o.status 
     from customers as c left join orders as o  on c.customer_id = o.customer_id;
-- Find customers who never placed an order.
select c.name , c.customer_id , o.order_id
    from customers as c left join orders as o  on c.customer_id = o.customer_id
    where o.order_id is null;
    
	select * from products;
    select * from order_items;
-- Find products that were never ordered.
select p.product_name , p.product_id from products as p 
left join order_items as ot on p.product_id = ot.product_id
where ot.product_id is null ;
-- Find categories that have no products 
SELECT
  categories.category_id,categories.category_name FROM categories LEFT JOIN products
ON categories.category_id = products.category_id WHERE products.product_id IS NULL;
-- 	Show order_id, customer name, product name, and quantity (join 4 tables).
SELECT
  orders.order_id,customers.name,products.product_name,order_items.quantity FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id;

-- Show each employee with their manager’s name (SELF JOIN).
select * from employees;
select e.emp_name as employee , m.emp_name as manager from employees e 
left join employees m on e.manager_id = m.emp_id;

select e.emp_name as employee , m.emp_name as manager from employees e 
inner join employees m on e.manager_id = m.emp_id;

-- Total revenue per order (quantity multiplied by price).
select * from orders;
select * from products;
select * from order_items;

select o.order_id , sum(oi.quantity * p.price) as tr from orders o 
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by o.order_id;

select o.order_id , sum(oi.quantity * p.price) as tr from orders o 
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by o.order_id;

select * from customers;
select * from order_items;
select * from orders;
select * from products;
-- Total spending per customer, highest first.
SELECT c.name, SUM(oi.quantity * p.price) AS total_spending FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spending DESC;
select * from categories;
-- Total revenue per category.
select cat.category_name , sum(oi.quantity * p.price) as tr from categories cat
join products p on cat.category_id = p.category_id 
join order_items oi on p.product_id = oi.product_id
group by cat.category_name;
-- 	Products priced above the average price.
select * from products;
select product_id , product_name , price from products 
where price > (select avg(price) from products);

-- Customers who have placed at least one order (IN).
select name from customers where customer_id in ( select customer_id from orders); 

-- Customers who have never placed an order (NOT IN or NOT EXISTS).
select name from customers where customer_id  not in ( select customer_id from orders); 

-- The most expensive product, without using LIMIT or MAX in the main query.
select product_name, price from products 
where price = ( select max(price) from products );
-- Customers whose total spending is above the average customer spending. 
WITH customer_totals AS (
  SELECT
    c.name,
    SUM(oi.quantity * p.price) AS total_spending
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  GROUP BY c.name
)
SELECT name, total_spending
FROM customer_totals
WHERE total_spending > (SELECT AVG(total_spending) FROM customer_totals);
-- For each product, show the price and the average price of all products in a subquery column.
select product_name , price , (select avg(price) from products ) as ap from products;
-- UNION: a single list of all cities from customers and a list of cities where Delivered orders came from.
-- Notice the difference between UNION and UNION ALL.
select city from customers 
union select c.city from customers c 
join orders o on c.customer_id = o.customer_id
where o.status = 'delivered';
-- Use INTERSECT or an IN-based equivalent to find cities that have both Pending and Delivered orders.

select * from customers;
-- Create a view customer_spending that shows customer name and total spending. Query it.
create view customer_spending as select c.name , sum(oi.quantity * p.price) as ts 
from customers as c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by c.name;

-- 	Rewrite question 58 using a CTE (WITH).
   -- 69. Rewrite Q58 using CTE
WITH customer_total AS (
    SELECT c.name, SUM(oi.quantity * p.price) AS total_spending
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    join products p on oi.product_id = p.product_id
    WHERE o.status != 'Cancelled'
    GROUP BY c.name
)
SELECT * FROM customer_total
ORDER BY total_spending DESC;    

select * from order_items;
select * from orders;
select * from products;
select * from categories;
select * from customers;

-- Rank products by price using RANK() and ROW_NUMBER().
select product_name, price, 
rank() over (order by price desc) as price_rank,
row_number() over ( order by price desc ) as row_num 
from products;           

-- Show each product’s price rank within its category (PARTITION BY).
select product_name , category , price ,
rank () over (partition by categoy order by price desc ) as rank_in_cat 
from products; 

-- Show a running total of revenue by order date.
-- 72. Running total of revenue by order date
SELECT o.order_date, SUM(oi.quantity * p.price) AS daily_revenue,
SUM(SUM(oi.quantity * p.price)) OVER (ORDER BY o.order_date) AS running_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status != 'Cancelled'
GROUP BY o.order_date
ORDER BY o.order_date;

-- Final challenge: business questions
-- Answer these using whatever combination of SQL you need:

-- A. Which city generates the most revenue (ignoring Cancelled orders)?
SELECT c.city, SUM(oi.quantity * p.price) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status != 'Cancelled'
GROUP BY c.city
ORDER BY total_revenue DESC
LIMIT 1;

-- B. Who are the top 3 customers by spending?
SELECT
    c.name,
    SUM(oi.quantity * p.price) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status != 'Cancelled'
GROUP BY c.name
ORDER BY total_spending DESC
LIMIT 3;

-- C. Which month had the highest sales?
SELECT
    MONTH(o.order_date) AS month_number,
    MONTHNAME(o.order_date) AS month_name,
    SUM(oi.quantity * p.price) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status != 'Cancelled'
GROUP BY MONTH(o.order_date), MONTHNAME(o.order_date)
ORDER BY total_sales DESC
LIMIT 1;

-- D. Which products need restocking (stock below 20) and were ordered at least once?
SELECT DISTINCT p.product_name, p.stock FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
WHERE p.stock < 20
ORDER BY p.stock ASC;

-- E. Which employees earn more than the average salary of their own department?
SELECT
    e.emp_name,
    e.department,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e.department
);
select * from employees;