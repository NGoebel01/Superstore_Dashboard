-- Most recent customers
With order_dates_ranked as (
Select customer_id, customer_name, order_date, RANK() OVER(partition by customer_id order by order_date DESC) as date_rank
From orders
Group by customer_id, customer_name, order_date
),

days_since_last_order as (
Select customer_id, customer_name, DATEDIFF('2018-01-01', order_date) as days_since_last_order
From order_dates_ranked
Where date_rank = 1
Order by days_since_last_order ASC
),
-- defining customer's active status on if they ordered within a year
active_status as (
Select CASE WHEN days_since_last_order < 365 THEN 'active'
			WHEN days_since_last_order > 365 THEN 'inactive'
            END as active_status
From days_since_last_order
)
-- count of active/inactive clients 
Select active_status, COUNT(*)
From active_status
Group by active_status