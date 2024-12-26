-- Question: A collector wants to identify the top 3 snow globes with the highest number of figurines. Write a query to rank them and include their globe_name, number of figurines, and material.
-- Table name: snow_globes
CREATE TABLE snow_globes (
    globe_id INT PRIMARY KEY,
    globe_name VARCHAR(100),
    volume_cm3 INT,
    material VARCHAR(50)
);
INSERT INTO snow_globes (globe_id, globe_name, volume_cm3, material) VALUES
(1, 'Winter Wonderland', 500, 'Glass'),
(2, 'Santas Workshop', 300, 'Plastic'),
(3, 'Frozen Forest', 400, 'Glass'),
(4, 'Holiday Village', 600, 'Glass');

-- Table name: figurines
CREATE TABLE figurines (
    figurine_id INT PRIMARY KEY,
    globe_id INT,
    figurine_type VARCHAR(100),
    FOREIGN KEY (globe_id) REFERENCES snow_globes(globe_id)
);
INSERT INTO figurines (figurine_id, globe_id, figurine_type) VALUES
(1, 1, 'Snowman'),
(2, 1, 'Tree'),
(3, 2, 'Santa Claus'),
(4, 2, 'Elf'),
(5, 2, 'Gift Box'),
(6, 3, 'Reindeer'),
(7, 3, 'Tree'),
(8, 4, 'Snowman'),
(9, 4, 'Santa Claus'),
(10, 4, 'Tree'),
(11, 4, 'Elf'),
(12, 4, 'Gift Box');

-- Query
with cte as(
    select globe_id,count(*) as c
    from figurines
    group by globe_id
)
select s.globe_name,cte.c,s.material
from snow_globes  as s inner join cte
on s.globe_id=cte.globe_id
order by cte.c desc
limit 3