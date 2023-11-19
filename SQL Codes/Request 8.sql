/*In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity, 
Quarter 
total_sold_quantity */

SELECT 
CASE 
WHEN monthname(date) in ("september","october","november") THEN "Q1"
 WHEN monthname(date) in ("december","january","february")THEN "Q2"
 WHEN monthname(date) in ("march","april","may") THEN "Q3"
 WHEN monthname(date) in ("june","july","august") THEN "Q4"
 END AS Quarters , SUM(sold_quantity) AS Total_sold_quantity
 FROM fact_sales_monthly
 WHERE fiscal_year = 2020
 GROUP BY Quarters
 ORDER BY Total_sold_quantity DESC;
  
  
  
  
  
  
