
CREATE TABLE sales (
    Order_ID INT PRIMARY KEY,
    Product_ID INT,
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Category VARCHAR(50),
    Region VARCHAR(50),
    City VARCHAR(50),
    Order_Date DATE,
    Ship_Date DATE,
    Ship_Mode VARCHAR(50),
    Sales DECIMAL(10,2)
);

INSERT INTO sales (Order_ID, Product_ID, Customer_ID, Customer_Name, Segment, Category, Region, City, Order_Date, Ship_Date, Ship_Mode, Sales)
VALUES
(1, 101, 1001, 'Alice', 'Consumer', 'Furniture', 'West', 'Los Angeles', '2023-01-15', '2023-01-20', 'Standard', 500.00),
(2, 102, 1002, 'Bob', 'Corporate', 'Technology', 'East', 'New York', '2023-02-10', '2023-02-15', 'Express', 1200.00);


-- create database sales_data
-- use  sales;

-- view table
select * from sales;

-- sum of sold items in desc order as per product id
select Product_ID,sum(Sales) as TotalRevenue
from sales
group by Product_ID
order by TotalRevenue desc;

-- finding yearly revenue
select Order_Date,Ship_Date, sum(Sales) as YearlyRevenue
from sales
group by Order_Date,Ship_Date
order by Order_Date desc;

-- Finding VIP Customers who purchase a lot
select Customer_Name,sum(Sales) as TotalSpending
from sales
group by Customer_Name
order by TotalSpending desc;

-- Top Regions and City by sale and their count
select Region,sum(Sales) as RegionalOrder,count(Sales)
from sales
group by Region
order by RegionalOrder desc;
select City,sum(Sales) as CitySales,count(Sales)
from sales
group by City
order by CitySales desc;

-- Category  Performance
select Category,sum(Sales) as TotalSales
from sales
group by Category
order by TotalSales desc;

-- Customer Segment Analysis
select Segment,Sum(Sales) as TotalSales,count(Distinct Customer_ID) as UniqueCustomer
from sales
group by Segment;

-- Shipping Mode Impact
select Ship_Mode,count(Order_ID) as TotalOrders,sum(Sales) as Total_Sales
from sales
Group by Ship_Mode
Order by Total_Sales desc;
