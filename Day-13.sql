-- Question: We need to make sure Santa's sleigh is properly balanced. Find the total weight of gifts for each recipient.
-- Table name: gifts
CREATE TABLE gifts (
    gift_id INT PRIMARY KEY,
    gift_name VARCHAR(100),
    recipient VARCHAR(100),
    weight_kg DECIMAL(5, 2)
);
INSERT INTO gifts (gift_id, gift_name, recipient, weight_kg) VALUES
(1, 'Toy Train', 'John', 2.5),
(2, 'Chocolate Box', 'Alice', 0.8),
(3, 'Teddy Bear', 'Sophia', 1.2),
(4, 'Board Game', 'John', NULL);

-- Query
select recipient,sum(weight_kg)
from gifts
group by recipient