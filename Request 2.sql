/*What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields, 
unique_products_2020 
unique_products_2021 
percentage_chg */

with cte1 as(
SELECT count(distinct(product_code)) as unique_products_2020
FROM fact_sales_monthly WHERE fiscal_year = 2020),
cte2 as
(SELECT count(distinct(product_code)) as unique_products_2021
FROM fact_sales_monthly WHERE fiscal_year = 2021)
SELECT *, ROUND((((unique_products_2021-unique_products_2020) *100)/unique_products_2020),2) AS percentage_chg
from cte2 
cross join
cte1 ;




