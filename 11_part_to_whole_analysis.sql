/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/
-- Which categories contribute the most to overall sales?

select p.category,sum(s.sales_amount) as totalcategory_sales,
format((cast(sum(sales_amount) as decimal(18,4))*100.0/sum(sum(sales_amount))over()),'N2')+'%'
as percentageofoverallsales from gold.fact_sales s join gold.dim_products p on s.product_key=p.product_key
group by p.category order by totalcategory_sales desc;



























