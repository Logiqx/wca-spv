-- Drop the existing world rollup table
DROP TABLE IF EXISTS RanksAverageWorldRollup;

-- Drop the existing continent rollup table
DROP TABLE IF EXISTS RanksAverageContinentRollup;

-- Drop the existing country rollup table
DROP TABLE IF EXISTS RanksAverageCountryRollup;

-- Create the world ranks rollup table - required for the world centile rankings
CREATE TABLE RanksAverageWorldRollup
(
    eventId VARCHAR(6) COLLATE utf8_unicode_ci NOT NULL,
    best INT NOT NULL DEFAULT 0,
    numRank INT NOT NULL DEFAULT 0,
    maxRank INT NOT NULL DEFAULT 0
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the continent ranks rollup table - required for the continent centile rankings
CREATE TABLE RanksAverageContinentRollup
(
    eventId VARCHAR(6) COLLATE utf8_unicode_ci NOT NULL,
    continentName VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    best INT NOT NULL DEFAULT 0,
    numRank INT NOT NULL DEFAULT 0,
    maxRank INT NOT NULL DEFAULT 0
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the country ranks rollup table - required for the country centile rankings
CREATE TABLE RanksAverageCountryRollup
(
    eventId VARCHAR(6) COLLATE utf8_unicode_ci NOT NULL,
    countryName VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    best INT NOT NULL DEFAULT 0,
    numRank INT NOT NULL DEFAULT 0,
    maxRank INT NOT NULL DEFAULT 0
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
-- Populate the world ranks rollup table
INSERT INTO RanksAverageWorldRollup (eventId, best, numRank, maxRank)
SELECT      eventId, MIN(best) AS best, COUNT(worldRank) AS numRank, MAX(worldRank) AS maxRank
FROM        RanksAverage
GROUP BY    eventId;

-- Populate the continent ranks rollup table
INSERT INTO RanksAverageContinentRollup (eventId, continentName, best, numRank, maxRank)
SELECT      eventId, continentName, MIN(best) AS best, COUNT(continentRank) AS numRank, MAX(continentRank) AS maxRank
FROM        RanksAverage r
INNER JOIN  PersonsExtra p ON p.id = r.personId
GROUP BY    eventId, continentName;

-- Populate country rollup ranks table
INSERT INTO RanksAverageCountryRollup (eventId, countryName, best, numRank, maxRank)
SELECT      eventId, countryName, MIN(best) AS best, COUNT(countryRank) AS numRank, MAX(countryRank) AS maxRank
FROM        RanksAverage r
INNER JOIN  PersonsExtra p ON p.id = r.personId
GROUP BY    eventId, countryName;

-- Add primary keys
ALTER TABLE RanksAverageWorldRollup ADD PRIMARY KEY (eventId);
ALTER TABLE RanksAverageContinentRollup ADD PRIMARY KEY (eventId, continentName);
ALTER TABLE RanksAverageCountryRollup ADD PRIMARY KEY (eventId, countryName);

