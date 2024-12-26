-- Question: You are preparing holiday gifts for your family. Who in the family_members table are celebrating their birthdays in December 2024? List their name and birthday.
-- Table name: family_members
CREATE TABLE family_members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    relationship VARCHAR(50),
    birthday DATE
);
INSERT INTO family_members (member_id, name, relationship, birthday) VALUES
(1, 'Dawn', 'Sister', '2024-12-24'),
(2, 'Bob', 'Father', '2024-05-20'),
(3, 'Charlie', 'Brother', '2024-12-25'),
(4, 'Diana', 'Mother', '2024-03-15');

-- Query
select name,birthday
from family_members
where birthday between "2024-12-1" and "2024-12-31"
