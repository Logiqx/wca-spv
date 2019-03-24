-- Drop the existing world rollup table
DROP TABLE IF EXISTS RanksSingleWorldRollup;

-- Drop the existing continent rollup table
DROP TABLE IF EXISTS RanksSingleContinentRollup;

-- Drop the existing country rollup table
DROP TABLE IF EXISTS RanksSingleCountryRollup;

-- Create the world ranks rollup table - required for the world centile rankings
CREATE TABLE RanksSingleWorldRollup
(
    eventId VARCHAR(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    best INT NOT NULL DEFAULT 0,
    numPersons INT NOT NULL DEFAULT 0,
    PRIMARY KEY (eventId)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the continent ranks rollup table - required for the continent centile rankings
CREATE TABLE RanksSingleContinentRollup
(
    eventId VARCHAR(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    continentName VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    best INT NOT NULL DEFAULT 0,
    numPersons INT NOT NULL DEFAULT 0,
    PRIMARY KEY (eventId, continentName)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the country ranks rollup table - required for the country centile rankings
CREATE TABLE RanksSingleCountryRollup
(
    eventId VARCHAR(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    countryName VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    best INT NOT NULL DEFAULT 0,
    numPersons INT NOT NULL DEFAULT 0,
    PRIMARY KEY (eventId, countryName)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
-- Populate the world ranks rollup table
INSERT INTO RanksSingleWorldRollup (eventId, best, numPersons)
SELECT      eventId, MIN(best) AS best,
            (CASE WHEN COUNT(worldRank) > MAX(worldRank) THEN COUNT(worldRank) ELSE MAX(worldRank) END) AS numPersons
FROM        RanksSingle
GROUP BY    eventId;

-- Populate the continent ranks rollup table
INSERT INTO RanksSingleContinentRollup (eventId, continentName, best, numPersons)
SELECT      eventId, continentName, MIN(best) AS best,
            (CASE WHEN COUNT(continentRank) > MAX(continentRank) THEN COUNT(continentRank) ELSE MAX(continentRank) END) AS numPersons
FROM        RanksSingle r
INNER JOIN  PersonsExtra p ON p.id = r.personId
WHERE       continentRank > 0
GROUP BY    eventId, continentName;

-- Populate country rollup ranks table
INSERT INTO RanksSingleCountryRollup (eventId, countryName, best, numPersons)
SELECT      eventId, countryName, MIN(best) AS best,
            (CASE WHEN COUNT(countryRank) > MAX(countryRank) THEN COUNT(countryRank) ELSE MAX(countryRank) END) AS numPersons
FROM        RanksSingle r
INNER JOIN  PersonsExtra p ON p.id = r.personId
WHERE       countryRank > 0
GROUP BY    eventId, countryName;

-- Update statistics
ANALYZE TABLE RanksSingleWorldRollup;
ANALYZE TABLE RanksSingleContinentRollup;
ANALYZE TABLE RanksSingleCountryRollup;

