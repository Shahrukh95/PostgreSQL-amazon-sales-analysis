-- Total Revenue
SELECT sum(quantity * price_per_unit) AS total_revenue FROM order_details;

--  total_revenue
-- ---------------
--      132012.86
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
JOIN categories AS c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sales DESC
LIMIT 10;

--              category_name              | total_sales
-- ----------------------------------------+-------------
--  Men's Watches                          |    45229.82
--  Office Electronics                     |    25600.94
--  Virtual Reality Hardware & Accessories |    14763.77
--  Laptop Bags                            |    12641.05



-- Top 5 customers by total spending
SELECT c.first_name, c.last_name, c.email, sum(o.total_amount) AS total_spent
FROM customers AS c
JOIN orders AS o on c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name, c.email
ORDER BY total_spent DESC
LIMIT 5;

--  first_name  | last_name |          email          | total_spent
-- -------------+-----------+-------------------------+-------------
--  Harmonia    | Lemarie   | hlemarie39@upenn.edu    |     5480.76
--  Lynett      | Gibbens   | lgibbens1r@columbia.edu |     5252.00
--  Alejandrina | Nordass   | anordassa5@nhs.uk       |     3959.38
--  Genevieve   | Loads     | gloads3@blogspot.com    |     3135.10
--  Saba        | Gierok    | sgierok34@vimeo.com     |     3104.55



-- Average order value
SELECT ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders;

--  avg_order_value
-- -----------------
--           110.01
-- (1 row)



-- Count of orders placed by each customer
SELECT c.first_name, c.last_name, c.email, count(o.order_id) AS order_count
FROM customers AS c
JOIN orders AS o on c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name, c.email
ORDER BY order_count DESC;

--   first_name  |   last_name   |               email               | order_count
-- --------------+---------------+-----------------------------------+-------------
--  Gregoire     | Nelson        | gnelson5h@baidu.com               |          10
--  Engelbert    | Tregensoe     | etregensoeb0@webmd.com            |           9
--  Cristin      | Haquard       | chaquard2s@hao123.com             |           8




-- Revenue generated per product
SELECT p.name, od.price_per_unit, sum(od.quantity) AS quantity_sold, sum(od.quantity * od.price_per_unit) AS total_revenue
FROM order_details AS od
JOIN products AS p on p.product_id = od.product_id
GROUP BY p.name, od.price_per_unit
ORDER BY total_revenue DESC;


-- -[ RECORD 1 ]--+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- name           | Formula 1 CAU1115 Mens Quartz Watch Black Dial Chronograph Ss 41mm
-- price_per_unit | 1721.00
-- quantity_sold  | 6
-- total_revenue  | 10326.00
-- -[ RECORD 2 ]--+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- name           | LG CineBeam FHD Projector HF85LA - DLP Ultra Short Throw Laser Home Theater Smart Projector, White
-- price_per_unit | 1489.30
-- quantity_sold  | 5
-- total_revenue  | 7446.50

