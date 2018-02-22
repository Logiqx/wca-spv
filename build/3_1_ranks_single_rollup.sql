-- Add primary key to the rankings for required join performance
ALTER TABLE RanksSingle ADD PRIMARY KEY(personId, eventId);
ANALYZE TABLE RanksSingle;

-- Drop the existing world rollup table
DROP TABLE IF EXISTS RanksSingleWorldRollup;

-- Drop the existing continent rollup table
DROP TABLE IF EXISTS RanksSingleContinentRollup;

-- Drop the existing country rollup table
DROP TABLE IF EXISTS RanksSingleCountryRollup;

-- Create the world ranks rollup table - required for the world centile rankings
CREATE TABLE RanksSingleWorldRollup
(
    eventId VARCHAR(6) COLLATE utf8_unicode_ci NOT NULL,
    best INT NOT NULL DEFAULT 0,
    numRank INT NOT NULL DEFAULT 0,
    maxRank INT NOT NULL DEFAULT 0,
    PRIMARY KEY (eventId)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the continent ranks rollup table - required for the continent centile rankings
CREATE TABLE RanksSingleContinentRollup
(
    eventId VARCHAR(6) COLLATE utf8_unicode_ci NOT NULL,
    continentName VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    best INT NOT NULL DEFAULT 0,
    numRank INT NOT NULL DEFAULT 0,
    maxRank INT NOT NULL DEFAULT 0,
    PRIMARY KEY (eventId, continentName)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Create the country ranks rollup table - required for the country centile rankings
CREATE TABLE RanksSingleCountryRollup
(
    eventId VARCHAR(6) COLLATE utf8_unicode_ci NOT NULL,
    countryName VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
    best INT NOT NULL DEFAULT 0,
    numRank INT NOT NULL DEFAULT 0,
    maxRank INT NOT NULL DEFAULT 0,
    PRIMARY KEY (eventId, countryName)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
-- Populate the world ranks rollup table
INSERT INTO RanksSingleWorldRollup (eventId, best, numRank, maxRank)
SELECT      eventId, MIN(best) AS best, COUNT(worldRank) AS numRank, MAX(worldRank) AS maxRank
FROM        RanksSingle
GROUP BY    eventId;

-- Populate the continent ranks rollup table
INSERT INTO RanksSingleContinentRollup (eventId, continentName, best, numRank, maxRank)
SELECT      eventId, continentName, MIN(best) AS best, COUNT(continentRank) AS numRank, MAX(continentRank) AS maxRank
FROM        RanksSingle r
INNER JOIN  PersonsExtra p ON p.id = r.personId
GROUP BY    eventId, continentName;

-- Populate country rollup ranks table
INSERT INTO RanksSingleCountryRollup (eventId, countryName, best, numRank, maxRank)
SELECT      eventId, countryName, MIN(best) AS best, COUNT(countryRank) AS numRank, MAX(countryRank) AS maxRank
FROM        RanksSingle r
INNER JOIN  PersonsExtra p ON p.id = r.personId
GROUP BY    eventId, countryName;

-- Update statistics
ANALYZE TABLE RanksSingleWorldRollup;
ANALYZE TABLE RanksSingleContinentRollup;
ANALYZE TABLE RanksSingleCountryRollup;

