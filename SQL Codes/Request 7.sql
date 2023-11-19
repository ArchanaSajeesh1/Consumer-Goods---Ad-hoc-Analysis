/*Get the complete report of the Gross sales amount for the customer  “Atliq  Exclusive”  for each month  .
This analysis helps to  get an idea of low and high-performing months and take strategic decisions. 
The final report contains these columns: 
Month 
Year 
Gross sales Amount */

SELECT monthname(s.date) AS month ,year(s.date) as Year, 
concat((ROUND(sum(g.gross_price *s.sold_quantity)/1000000,2))," M") 
AS Gross_Sales_Amount
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON g.product_code = s.product_code  AND g.fiscal_year = s.fiscal_year
JOIN dim_customer c
ON c.customer_code = s.customer_code
WHERE customer = "Atliq Exclusive"
group by month, year
ORDER BY year;

