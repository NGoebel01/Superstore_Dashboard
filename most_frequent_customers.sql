-- most frequent customers
Select EXTRACT(year from order_date) as year,
		customer_id, customer_name, segment, SUM(quantity) as count_items_purchased, 
		COUNT(distinct order_id) as number_of_orders, ROUND(SUM(profit), 2) as profit
From orders
Group by EXTRACT(year from order_date), customer_id, customer_name, segment
Order by count_items_purchased DESC, customer_name ASC