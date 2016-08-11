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
FROM        RanksAverage r
INNER JOIN  PersonsExtra p ON p.id = r.personId
INNER JOIN  RanksAverageWorldRollup r1 ON r1.eventId = r.eventId
INNER JOIN  RanksAverageContinentRollup r2 ON r2.eventId = r.eventId AND r2.continentName = p.continentName
INNER JOIN  RanksAverageCountryRollup r3 ON r3.eventId = r.eventId AND r3.countryName = p.countryName;
