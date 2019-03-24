-- Drop the existing persons extra table
DROP TABLE IF EXISTS PersonsExtra;

-- Create the persons extra table - primarily for direct access to country + continent names
CREATE TABLE PersonsExtra
(
    id VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    name VARCHAR(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    countryName VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    continentName VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    gender CHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    regYear SMALLINT(4) NOT NULL,
    PRIMARY KEY (id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Populate the persons extra table
-- Note: This picks the latest details from the Persons table (Country, Continent, etc)
INSERT INTO PersonsExtra (id, name, countryName, continentName, gender, regYear)
SELECT      p.id, MIN(p.name) as name, MIN(c1.name) AS countryName, MIN(c2.name) AS continentName, MIN(p.gender) AS gender,
            MIN(CAST(LEFT(p.id, 4) AS UNSIGNED)) AS regYear
FROM        Persons p
INNER JOIN  Countries c1 ON c1.id = p.countryId
INNER JOIN  Continents c2 ON c2.id = c1.continentId
WHERE       p.subId = 1
GROUP BY    p.id;

-- Update statistics
ANALYZE TABLE PersonsExtra;

