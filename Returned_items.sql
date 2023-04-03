-- Most returned item sub_categories
With returns as (
Select o.row_id, o.order_id, o.category, o.sub_category, o.product_name, r.returned
From orders o
Join returns r on r.order_id = o.order_id
)

-- Most returned products, not very insightful
-- Select category, sub_category, product_name, 
-- 		COUNT(product_name) as product_count
-- From returns
-- Group by category, sub_category, product_name
-- Order by product_count DESC;

-- most returned sub_cats, pretty good 
Select category, sub_category, 
		COUNT(sub_category) as sub_cat_count
From returns
Group by category, sub_category
Order by sub_cat_count DESC, category ASC, sub_category ASC;