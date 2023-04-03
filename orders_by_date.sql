-- order_dates grouped by month and year
Select distinct order_date, order_id, EXTRACT(month from order_date) as month, EXTRACT(year from order_date) as year,
		ROUND(SUM(sales), 2) as sales, ROUND(SUM(profit), 2) as profit
From orders
Group by order_date, order_id, month, year
Order by order_date