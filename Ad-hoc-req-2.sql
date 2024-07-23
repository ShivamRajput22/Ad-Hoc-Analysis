# Q.2 What is the percentage of unique product increase in 2021 vs. 2020? The  final output contains these fields?


SELECT db.X Unique_Products_2020,  db1. Y Unique_Products_2021, ROUND((Y-X)*100/X, 2) AS Percentage_Chg
FROM 
         (
         (select count(distinct(product_code)) AS X from fact_sales_monthly
         where fiscal_year = 2020) db,
		(select count(distinct(product_code)) AS Y from fact_sales_monthly
         where fiscal_year = 2021) db1
         );
         
  
 