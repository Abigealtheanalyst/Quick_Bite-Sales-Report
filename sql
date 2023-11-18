1.	/* Total Revenue*/
SELECT SUM(total_price) FROM PizzaCompany.dbo.pizza_sales;

2.	/* Average Order Value */
SELECT (SUM(total_price) / COUNT(DISTINCT( order_id))) as Average_order_revenue
FROM PizzaCompany.dbo.pizza_sales;

3.	/*Total Pizza Sold */
SELECT SUM(quantity) as Total_pizza_Sold
FROM PizzaCompany.dbo.pizza_sales;

4.	/* Total Orders */
SELECT COUNT(DISTINCT( order_id)) FROM PizzaCompany.dbo.pizza_sales;

5.	/* Average Pizza Per Order */
SELECT CAST(
	CAST (SUM (quantity) AS DECIMAL (10, 2)) / 
CAST(COUNT(DISTINCT(order_id)) AS DECIMAL(10, 2))
	AS DECIMAL(10, 2 )) AS Average_Pizza_perOrder
FROM PizzaCompany.dbo.pizza_sales;

6.	/*Daily trend for total order*/
SELECT DATENAME(DW, order_date) as order_days, 
COUNT (DISTINCT order_id) AS Total_order
FROM PizzaCompany.dbo.pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY 1 ASC;

7.	/*Monthly trend for total order*/
SELECT DATENAME(Month, order_date) as Order_months, 
COUNT (DISTINCT order_id) AS Total_order
FROM PizzaCompany.dbo.pizza_sales
GROUP BY DATENAME(Month, order_date)
ORDER BY Total_order DESC;

8. /*Percentage of sales by pizza category*/
SELECT Pizza_category, sum(total_price) as Sales_total,
sum(total_price)* 100  / 
	(SELECT SUM(total_price)
	 FROM PizzaCompany.dbo.pizza_sales) as sales_percent
FROM PizzaCompany.dbo.pizza_sales
group by Pizza_category;

9.	/*Percentage of sales by Pizza size*/
SELECT pizza_size, CAST (sum(total_price)AS DECIMAL(10, 2)) as Sales_total,
CAST(sum(total_price)* 100  / 
	(SELECT SUM(total_price)
	 FROM PizzaCompany.dbo.pizza_sales) AS DECIMAL (10, 2)) as sales_percent
FROM PizzaCompany.dbo.pizza_sales 
group by pizza_size;
  
10.	/*TOP 5 BEST SELLERS BY REVENUE (TOTAL QUANTITY & TOTAL ORDER)*/
SELECT TOP 5 pizza_name,
sum(total_price)as total_revenue
--sum(quantity)as total_quantity,
--sum(distinct order_id) as total_order
from PizzaCompany.dbo.pizza_sales
group by pizza_name
order by 2 desc;

11. /*BOTTOM 5 BEST SELLER BY REVENUE (TOTAL QUANTITY & TOTAL ORDER)*/
SELECT TOP 5 pizza_name,
sum(total_price)as total_revenue
--sum(quantity)as total_quantity,
--sum(distinct order_id) as total_order
from PizzaCompany.dbo.pizza_sales
group by pizza_name
order by 2;



