-- Question: Which ski resorts had snowfall greater than 50 inches?
-- Table name: snowfall
CREATE TABLE snowfall (
    resort_name VARCHAR(100),
    location VARCHAR(100),
    snowfall_inches INT,
    PRIMARY KEY (resort_name, location)
);
INSERT INTO snowfall (resort_name, location, snowfall_inches) VALUES
('Snowy Peaks', 'Colorado', 60),
('Winter Wonderland', 'Utah', 45),
('Frozen Slopes', 'Alaska', 75);

-- Query
select resort_name 
from snowfall
where snowfall_inches>50
