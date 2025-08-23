-- Create Database
CREATE DATABASE OnlineBookstore;

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;



-- 1) Retrieve all books in the "Fiction" genre:

    select* from books
	where genre='Fiction';


-- 2) Find books published after the year 1950:

	select* from books
	where published_year>1950;

-- 3) List all customers from the Canada:

    select * from customers
	where country='Canada';

-- 4) Show orders placed in November 2023:

	select* from orders
	where order_date between '2023-11-01' and '2023-11-30';

	                      or

    select * from orders
	where to_char(order_date,'yyyy-mm')='2023-11';

-- 5) Retrieve the total stock of books available:

	select sum(stock) as total_stock from books;

-- 6) Find the details of the most expensive book:

    select * from books
	order by price desc
	limit 1;


-- 7) Show all customers who ordered more than 1 quantity of a book:

    select customers.customer_id,customers.name, orders.quantity
    from customers
	inner join orders
	on customers.customer_id= orders.customer_id
	where orders.quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:

	 select* from orders
	 where total_amount>20;


-- 9) List all genres available in the Books table:

	 select distinct genre from books;

-- 10) Find the book with the lowest stock:

     select* from books
	 order by stock asc
	 limit 1;


-- 11) Calculate the total revenue generated from all orders:

     select sum(total_amount) as total_revenue from orders;
	 

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

   select books.genre, sum(orders.quantity)
   from books
   inner join orders
   on books.book_id= orders.book_id
   group by books.genre;


-- 2) Find the average price of books in the "Fantasy" genre:

   select round(avg(price),2) as avg_price from books
   where genre='Fantasy';


-- 3) List customers who have placed at least 2 orders:

    select customers.customer_id,customers.name, count(orders.order_id)
	from customers
	inner join orders
	on customers.customer_id= orders.customer_id
	group by customers.customer_id	
    having count(orders.order_id)>=2;

	
-- 4) Find the most frequently ordered book:

    select books.book_id as book_id, books.title, count(orders.order_id)
	from books
	inner join orders
	on books.book_id= orders.book_id
    group by books.book_id
	order by count(orders.order_id) desc 
	limit 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

    select * from books
	where genre='Fantasy'
	order by price desc
	limit 3;

-- 6) Retrieve the total quantity of books sold by each author:

    select books.author, sum(orders.quantity) as total_books_sold
	from books
	inner join orders
	on books.book_id= orders.book_id
	group by books.author;
	

-- 7) List the cities where customers who spent over $30 are located:

	select customers.city, orders.total_amount
	from customers
	inner join orders
	on customers.customer_id= orders.customer_id
	where orders.total_amount>30;

-- 8) Find the customer who spent the most on orders:

    select customers.customer_id, customers.name, sum(orders.total_amount)
	from customers
	inner join orders
	on customers.customer_id= orders.customer_id
	group by customers.customer_id
	order by sum(orders.total_amount) desc
	limit 1;


--END OF PROJECT




