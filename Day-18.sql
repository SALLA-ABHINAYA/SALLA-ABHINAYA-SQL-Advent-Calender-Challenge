-- Question: A travel agency is promoting activities for a "Summer Christmas" party. They want to identify the top 2 activities based on the average rating. Write a query to rank the activities by average rating.
-- Table name: activities
CREATE TABLE activities (
    activity_id INT PRIMARY KEY,
    activity_name VARCHAR(100)
);
INSERT INTO activities (activity_id, activity_name) VALUES
(1, 'Surfing Lessons'),
(2, 'Jet Skiing'),
(3, 'Sunset Yoga');

-- Table name: activity_ratings
CREATE TABLE activity_ratings (
    rating_id INT PRIMARY KEY,
    activity_id INT,
    rating DECIMAL(3, 1),
    FOREIGN KEY (activity_id) REFERENCES activities(activity_id)
);
INSERT INTO activity_ratings (rating_id, activity_id, rating) VALUES
(1, 1, 4.7),
(2, 1, 4.8),
(3, 1, 4.9),
(4, 2, 4.6),
(5, 2, 4.7),
(6, 2, 4.8),
(7, 2, 4.9),
(8, 3, 4.8),
(9, 3, 4.7),
(10, 3, 4.9),
(11, 3, 4.8),
(12, 3, 4.9);

-- Query
with cte as(
    select activity_id,avg(rating)as avgrate,dense_rank ()over( order by avg(rating) desc) as rnk
    from activity_ratings
    group by activity_id
)
select activity_name,avgrate
from cte inner join activities on cte.activity_id=activities.activity_id
where rnk <=2
order by rnk desc

