-- Question: We are hosting a gift party and need to ensure every guest receives a gift. Using the guests and guest_gifts tables, write a query to identify the guest(s) who have not been assigned a gift (i.e. they are not listed in the guest_gifts table).
-- Table name: guests
CREATE TABLE guests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(100)
);
INSERT INTO guests (guest_id, guest_name) VALUES
(1, 'Cindy Lou'),
(2, 'The Grinch'),
(3, 'Max the Dog'),
(4, 'Mayor May Who');

-- Table name: guest_gifts
CREATE TABLE guest_gifts (
    gift_id INT,
    guest_id INT,
    gift_name VARCHAR(100),
    PRIMARY KEY (gift_id, guest_id),
    FOREIGN KEY (gift_id) REFERENCES gifts(gift_id),
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id)
);
INSERT INTO guest_gifts (gift_id, guest_id, gift_name) VALUES
(1, 1, 'Toy Train'),
(2, 1, 'Plush Bear'),
(3, 2, 'Bag of Coal'),
(4, 2, 'Sleigh Bell'),
(5, 3, 'Dog Treats');

-- Query
select guest_id
from guests
where guest_id not in(select guest_id from guest_gifts)
