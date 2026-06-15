use northwind;
-- Joining Orders and Customers table
select *
from Orders
join Customers
on Orders.CustomerID = Customers.CustomerID;
-- . used for path
select customers.CustomerID, Orders.OrderID, Orders.OrderDate, 
customers.CustomerName, customers.Country
from Orders
inner join Customers
on Orders.CustomerID = Customers.CustomerID
order by customers.CustomerID;
-- suppliers and products
select suppliername, productname
from suppliers
inner join products
on suppliers.supplierid = products.supplierid
where suppliername = "g'day, mate";
select employeeid, orderid, orderdate
from orders;
select*from shippers
join orders
on orders.shipperid = shippers.shipperid
where shippername = "speedy express";
select*from categories
join products
on products.categoryid = categories.categoryid;

/* Write a query to list all products and their quantities for each order.*/
select ProductName, Quantity
from products
inner join order_details
on products.ProductID = order_details.ProductID;

/* Write a query to display all products along with their category names.*/
select CategoryName, ProductName
from products
inner join categories
on products.CategoryID = categories.CategoryID;

/* Write a query to find all orders shipped by a specific shipper (e.g., ShipperName = 'Speedy Express'). */
select ShipperName, OrderID, OrderDate
from orders
inner join shippers
on orders.ShipperID = shippers.ShipperID
where ShipperName = 'Speedy Express';

/* Write a query to list the employees who handled each order, along with the order date.*/
select firstname, lastname, OrderDate, orders.orderid
from orders 
inner join employees
on orders.EmployeeID = employees.EmployeeID;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
CROSS JOIN Orders
order by customername;

-- number of quantity in each order
select orders.orderid, OrderDate, ProductID, Quantity
from orders
join order_details
on orders.orderid = order_details.OrderID;
 
 -- How many customer in each country?
select country, count(customerid) as numberofcustomers
from customers
group by country;
 
 -- Total Sales for each product
select p.ProductName, Sum(od.Quantity * p.Price) as totalsales
from products as p
join order_details as od
on p.ProductID = od.ProductID
group by p.ProductName
order by totalsales desc;

select city, count(customerID)
from customers
group by city;

select categories.categoryname, sum(order_details.quantity) as total_quantity
from categories
join products on categories.categoryid = products.categoryid
join order_details on products.productid = order_details.productid
group by categories.categoryname;

/*Write a query to list each employee and the number of orders they have handled.*/
select FirstName, LastName, count(o.orderid) as nooforders
from orders as o
join employees as e
on o.EmployeeID = e.EmployeeID
group by FirstName, LastName;
 
 select suppliers.suppliername, products.productname
 from suppliers
 join products on suppliers.supplierid = products.supplierid;
 
 select categories.categoryname, products.productname
 from categories
 join products
 on categories.categoryid = products.categoryid;
 
 select categories.categoryname, products.productname
 from categories
 join products
 on categories.categoryid = products.categoryid
 where categoryname = "meat/poultry";
 
 select orders.orderid, orders.orderdate, customers.customername, employees.firstname as employee_firstname, employees.lastname as employee_lastname
 from orders
 join customers on orders.customerid = customers.customerid
 join employees on orders.employeeid = employees.employeeid;
 
 select products.productname, categories.categoryname, suppliers.suppliername
 from products
 join categories 
 on categories.categoryid = products.categoryid
 join suppliers
 on suppliers.supplierid = products.supplierid;
 
 select customers.customername, orders.orderid, orders.orderdate
 from orders
 join customers
 on orders.customerid = customers.customerid
 where orderdate between '1996-01-01' and '1996-12-31';
 
 select categories.categoryname, count(products.productid)
 from categories
 join products
 on categories.categoryid = products.categoryid
 group by categoryname;
 
 select products.productname, products.price, sum(order_details.quantity) as total_order_quantity
 from products
 join order_details 
 on products.productid = order_details.productid
 group by productname, products.price; 