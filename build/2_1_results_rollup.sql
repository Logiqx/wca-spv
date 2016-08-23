-- Drop the existing rollup table
DROP TABLE IF EXISTS ResultsRollup;

-- Create the rollup table which is essentially a load of simple counts
CREATE TABLE ResultsRollup
(
    personId VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
    eventId VARCHAR(6) COLLATE utf8_unicode_ci NOT NULL,
    numComp SMALLINT DEFAULT 0 NOT NULL,
    numFinal SMALLINT DEFAULT 0 NOT NULL,
    numPodium SMALLINT DEFAULT 0 NOT NULL,
    numRound SMALLINT DEFAULT 0 NOT NULL,
    numAttempt SMALLINT DEFAULT 0 NOT NULL,
    numSuccess SMALLINT DEFAULT 0 NOT NULL,
    numDns SMALLINT DEFAULT 0 NOT NULL,
    numDnf SMALLINT DEFAULT 0 NOT NULL,
    numSingleWr SMALLINT DEFAULT 0 NOT NULL,
    numAverageWr SMALLINT DEFAULT 0 NOT NULL,
    numSingleCr SMALLINT DEFAULT 0 NOT NULL,
    numAverageCr SMALLINT DEFAULT 0 NOT NULL,
    numSingleNr SMALLINT DEFAULT 0 NOT NULL,
    numAverageNr SMALLINT DEFAULT 0 NOT NULL,
    totTime BIGINT DEFAULT 0 NOT NULL,
    PRIMARY KEY (personId, eventId)
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Populate the rollup table
INSERT INTO ResultsRollup ( personId, eventId, numComp, numFinal, numPodium, numRound, numAttempt, numSuccess, numDns, numDnf,
                            numSingleWr, numAverageWr, numSingleCr, numAverageCr, numSingleNr, numAverageNr, totTime)
SELECT      personId,
            eventId,
            CAST(COUNT(DISTINCT competitionId) AS UNSIGNED INT) AS numComp,
            CAST(SUM(IF(roundId IN ('C', 'F'), 1, 0)) AS UNSIGNED INT) AS numFinal,
            CAST(SUM(IF(roundId IN ('C', 'F') AND pos <= 3 AND best > 0, 1, 0)) AS UNSIGNED INT) AS numPodium,
            CAST(COUNT(roundId) AS UNSIGNED INT) AS numRound,
            CAST(SUM(IF(value1 != 0, 1, 0) + IF(value2 != 0, 1, 0) + IF(value3 != 0, 1, 0) + IF(value4 != 0, 1, 0) + IF(value5 != 0, 1, 0)) AS UNSIGNED INT) AS numAttempt,
            CAST(SUM(IF(value1 > 0, 1, 0) + IF(value2 > 0, 1, 0) + IF(value3 > 0, 1, 0) + IF(value4 > 0, 1, 0) + IF(value5 > 0, 1, 0)) AS UNSIGNED INT) AS numSuccess,
            CAST(SUM(IF(value1 = -2, 1, 0) + IF(value2 = -2, 1, 0) + IF(value3 = -2, 1, 0) + IF(value4 = -2, 1, 0) + IF(value5 = -2, 1, 0)) AS UNSIGNED INT) AS numDns,
            CAST(SUM(IF(value1 = -1, 1, 0) + IF(value2 = -1, 1, 0) + IF(value3 = -1, 1, 0) + IF(value4 = -1, 1, 0) + IF(value5 = -1, 1, 0)) AS UNSIGNED INT) AS numDnf,
            CAST(SUM(IF(regionalSingleRecord = 'WR', 1, 0)) AS UNSIGNED INT) AS numSingleWr,
            CAST(SUM(IF(regionalAverageRecord = 'WR', 1, 0)) AS UNSIGNED INT) AS numAverageWr,
            CAST(SUM(IF(regionalSingleRecord NOT IN ('WR', 'NR', ''), 1, 0)) AS UNSIGNED INT) AS numSingleCr,
            CAST(SUM(IF(regionalAverageRecord NOT IN ('WR', 'NR', ''), 1, 0)) AS UNSIGNED INT) AS numAverageCr,
            CAST(SUM(IF(regionalSingleRecord = 'NR', 1, 0)) AS UNSIGNED INT) AS numSingleNr,
            CAST(SUM(IF(regionalAverageRecord = 'NR', 1, 0)) AS UNSIGNED INT) AS numAverageNr,
            CAST(SUM(IF(eventId NOT IN ('333fm', '333mbf', '333mbo'), IF(value1 > 0, value1, 0) + IF(value2 > 0, value2, 0) + IF(value3 > value3, 1, 0) + IF(value4 > 0, value4, 0) + IF(value5 > 0, value5, 0), 0)) AS UNSIGNED INT) AS totTime
FROM        Results
GROUP BY    personId, eventId;

-- TODO (maybe) - calculate totTime for '333mbf', '333mbo'

-- Update statistics
ANALYZE TABLE ResultsRollup;

