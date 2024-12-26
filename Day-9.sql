-- Question: A community is hosting a series of festive feasts, and they want to ensure a balanced menu. Write a query to identify the top 3 most calorie-dense dishes (calories per gram) served for each event. Include the dish_name, event_name, and the calculated calorie density in your results.
-- Table name: events
CREATE TABLE events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100)
);
INSERT INTO events (event_id, event_name) VALUES
(1, 'Christmas Eve Dinner'),
(2, 'New Years Feast'),
(3, 'Winter Solstice Potluck');

-- Table name: menu
CREATE TABLE menu (
    dish_id INT PRIMARY KEY,
    dish_name VARCHAR(100),
    event_id INT,
    calories INT,
    weight_g INT,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);
INSERT INTO menu (dish_id, dish_name, event_id, calories, weight_g) VALUES
(1, 'Roast Turkey', 1, 3500, 5000),
(2, 'Chocolate Yule Log', 1, 2200, 1000),
(3, 'Cheese Fondue', 2, 1500, 800),
(4, 'Holiday Fruitcake', 3, 4000, 1200),
(5, 'Honey Glazed Ham', 2, 2800, 3500);

-- Query
WITH cte AS (
    SELECT 
        dish_name,
        event_id,
         calories/weight_g  AS grams_per_calorie,
        DENSE_RANK() OVER (PARTITION BY event_id ORDER BY calories/weight_g DESC) AS rnk
    FROM 
        menu
)
SELECT 
    c.dish_name, 
    e.event_name, 
    c.grams_per_calorie
FROM 
    cte AS c
INNER JOIN 
    events AS e
ON 
    c.event_id = e.event_id
WHERE 
    c.rnk <= 3
ORDER BY grams_per_calorie
    




