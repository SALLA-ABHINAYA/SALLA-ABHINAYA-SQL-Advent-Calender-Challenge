-- Question: You’re trying to identify the most calorie-packed candies to avoid during your holiday binge. Write a query to rank candies based on their calorie count within each category. Include the candy_name, candy_category, calories, and rank (rank_in_category) within the category.
-- Table name: candy_nutrition

CREATE TABLE candies (
    candy_id INT PRIMARY KEY,
    candy_name VARCHAR(100),
    calories INT,
    candy_category VARCHAR(50)
);
INSERT INTO candies (candy_id, candy_name, calories, candy_category) VALUES
(1, 'Candy Cane', 200, 'Sweets'),
(2, 'Chocolate Bar', 250, 'Chocolate'),
(3, 'Gingerbread Cookie', 150, 'Baked Goods'),
(4, 'Lollipop', 100, 'Sweets'),
(5, 'Dark Chocolate Truffle', 180, 'Chocolate'),
(6, 'Marshmallow', 900, 'Sweets'),
(7, 'Sugar Cookie', 140, 'Baked Goods');

-- Query
select candy_name,candy_category,calories,dense_rank()over(partition by candy_category order by calories desc)
from candy_nutrition