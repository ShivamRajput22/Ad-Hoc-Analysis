#Q.7-Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each month .This analysis helps to  get an idea of low and high-performing months and take strategic decisions. 
#The final report contains these columns: Month, Year, Gross sales Amount.


SELECT 
				monthname(date) as Month_Name,
				year(date) AS Get_Year,
                concat( '$', Round(SUM(a.sold_quantity * b.gross_price)/1000000,2)) AS gross_sales_monthly
                
FROM fact_sales_monthly AS a
JOIN fact_gross_price AS b
ON b.product_code = a.product_code  
AND b.fiscal_year = a.fiscal_year
JOIN dim_customer as c
ON c.customer_code = a.customer_code
WHERE c.customer = 'Atliq Exclusive'
GROUP BY month_name, Get_Year
ORDER BY Get_Year;                