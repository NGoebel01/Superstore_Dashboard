-- best selling items (count sold and profit made)
-- removed commas that were causing issue with CSV format
-- would still like to remove the ending ", but has been done in Tableau for now
With cte as (
SELECT EXTRACT(year from order_date) as year, EXTRACT(month from order_date) as month,
	product_name, category, sub_category, SUM(quantity) as count_sold, ROUND(SUM(profit), 2) as profit
FROM orders
Group by year, month, product_name, category, sub_category
Order by count_sold DESC, profit DESC
)

Select year, month, REPLACE(product_name, ',', '') as product_name,
		category, sub_category, count_sold, profit
From cte