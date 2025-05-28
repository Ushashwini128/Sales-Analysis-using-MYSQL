
#Find all orders shipped via "Economy" mode with a total amount greater than 25000
select * from sales where Ship_Mode="Economy" and Total_Amount>25000;

#Retrieve all data where category is technology in ireland and orders after 2020-01-01
select * from sales where Category="Technology" and Country="Ireland" and  Order_Date > '2020-01-01';

#List top 10 most profitable sales transactions in descending order
select * from sales order by Unit_Profit desc limit 10;

#Find all customers whose name starts with j and ends with n
select Order_ID,Customer_Name from sales where Customer_Name like 'J%n';

#Retreive all product names that contain 'Acco' anywhere in the name
select Order_ID,Product_Name from sales where Product_Name like '%Acco%';

#get top 5 cities with highest total sales amount
select City ,sum(Total_Amount) as tot_sales from sales group by City order by tot_sales desc limit 5;

#Display the second set of 10 records for customer name and total amount in decreasing order
select Customer_Name,Total_Amount from sales order by Total_Amount desc limit 10,10; 

#find the total revenue average unit cost and total number of order
select sum(Total_Amount) as `Total revenue`,avg(Unit_Cost) as `Average Unit Cost`,count(Order_ID) as `Total Orders` from sales;

#Count unique number of regions
select count(distinct(Region)) as `Unique Regions` from sales;

#find the number of orders placed by each customer
select Customer_Name,count(Order_ID) as Order_Count from sales group by Customer_Name order by Order_Count desc;

#Rank 5 products based on total sales using rank()
select Product_Name,sum(Total_Amount) as tot_sales, rank() over (order by sum(Total_Amount) desc) as Sales_Rank from sales group by Product_Name limit 5;
