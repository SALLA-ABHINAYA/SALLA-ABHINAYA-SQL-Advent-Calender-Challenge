-- Question: You are tracking your friends' New Year’s resolution progress. Write a query to calculate the following for each friend: number of resolutions they made, number of resolutions they completed, and success percentage (% of resolutions completed) and a success category based on the success percentage:
-- - Green: If success percentage is greater than 75%.
-- - Yellow: If success percentage is between 50% and 75% (inclusive).
-- - Red: If success percentage is less than 50%.

-- Table name: resolutions
CREATE TABLE resolutions (
    resolution_id INT PRIMARY KEY,
    friend_name VARCHAR(100),
    resolution VARCHAR(255),
    is_completed BOOLEAN
);
INSERT INTO resolutions (resolution_id, friend_name, resolution, is_completed) VALUES
(1, 'Alice', 'Exercise daily', 1),
(2, 'Alice', 'Read 20 books', 0),
(3, 'Bob', 'Save money', 0),
(4, 'Bob', 'Eat healthier', 1),
(5, 'Charlie', 'Travel more', 1),
(6, 'Charlie', 'Learn a new skill', 1),
(7, 'Diana', 'Volunteer monthly', 1),
(8, 'Diana', 'Drink more water', 0),
(9, 'Diana', 'Sleep 8 hours', 1);

-- Query
WITH cte AS (
    SELECT 
        friend_name,
        COUNT(*) AS no_of_resolutions,
        SUM(is_completed) AS completed,
        CASE 
            WHEN COUNT(*) = 0 THEN 0
            ELSE (SUM(is_completed) * 100.0 / COUNT(*))
        END AS completion_percentage
    FROM 
        resolutions
    GROUP BY 
        friend_name
)
SELECT 
    friend_name, 
    no_of_resolutions, 
    completed, 
    completion_percentage,
    CASE 
        WHEN completion_percentage > 75 THEN 'Green'
        WHEN completion_percentage BETWEEN 50 AND 75 THEN 'Yellow'
        ELSE 'Red'
    END AS status
FROM 
    cte;


