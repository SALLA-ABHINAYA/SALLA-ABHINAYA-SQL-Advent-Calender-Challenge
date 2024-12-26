-- Question: Santa needs to optimize his sleigh for Christmas deliveries. Write a query to calculate the total weight of gifts for each recipient type (good or naughty) and determine what percentage of the total weight is allocated to each type. Include the recipient_type, total_weight, and weight_percentage in the result.
-- Table name: gifts
CREATE TABLE gifts (
    gift_id INT PRIMARY KEY,
    gift_name VARCHAR(100),
    recipient_type VARCHAR(10),
    weight_kg DECIMAL(5, 2)
);
INSERT INTO gifts (gift_id, gift_name, recipient_type, weight_kg) VALUES
(1, 'Toy Train', 'good', 2.5),
(2, 'Lumps of Coal', 'naughty', 1.5),
(3, 'Teddy Bear', 'good', 1.2),
(4, 'Chocolate Bar', 'good', 0.3),
(5, 'Board Game', 'naughty', 1.8);

-- Query
with cte as (
    select sum(weight_kg) as total_weight,recipient_type,(sum(weight_kg)/sum(weight_kg)over ())*100 as weight_percentage
    from gifts
    group by recipient_type
)
select recipient_type,total_weight,weight_percentage
from cte