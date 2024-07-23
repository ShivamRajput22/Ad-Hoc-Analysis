 # Q-5 Get the products that have the highest and lowest manufacturing costs?
 
 select *
 from fact_pre_invoice_deductions;
 
 Select * 
 from dim_product;
 
 Select a.product_code  AS product_code,
              a.product AS product,
              CONCAT('$', Round(b.Manufacturing_Cost,2)) AS Manufacturing_Cost
 FROM dim_product  AS a
 JOIN
 fact_manufacturing_cost AS b
 ON a.product_code = b.product_code
 WHERE b.Manufacturing_Cost = (SELECT MAX(Manufacturing_Cost) FROM fact_manufacturing_cost) 
    OR       b.Manufacturing_Cost = (SELECT MIN(Manufacturing_Cost) FROM fact_manufacturing_cost)        
ORDER BY b.Manufacturing_Cost DESC;


