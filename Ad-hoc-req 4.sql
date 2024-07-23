# Q-4 Which segment had the most increase in unique products in 2021 vs 2020?

WITH products2020 AS (
    SELECT DISTINCT segment, COUNT(product) AS product_count_2020
    FROM dim_product t1
     JOIN fact_sales_monthly t2 ON t1.product_code = t2.product_code
    WHERE fiscal_year = '2020'
    GROUP BY segment
),
products2021 AS (
    SELECT DISTINCT segment, COUNT(product) AS product_count_2021
    FROM dim_product t1
    JOIN fact_sales_monthly t2 ON t1.product_code = t2.product_code
    WHERE fiscal_year = '2021'
    GROUP BY segment
)
SELECT
    products2020.segment,
    product_count_2020,
    product_count_2021,
    (product_count_2021 - product_count_2020) AS Difference
FROM products2020
JOIN products2021 ON products2020.segment = products2021.segment
ORDER BY Difference DESC;


      