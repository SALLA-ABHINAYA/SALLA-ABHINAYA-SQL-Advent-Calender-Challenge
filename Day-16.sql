-- Question: As the owner of a candy store, you want to understand which of your products are selling best. Write a query to calculate the total revenue generated from each candy category.
-- Table name: candy_sales
CREATE TABLE candy_sales (
    sale_id INT PRIMARY KEY,
    candy_name VARCHAR(100),
    quantity_sold INT,
    price_per_unit DECIMAL(5, 2),
    category VARCHAR(50)
);
INSERT INTO candy_sales (sale_id, candy_name, quantity_sold, price_per_unit, category) VALUES
(1, 'Candy Cane', 20, 1.5, 'Sweets'),
(2, 'Chocolate Bar', 10, 2.0, 'Chocolate'),
(3, 'Lollipop', 5, 0.75, 'Sweets'),
(4, 'Dark Chocolate Truffle', 8, 2.5, 'Chocolate'),
(5, 'Gummy Bears', 15, 1.2, 'Sweets'),
(6, 'Chocolate Fudge', 12, 3.0, 'Chocolate');

-- Query

with cte as(
    select candy_name,category ,quantity_sold*price_per_unit as rev
from candy_sales
)
select category,sum(rev)
from cte
group by category

