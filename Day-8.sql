-- Question: You are managing inventory in Santa's workshop. Which gifts are meant for "good" recipients? List the gift name and its weight.
-- Table name: gifts
CREATE TABLE gifts (
    gift_id INT PRIMARY KEY,
    gift_name VARCHAR(100),
    recipient_type VARCHAR(50),
    weight_kg DECIMAL(5, 2)
);
INSERT INTO gifts (gift_id, gift_name, recipient_type, weight_kg) VALUES
(1, 'Toy Train', 'good', 2.5),
(2, 'Lumps of Coal', 'naughty', 1.5),
(3, 'Teddy Bear', 'good', 1.2),
(4, 'Chocolate Bar', 'good', 0.3),
(5, 'Board Game', 'naughty', 1.8);

-- Query
select gift_name,weight_kg
from gifts
where recipient_type='good'
