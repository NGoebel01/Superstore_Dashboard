-- Most active customers (average days between orders)
-- Not sure if this is correct, can use ROUND(DATEDIFF(MAX(order_date), MIN(order_date)) / NULLIF(COUNT(distinct order_date) - 1, 0), 0) to find avg between orders
		-- but this doens't cover customers who only ordered once
Select customer_id, customer_name, COUNT(distinct order_id) as number_of_orders, 
		ROUND(DATEDIFF('2018-01-01', MIN(order_date)) / COUNT(distinct order_date), 0) as average_days_between_orders
From orders
Group by customer_id, customer_name
Order by number_of_orders DESC, average_days_between_orders ASC