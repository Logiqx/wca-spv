-- Drop the existing ranks temporary table
DROP TEMPORARY TABLE IF EXISTS RanksAverageTemp;

-- Create the ranks temporary table to include centiles
CREATE TEMPORARY TABLE RanksAverageTemp
(
    personId VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
    eventId VARCHAR(6) COLLATE utf8_unicode_ci NOT NULL,
    best INT DEFAULT 0 NOT NULL,
    worldRank INT DEFAULT 0 NOT NULL,
    continentRank INT DEFAULT 0 NOT NULL,
    countryRank INT DEFAULT 0 NOT NULL,
	continentName VARCHAR(50),
	countryName VARCHAR(50),
    PRIMARY KEY (personId, eventId)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Populate the ranks temporary table
-- Note: "RIGHT JOIN" and "WHERE" have been used because a regular "INNER JOIN" never seems to complete on MySQL 5.5
INSERT INTO RanksAverageTemp (personId, eventId, best, worldRank, continentRank, countryRank, continentName, countryName)
SELECT      r.personId,
            r.eventId,
            r.best,
            r.worldRank,
            r.continentRank,
            r.countryRank,
            p.continentName,
            p.countryName
FROM        RanksAverage r
RIGHT JOIN  PersonsExtra p ON p.id = r.personId
WHERE       r.personid IS NOT NULL;

-- Update statistics
ANALYZE TABLE RanksAverageTemp;

-- Drop the existing ranks extra table
DROP TABLE IF EXISTS RanksAverageExtra;

-- Create the ranks extra table to include centiles
CREATE TABLE RanksAverageExtra
(
    personId VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
    eventId VARCHAR(6) COLLATE utf8_unicode_ci NOT NULL,
    best INT DEFAULT 0 NOT NULL,
    worldRank INT DEFAULT 0 NOT NULL,
    continentRank INT DEFAULT 0 NOT NULL,
    countryRank INT DEFAULT 0 NOT NULL,
    worldCentile TINYINT DEFAULT 0 NOT NULL,
    continentCentile TINYINT DEFAULT 0 NOT NULL,
    countryCentile TINYINT DEFAULT 0 NOT NULL,
    PRIMARY KEY (personId, eventId)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Populate the ranks extra table
-- Note: The Ranks table has small gaps due to people changing their nationality, hence the use of maxRank for centile calculations
INSERT INTO RanksAverageExtra (personId, eventId, best, worldRank, continentRank, countryRank, worldCentile, continentCentile, countryCentile)
SELECT      r.personId,
            r.eventId,
            r.best,
            r.worldRank,
            r.continentRank,
            r.countryRank,
            CEILING(100.0 * r.worldRank / r1.maxRank) AS worldCentile,
            CEILING(100.0 * r.continentRank / r2.maxRank) AS continentCentile,
            CEILING(100.0 * r.countryRank / r3.maxRank) AS countryCentile
FROM        RanksAverageTemp r
INNER JOIN  RanksAverageWorldRollup r1 ON r.eventId = r1.eventId
INNER JOIN  RanksAverageContinentRollup r2 ON r2.eventId = r.eventId AND r2.continentName = r.continentName
INNER JOIN  RanksAverageCountryRollup r3 ON r3.eventId = r.eventId AND r3.countryName = r.countryName;

-- Update statistics
ANALYZE TABLE RanksAverageExtra;

