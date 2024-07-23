#Q.6-Generate a report which contains the top 5 customers who received an average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the Indian  market ?

	
Select a.customer_code, b.customer,
CONCAT(ROUND(avg(pre_invoice_discount_pct)*100,2),'%') AS average_discount_percentage
FROM fact_pre_invoice_deductions as a
JOIN dim_customer AS b
ON a.customer_code = b.customer_code
WHERE market = 'India'
AND fiscal_year = 2021
GROUP BY customer, customer_code
ORDER BY AVG(pre_invoice_discount_pct) desc
limit 5;