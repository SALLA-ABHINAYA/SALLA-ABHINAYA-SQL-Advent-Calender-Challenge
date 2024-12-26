-- Question: A family reunion is being planned, and the organizer wants to identify the three family members with the most children. Write a query to calculate the total number of children for each parent and rank them. Include the parent’s name and their total number of children in the result.
-- Table name: family_members
CREATE TABLE family_members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);
INSERT INTO family_members (member_id, name, age) VALUES
(1, 'Alice', 30),
(2, 'Bob', 58),
(3, 'Charlie', 33),
(4, 'Diana', 55),
(5, 'Eve', 5),
(6, 'Frank', 60),
(7, 'Grace', 32),
(8, 'Hannah', 8),
(9, 'Ian', 12),
(10, 'Jack', 3);

-- Table name: parent_child_relationships
CREATE TABLE parent_child_relationships (
    parent_id INT,
    child_id INT,
    FOREIGN KEY (parent_id) REFERENCES family_members(member_id),
    FOREIGN KEY (child_id) REFERENCES family_members(member_id)
);
INSERT INTO parent_child_relationships (parent_id, child_id) VALUES
(2, 1),
(3, 5),
(4, 1),
(6, 7),
(6, 8),
(7, 9),
(7, 10),
(4, 8);

-- Query
with cte as (
    select 
        parent_child_relationships.parent_id, 
        count(parent_child_relationships.child_id) as total_children
    from parent_child_relationships
    group by parent_child_relationships.parent_id
)
select 
    family_members.name as parent_name, 
    cte.total_children
from cte
inner join family_members 
    on family_members.member_id = cte.parent_id
order by cte.total_children desc
limit 3;
