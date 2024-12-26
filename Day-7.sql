-- Question: The owner of a winter market wants to know which vendors have generated the highest revenue overall. For each vendor, calculate the total revenue for all their items and return a list of the top 2 vendors by total revenue. Include the vendor_name and total_revenue in your results.
-- Table name: vendors
CREATE TABLE vendors (
    vendor_id INT PRIMARY KEY,
    vendor_name VARCHAR(100),
    market_location VARCHAR(100)
);
INSERT INTO vendors (vendor_id, vendor_name, market_location) VALUES
(1, 'Cozy Crafts', 'Downtown Square'),
(2, 'Sweet Treats', 'Central Park'),
(3, 'Winter Warmers', 'Downtown Square');

-- Table name: sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    vendor_id INT,
    item_name VARCHAR(100),
    quantity_sold INT,
    price_per_unit DECIMAL(10, 2),
    FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id)
);
INSERT INTO sales (sale_id, vendor_id, item_name, quantity_sold, price_per_unit) VALUES
(1, 1, 'Knitted Scarf', 15, 25),
(2, 2, 'Hot Chocolate', 50, 3.5),
(3, 3, 'Wool Hat', 20, 18),
(4, 1, 'Handmade Ornament', 10, 15),
(5, 2, 'Gingerbread Cookie', 30, 5);

-- Query
WITH cte AS (
    SELECT 
        vendor_id,
        quantity_sold * price_per_unit AS total
    FROM 
        sales
),
cte1 AS (
    SELECT 
        cte.vendor_id, 
        v.vendor_name, 
        SUM(cte.total) AS t
    FROM 
        cte 
    INNER JOIN 
        vendors AS v
    ON 
        cte.vendor_id = v.vendor_id
    GROUP BY 
        cte.vendor_id
)
SELECT 
    vendor_name, 
    t AS total_sales
FROM 
    cte1
ORDER BY 
    total_sales deSC
LIMIT 2;