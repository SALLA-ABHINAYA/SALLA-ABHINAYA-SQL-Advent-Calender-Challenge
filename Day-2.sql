-- Question: Santa wants to know which gifts weigh more than 1 kg. Can you list them?
-- Table name: gifts

CREATE TABLE gifts (
    gift_name VARCHAR(100),
    recipient VARCHAR(100),
    weight_kg DECIMAL(5, 2)
);
INSERT INTO gifts (gift_name, recipient, weight_kg) VALUES
('Toy Train', 'John', 2.5),
('Chocolate Box', 'Alice', 0.8),
('Teddy Bear', 'Sophia', 1.2),
('Board Game', 'Liam', 0.9);


-- Query
select gift_name
from gifts
where weight_kg>1