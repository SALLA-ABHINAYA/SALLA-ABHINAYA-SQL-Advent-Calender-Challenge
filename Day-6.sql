-- Question: Scientists are tracking polar bears across the Arctic to monitor their migration patterns and caloric intake. Write a query to find the top 3 polar bears that have traveled the longest total distance in December 2024. Include their bear_id, bear_name, and total_distance_traveled in the results.
-- Table name: polar_bears
CREATE TABLE polar_bears (
    bear_id INT PRIMARY KEY,
    bear_name VARCHAR(100),
    age INT
);
INSERT INTO polar_bears (bear_id, bear_name, age) VALUES
(1, 'Snowball', 10),
(2, 'Frosty', 7),
(3, 'Iceberg', 15),
(4, 'Chilly', 5);

-- Table name: tracking
CREATE TABLE tracking (
    tracking_id INT PRIMARY KEY,
    bear_id INT,
    distance_km INT,
    date DATE,
    FOREIGN KEY (bear_id) REFERENCES polar_bears(bear_id)
);
INSERT INTO tracking (tracking_id, bear_id, distance_km, date) VALUES
(1, 1, 25, '2024-12-01'),
(2, 2, 40, '2024-12-02'),
(3, 1, 30, '2024-12-03'),
(4, 3, 50, '2024-12-04'),
(5, 2, 35, '2024-12-05'),
(6, 4, 20, '2024-12-06'),
(7, 3, 55, '2024-12-07'),
(8, 1, 45, '2024-12-08');

-- Query
with cte as(
    select p.bear_id,bear_name,sum(t.distance_km) as total_distance_traveled
    from tracking as t inner join polar_bears as p 
    on t.bear_id=p.bear_id
    WHERE 
        t.date BETWEEN '2024-12-01' AND '2024-12-31'
    group by p.bear_id  
)
select * from cte 
order by total_distance_traveled desc
limit 3
