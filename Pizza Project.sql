---- PIZZA PROJECT

-- 1 count how many unique pizzas are available.
SELECT COUNT(DISTINCT pizza_id) AS total_unique_pizzas FROM pizzaSales;

-- 2 find the top 5 most sold pizzas by quantity.
SELECT TOP 5 pizza_id, SUM(quantity) AS total_sold FROM pizzaSales GROUP BY pizza_id ORDER BY total_sold DESC;

-- 3 get the total revenue generated each month.
SELECT MONTH(order_date) AS month, SUM(total_price) AS monthly_revenue FROM pizzaSales GROUP BY MONTH(order_date) ORDER BY month;

-- 4 show the average quantity sold per pizza category.
SELECT pizza_category, AVG(quantity) AS avg_quantity FROM pizzaSales GROUP BY pizza_category;

-- 5 list all pizzas sold more than the average quantity.
SELECT pizza_id, SUM(quantity) AS total_quantity FROM pizzaSales GROUP BY pizza_id HAVING SUM(quantity) > (
  SELECT AVG(total_quantity) FROM ( SELECT SUM(quantity) AS total_quantity   FROM pizzaSales  GROUP BY pizza_id) AS sub);

-- 6 get the latest order for each pizza size.
SELECT pizza_size, order_id, order_date FROM 
( SELECT pizza_size, order_id, order_date, ROW_NUMBER() OVER (PARTITION BY pizza_size ORDER BY order_date DESC) AS rn 
    FROM pizzaSales) AS ranked WHERE rn = 1;

-- 7 find pizza categories with more than 100 total orders.
SELECT pizza_category, COUNT(DISTINCT order_id) AS total_orders FROM pizzaSales GROUP BY pizza_category HAVING COUNT(DISTINCT order_id) > 100;

-- 8 count the number of pizzas sold for each size.
SELECT pizza_size, SUM(quantity) AS total_sold FROM pizzaSales GROUP BY pizza_size ORDER BY total_sold DESC;

-- 9 get the 3 most profitable pizzas.
SELECT TOP 3 pizza_id, SUM(total_price) AS total_revenue FROM pizzaSales GROUP BY pizza_id ORDER BY total_revenue DESC;

-- 10 find all orders that include 'Mushrooms' in ingredients.
SELECT order_id, pizza_ingredients FROM pizzaSales WHERE pizza_ingredients LIKE '%Mushrooms%';

-- 11 use cte to list all large pizzas sold after July 2025.
WITH large_pizzas AS (SELECT * FROM pizzaSales WHERE pizza_size = L AND order_date > '2025-07-01')
SELECT order_id, pizza_id, order_date FROM large_pizzas;

-- 12 get the number of unique pizzas per category.
SELECT pizza_category, COUNT(DISTINCT pizza_id) AS unique_pizzas FROM pizzaSales GROUP BY pizza_category;

-- 13 find the pizza size with the highest average revenue per order.
SELECT pizza_size, AVG(total_price) AS avg_revenue FROM pizzaSales GROUP BY pizza_size ORDER BY avg_revenue DESC;

-- 14 rank pizzas by total revenue using window function.
SELECT pizza_id, SUM(total_price) AS total_revenue,  RANK() OVER (ORDER BY SUM(total_price) DESC) AS revenue_rank FROM pizzaSales GROUP BY pizza_id;

-- 15 compare pizzas of same category using self join.
SELECT a.pizza_id AS pizza1, b.pizza_id AS pizza2, a.pizza_category FROM pizzaSales a JOIN pizzaSales b ON a.pizza_category = b.pizza_category 
AND a.pizza_id < b.pizza_id GROUP BY a.pizza_id, b.pizza_id, a.pizza_category;



-- 16 create a view summarizing all insights.
CREATE VIEW vw_pizza_summary AS
SELECT * FROM (
    SELECT 'Total Unique Pizzas' AS metric, COUNT(DISTINCT pizza_id) AS value FROM pizzaSales
    UNION ALL
    SELECT 'Total Orders', COUNT(DISTINCT order_id) FROM pizzaSales
    UNION ALL
    SELECT 'Total Revenue', SUM(total_price) FROM pizzaSales
    UNION ALL
    SELECT 'Total Quantity Sold', SUM(quantity) FROM pizzaSales
) AS summary;



select * from vw_pizza_summary