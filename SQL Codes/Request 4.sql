/*Which segment had the most increase in unique products in 2021 vs 2020? 
The final output contains these fields, 
segment product_count_2020 
product_count_2021 
difference*/

WITH pro_cnt_2020_tbl AS
(
SELECT p.segment,count(distinct(f.product_code)) as product_count_2020
FROM dim_product p
JOIN fact_sales_monthly f
ON f.product_code = p.product_code
WHERE fiscal_year = 2020
GROUP BY segment
),
pro_cnt_2021_tbl AS
(
SELECT p.segment,count(distinct(f.product_code)) as product_count_2021
FROM dim_product p
JOIN fact_sales_monthly f
ON f.product_code = p.product_code
WHERE fiscal_year = 2021
GROUP BY segment
)
SELECT c1.segment,c1.product_count_2020,c2.product_count_2021,(product_count_2021-product_count_2020) AS difference 
FROM pro_cnt_2020_tbl c1
JOIN pro_cnt_2021_tbl c2
ON c2.segment = c1.segment
ORDER BY difference DESC