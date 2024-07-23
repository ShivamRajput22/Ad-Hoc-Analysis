# Q-3  Provide a report with all the unique product counts for each  segment  and sort them in descending order of product counts?

SELECT segment, COUNT(distinct product_code) AS unique_product_counts
FROM dim_product
GROUP BY segment
ORDER BY unique_product_counts
DESC;



