-- Total Revenue
SELECT sum(price) as total_revenue FROM products;

--  total_revenue
-- ---------------
--       56697.61
-- (1 row)



-- Monthly revenue trends over the past year
SELECT TO_CHAR(order_date, 'MM-YYYY') AS month, SUM(total_amount) AS monthly_revenue
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY TO_CHAR(order_date, 'MM-YYYY')
ORDER BY month;

--   month  | monthly_revenue
-- ---------+-----------------
--  01-2024 |         4058.69
--  02-2024 |         5018.92
--  03-2024 |         5030.96
--  04-2024 |         3105.91
--  05-2024 |         3986.78
--  06-2024 |        11856.96
--  07-2024 |         6149.13
--  08-2024 |         7999.02
--  09-2024 |         2552.70
--  10-2024 |         5057.07
--  11-2024 |         2368.75
--  12-2024 |         2714.06
-- (12 rows)



-- Top 10 most purchased products.
SELECT p.name, p.product_url, od.product_id, sum(od.quantity) AS total_quantity 
FROM order_details AS od
JOIN products AS p ON od.product_id = p.product_id 
GROUP BY p.name, p.product_url, od.product_id
ORDER BY total_quantity DESC
LIMIT 10;

-- -[ RECORD 1 ]--+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- name           | Globular Cluster CPQ2 Cooling Pad Interface Kit for Meta Quest 2 - Keep Cool in VR - Hot/Sweat/Stuffiness Fix
-- product_url    | https://www.amazon.com/dp/B0C2HS59SB
-- product_id     | B0C2HS59SB
-- total_quantity | 14
-- -[ RECORD 2 ]--+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- name           | Upper Midland Products Pack Of 100 2.5 Oz Disposable Espresso Cuban Coffee Mini Cups With Lids, Paper Cups With Plastic Dome Sip Lid Sample Size Multi Use (100 Count (Pack of 1))
-- product_url    | https://www.amazon.com/dp/B09S7G7NLK
-- product_id     | B09S7G7NLK
-- total_quantity | 13


-- Total Sales Per Category
SELECT c.category_name, sum(od.quantity * od.price_per_unit) AS total_sales 
FROM order_details AS od
JOIN products AS p ON od.product_id = p.product_id
JOIN categories as c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sales DESC
LIMIT 10;

-- -[ RECORD 1 ]-+---------------------------------------
-- category_name | Men's Watches
-- total_sales   | 45229.82
-- -[ RECORD 2 ]-+---------------------------------------
-- category_name | Office Electronics
-- total_sales   | 25600.94
-- -[ RECORD 3 ]-+---------------------------------------
-- category_name | Virtual Reality Hardware & Accessories
-- total_sales   | 14763.77



