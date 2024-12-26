-- Question: Scientists are studying the diets of polar bears. Write a query to find the maximum amount of food (in kilograms) consumed by each polar bear in a single meal December 2024. Include the bear_name and biggest_meal_kg, and sort the results in descending order of largest meal consumed.
-- Table name: polar_bears
CREATE TABLE polar_bears (
    bear_id INT PRIMARY KEY,
    bear_name VARCHAR(100),
    age INT
);
INSERT INTO polar_bears (bear_id, bear_name, age) VALUES
(1, 'Snowball', 10),
(2, 'Frosty', 7),
(3, 'Iceberg', 15);

-- Table name: meal_log
CREATE TABLE meal_log (
    log_id INT PRIMARY KEY,
    bear_id INT,
    food_type VARCHAR(100),
    food_weight_kg DECIMAL(5, 2),
    date DATE,
    FOREIGN KEY (bear_id) REFERENCES polar_bears(bear_id)
);
INSERT INTO meal_log (log_id, bear_id, food_type, food_weight_kg, date) VALUES
(1, 1, 'Seal', 30, '2024-12-01'),
(2, 2, 'Fish', 15, '2024-12-02'),
(3, 1, 'Fish', 10, '2024-12-03'),
(4, 3, 'Seal', 25, '2024-12-04'),
(5, 2, 'Seal', 20, '2024-12-05'),
(6, 3, 'Fish', 18, '2024-12-06');

-- Query
with cte as(
    select bear_id,max(food_weight_kg) as biggest_meal_kg
    from meal_log
    where date between '2024-12-01' and '2024-12-31'
    group by bear_id
)
select bear_name,biggest_meal_kg
from polar_bears inner join cte on polar_bears.bear_id=cte.bear_id
order by biggest_meal_kg desc