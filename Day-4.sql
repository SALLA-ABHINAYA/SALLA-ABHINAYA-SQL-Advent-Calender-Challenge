-- Question: You’re planning your next ski vacation and want to find the best regions with heavy snowfall. Given the tables resorts and snowfall, find the average snowfall for each region and sort the regions in descending order of average snowfall. Return the columns region and average_snowfall.

-- Table name: ski_resorts
CREATE TABLE ski_resorts (
    resort_id INT PRIMARY KEY,
    resort_name VARCHAR(100),
    region VARCHAR(100)
);
INSERT INTO ski_resorts (resort_id, resort_name, region) VALUES
(1, 'Snowy Peaks', 'Rocky Mountains'),
(2, 'Winter Wonderland', 'Wasatch Range'),
(3, 'Frozen Slopes', 'Alaska Range'),
(4, 'Powder Paradise', 'Rocky Mountains');


-- Table name: snowfall
CREATE TABLE snowfall (
    resort_id INT PRIMARY KEY,
    snowfall_inches INT,
    FOREIGN KEY (resort_id) REFERENCES ski_resorts(resort_id)
);
INSERT INTO snowfall (resort_id, snowfall_inches) VALUES
(1, 60),
(2, 45),
(3, 75),
(4, 55);

-- Query
with cte as (
    select *,avg(snowfall_inches) as average
    from snowfall inner join ski_resorts
    on snowfall.resort_id=ski_resorts.resort_id
    group by region
    order by avg(snowfall_inches) desc
)
select region ,average
from cte
