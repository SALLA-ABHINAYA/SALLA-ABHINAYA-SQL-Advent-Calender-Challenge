-- Question: We are looking for cheap gifts at the market. Which vendors are selling items priced below $10? List the unique (i.e. remove duplicates) vendor names.
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

-- Table name: item_prices
CREATE TABLE item_prices (
    item_id INT PRIMARY KEY,
    vendor_id INT,
    item_name VARCHAR(100),
    price_usd DECIMAL(5, 2),
    FOREIGN KEY (vendor_id) REFERENCES vendors(vendor_id)
);
INSERT INTO item_prices (item_id, vendor_id, item_name, price_usd) VALUES
(1, 1, 'Knitted Scarf', 25),
(2, 2, 'Hot Chocolate', 5),
(3, 2, 'Gingerbread Cookie', 3.5),
(4, 3, 'Wool Hat', 18),
(5, 3, 'Santa Pin', 2);

-- Query
with cte as(
    select vendor_id
    from item_prices
    where price_usd<10
)
select  distinct vendor_name 
from cte inner join vendors
on cte.vendor_id=vendors.vendor_id
