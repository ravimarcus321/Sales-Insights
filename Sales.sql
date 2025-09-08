create database sales_data
use  sales_data;

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
