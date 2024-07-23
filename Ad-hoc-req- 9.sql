# Q-9.Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?


With temp_table AS (
         select c.channel,sum(s.sold_quantity * g.gross_price) as total_sales
         from fact_sales_monthly s
         
         JOIN fact_gross_price g ON s.product_code = g.product_code
         JOIN dim_customer c ON s.customer_code = c.customer_code
         WHERE s.fiscal_year = 2021
         GROUP BY c.channel
         ORDER  BY total_sales desc
         )
SELECT channel,
round(total_sales/1000000,2) AS gross_sales_in_millions,
round(total_sales/(sum(total_sales)  OVER())*100,2) AS percentage
from temp_table;		
         

 