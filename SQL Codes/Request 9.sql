/*Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?  The final output  contains these fields, 
channel 
gross_sales_mln 
percentage */

WITH cte1 AS
(
SELECT c.channel, ROUND(sum(g.gross_price *s.sold_quantity)/1000000,2) AS gross_sales_mln
FROM fact_sales_monthly s
JOIN dim_customer c
ON c.customer_code = s.customer_code
JOIN fact_gross_price g
ON g.product_code = s.product_code AND g.fiscal_year = s.fiscal_year
WHERE s.fiscal_year = 2021
GROUP BY channel
order by gross_sales_mln DESC
)
SELECT channel,gross_sales_mln, CONCAT(ROUND(gross_sales_mln *100/ SUM(gross_sales_mln) over(),2),"%") as percentage
FROM cte1




   




