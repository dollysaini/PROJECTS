-- SQL retail sales analysis- p1
create database PROJECT P1;

-- CREATE TABLE
DROP TABLE IF EXISTS RETAIL_SALES;

CREATE TABLE RETAIL_SALES(
TRANSACTION_ID INT PRIMARY KEY,
SALE_DATE DATE, 
SALE_TIME TIME,
CUSTOMER_ID INT,
GENDER VARCHAR(15),
AGE INT,
CATEGORY VARCHAR(50),
QUANTITY INT,
PRICE_PER_UNIT FLOAT,
COGS FLOAT, 
TOTAL_SALE FLOAT
);

 SELECT*FROM RETAIL_SALES

 SELECT COUNT(*)
FROM RETAIL_SALES

--DATA CLEANING (CHECKING FOR NULL VALUES)

select* from retail_sales
where 
      transaction_id is null
	  or
	  sale_date is null
	  or 
	  sale_time is null
	  or 
	  customer_id is null
      or
	  gender is null
	  or
	  age is null
	  or 
	  category is null
	  or
	  quantity is null
	  or
	  price_per_unit is null
	  or
	  cogs is null
	  or 
	  total_sale is null;

--DATA CLEANING (DELETING ROWS WITH NULL VALUES)

delete from retail_sales
where 
        transaction_id is null
	  or
	  sale_date is null
	  or 
	  sale_time is null
	  or 
	  customer_id is null
      or
	  gender is null
	  or
	  age is null
	  or 
	  category is null
	  or
	  quantity is null
	  or
	  price_per_unit is null
	  or
	  cogs is null
	  or 
	  total_sale is null;

--DATA EXPLORATION

-- HOW MANY SALES WE HAVE

select count(*) as Total_sales from retail_sales

-- HOW MANY UNIQUE CUSTOMERS WE HAVE

select count (distinct customer_id) as Total_customers from retail_sales

--HOW MANY UNIQUE CATEGORIES WE HAVE

select count(distinct category) from retail_sales

--WHAT DISTINCT CATEGORIES WE HAVE

select distinct(category) from retail_sales	  

--DATA ANALYSIS AND BUSINESS AND KEY PROBLEMS AND ANSWERS

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

select * from retail_sales
where sale_date ='2022-11-05';

--Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

  SELECT * from retail_sales
  where category='Clothing'
  and quantity>=4
  and sale_date between '2022-11-01' and '2022-11-30';


--Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.  

  select distinct(category), sum(total_sale)
  from retail_sales
  group by category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
 
select ROUND(avg(age),2) from retail_sales
where category='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * from retail_sales
where total_sale> 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1

-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales 

select customer_id, sum(total_sale)
from retail_sales
group by customer_id
order by sum(total_sale) desc
limit 5;

-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.

select count(distinct customer_id), category from retail_sales
group by category;



--END OF PROJECT




