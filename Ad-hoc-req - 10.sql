# Q-10 .  Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 
# The final output contains these fields

WITH top_sold_products AS 
(
	SELECT d.division AS division,
		   d.product_code AS product_code,
		   d.product AS product,
		   SUM(a.sold_quantity) AS total_sold_quantity
	FROM fact_sales_monthly AS a
	INNER JOIN dim_product AS d
	ON a.product_code = d.product_code
	WHERE a.fiscal_year = 2021
	GROUP BY  d.division, d.product_code, d.product 
	ORDER BY total_sold_quantity DESC
),
top_sold_per_division AS
(
 SELECT division,
	    product_code,
        product,
        total_sold_quantity,
        DENSE_RANK() OVER(PARTITION BY division ORDER BY total_sold_quantity DESC) AS rank_order 
 FROM top_sold_products
 )
 SELECT * FROM top_sold_per_division
 WHERE rank_order <= 3;

