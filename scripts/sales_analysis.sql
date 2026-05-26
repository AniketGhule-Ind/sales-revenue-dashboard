-- ================================================
-- Sales & Revenue Dashboard - SQL Analysis
-- Author: Aniket Ghule
-- Date: May 2026
-- ================================================

-- Query 1: Total Sales & Profit by Region
SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- Query 2: Sales by Category
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

-- Query 3: Top 10 Products by Sales
SELECT 
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Query 4: Yearly Sales Trend
SELECT 
    order_year,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY order_year
ORDER BY order_year ASC;

-- Query 5: Products Above Average Sales (Subquery)
SELECT 
    product_name,
    ROUND(SUM(sales)::numeric, 2) AS total_sales
FROM sales_data
GROUP BY product_name
HAVING SUM(sales) > (SELECT AVG(sales) FROM sales_data)
ORDER BY total_sales DESC
LIMIT 10;