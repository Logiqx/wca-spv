-- Generated using the iPython notebook - 3_x_ranks_pivot.ipynb

-- Drop the existing ranks pivot table
DROP TABLE IF EXISTS RanksAveragePivot;

-- Create the ranks pivot table... one record per person
CREATE TABLE RanksAveragePivot
(
    personId VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
    -- 333
    best333 INT DEFAULT 0 NOT NULL,
    worldRank333 INT DEFAULT 0 NOT NULL,
    continentRank333 INT DEFAULT 0 NOT NULL,
    countryRank333 INT DEFAULT 0 NOT NULL,
    worldCentile333 TINYINT DEFAULT 0 NOT NULL,
    continentCentile333 TINYINT DEFAULT 0 NOT NULL,
    countryCentile333 TINYINT DEFAULT 0 NOT NULL,
    -- 444
    best444 INT DEFAULT 0 NOT NULL,
    worldRank444 INT DEFAULT 0 NOT NULL,
    continentRank444 INT DEFAULT 0 NOT NULL,
    countryRank444 INT DEFAULT 0 NOT NULL,
    worldCentile444 TINYINT DEFAULT 0 NOT NULL,
    continentCentile444 TINYINT DEFAULT 0 NOT NULL,
    countryCentile444 TINYINT DEFAULT 0 NOT NULL,
    -- 555
    best555 INT DEFAULT 0 NOT NULL,
    worldRank555 INT DEFAULT 0 NOT NULL,
    continentRank555 INT DEFAULT 0 NOT NULL,
    countryRank555 INT DEFAULT 0 NOT NULL,
    worldCentile555 TINYINT DEFAULT 0 NOT NULL,
    continentCentile555 TINYINT DEFAULT 0 NOT NULL,
    countryCentile555 TINYINT DEFAULT 0 NOT NULL,
    -- 222
    best222 INT DEFAULT 0 NOT NULL,
    worldRank222 INT DEFAULT 0 NOT NULL,
    continentRank222 INT DEFAULT 0 NOT NULL,
    countryRank222 INT DEFAULT 0 NOT NULL,
    worldCentile222 TINYINT DEFAULT 0 NOT NULL,
    continentCentile222 TINYINT DEFAULT 0 NOT NULL,
    countryCentile222 TINYINT DEFAULT 0 NOT NULL,
    -- 333bf
    best333bf INT DEFAULT 0 NOT NULL,
    worldRank333bf INT DEFAULT 0 NOT NULL,
    continentRank333bf INT DEFAULT 0 NOT NULL,
    countryRank333bf INT DEFAULT 0 NOT NULL,
    worldCentile333bf TINYINT DEFAULT 0 NOT NULL,
    continentCentile333bf TINYINT DEFAULT 0 NOT NULL,
    countryCentile333bf TINYINT DEFAULT 0 NOT NULL,
    -- 333oh
    best333oh INT DEFAULT 0 NOT NULL,
    worldRank333oh INT DEFAULT 0 NOT NULL,
    continentRank333oh INT DEFAULT 0 NOT NULL,
    countryRank333oh INT DEFAULT 0 NOT NULL,
    worldCentile333oh TINYINT DEFAULT 0 NOT NULL,
    continentCentile333oh TINYINT DEFAULT 0 NOT NULL,
    countryCentile333oh TINYINT DEFAULT 0 NOT NULL,
    -- 333fm
    best333fm INT DEFAULT 0 NOT NULL,
    worldRank333fm INT DEFAULT 0 NOT NULL,
    continentRank333fm INT DEFAULT 0 NOT NULL,
    countryRank333fm INT DEFAULT 0 NOT NULL,
    worldCentile333fm TINYINT DEFAULT 0 NOT NULL,
    continentCentile333fm TINYINT DEFAULT 0 NOT NULL,
    countryCentile333fm TINYINT DEFAULT 0 NOT NULL,
    -- 333ft
    best333ft INT DEFAULT 0 NOT NULL,
    worldRank333ft INT DEFAULT 0 NOT NULL,
    continentRank333ft INT DEFAULT 0 NOT NULL,
    countryRank333ft INT DEFAULT 0 NOT NULL,
    worldCentile333ft TINYINT DEFAULT 0 NOT NULL,
    continentCentile333ft TINYINT DEFAULT 0 NOT NULL,
    countryCentile333ft TINYINT DEFAULT 0 NOT NULL,
    -- minx
    bestminx INT DEFAULT 0 NOT NULL,
    worldRankminx INT DEFAULT 0 NOT NULL,
    continentRankminx INT DEFAULT 0 NOT NULL,
    countryRankminx INT DEFAULT 0 NOT NULL,
    worldCentileminx TINYINT DEFAULT 0 NOT NULL,
    continentCentileminx TINYINT DEFAULT 0 NOT NULL,
    countryCentileminx TINYINT DEFAULT 0 NOT NULL,
    -- pyram
    bestpyram INT DEFAULT 0 NOT NULL,
    worldRankpyram INT DEFAULT 0 NOT NULL,
    continentRankpyram INT DEFAULT 0 NOT NULL,
    countryRankpyram INT DEFAULT 0 NOT NULL,
    worldCentilepyram TINYINT DEFAULT 0 NOT NULL,
    continentCentilepyram TINYINT DEFAULT 0 NOT NULL,
    countryCentilepyram TINYINT DEFAULT 0 NOT NULL,
    -- sq1
    bestsq1 INT DEFAULT 0 NOT NULL,
    worldRanksq1 INT DEFAULT 0 NOT NULL,
    continentRanksq1 INT DEFAULT 0 NOT NULL,
    countryRanksq1 INT DEFAULT 0 NOT NULL,
    worldCentilesq1 TINYINT DEFAULT 0 NOT NULL,
    continentCentilesq1 TINYINT DEFAULT 0 NOT NULL,
    countryCentilesq1 TINYINT DEFAULT 0 NOT NULL,
    -- clock
    bestclock INT DEFAULT 0 NOT NULL,
    worldRankclock INT DEFAULT 0 NOT NULL,
    continentRankclock INT DEFAULT 0 NOT NULL,
    countryRankclock INT DEFAULT 0 NOT NULL,
    worldCentileclock TINYINT DEFAULT 0 NOT NULL,
    continentCentileclock TINYINT DEFAULT 0 NOT NULL,
    countryCentileclock TINYINT DEFAULT 0 NOT NULL,
    -- skewb
    bestskewb INT DEFAULT 0 NOT NULL,
    worldRankskewb INT DEFAULT 0 NOT NULL,
    continentRankskewb INT DEFAULT 0 NOT NULL,
    countryRankskewb INT DEFAULT 0 NOT NULL,
    worldCentileskewb TINYINT DEFAULT 0 NOT NULL,
    continentCentileskewb TINYINT DEFAULT 0 NOT NULL,
    countryCentileskewb TINYINT DEFAULT 0 NOT NULL,
    -- 666
    best666 INT DEFAULT 0 NOT NULL,
    worldRank666 INT DEFAULT 0 NOT NULL,
    continentRank666 INT DEFAULT 0 NOT NULL,
    countryRank666 INT DEFAULT 0 NOT NULL,
    worldCentile666 TINYINT DEFAULT 0 NOT NULL,
    continentCentile666 TINYINT DEFAULT 0 NOT NULL,
    countryCentile666 TINYINT DEFAULT 0 NOT NULL,
    -- 777
    best777 INT DEFAULT 0 NOT NULL,
    worldRank777 INT DEFAULT 0 NOT NULL,
    continentRank777 INT DEFAULT 0 NOT NULL,
    countryRank777 INT DEFAULT 0 NOT NULL,
    worldCentile777 TINYINT DEFAULT 0 NOT NULL,
    continentCentile777 TINYINT DEFAULT 0 NOT NULL,
    countryCentile777 TINYINT DEFAULT 0 NOT NULL,
    -- 444bf
    best444bf INT DEFAULT 0 NOT NULL,
    worldRank444bf INT DEFAULT 0 NOT NULL,
    continentRank444bf INT DEFAULT 0 NOT NULL,
    countryRank444bf INT DEFAULT 0 NOT NULL,
    worldCentile444bf TINYINT DEFAULT 0 NOT NULL,
    continentCentile444bf TINYINT DEFAULT 0 NOT NULL,
    countryCentile444bf TINYINT DEFAULT 0 NOT NULL,
    -- 555bf
    best555bf INT DEFAULT 0 NOT NULL,
    worldRank555bf INT DEFAULT 0 NOT NULL,
    continentRank555bf INT DEFAULT 0 NOT NULL,
    countryRank555bf INT DEFAULT 0 NOT NULL,
    worldCentile555bf TINYINT DEFAULT 0 NOT NULL,
    continentCentile555bf TINYINT DEFAULT 0 NOT NULL,
    countryCentile555bf TINYINT DEFAULT 0 NOT NULL,
    -- 333mbf
    best333mbf INT DEFAULT 0 NOT NULL,
    worldRank333mbf INT DEFAULT 0 NOT NULL,
    continentRank333mbf INT DEFAULT 0 NOT NULL,
    countryRank333mbf INT DEFAULT 0 NOT NULL,
    worldCentile333mbf TINYINT DEFAULT 0 NOT NULL,
    continentCentile333mbf TINYINT DEFAULT 0 NOT NULL,
    countryCentile333mbf TINYINT DEFAULT 0 NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Populate the ranks pivot table
INSERT INTO RanksAveragePivot
SELECT      personId,
            -- 333
            CAST(IFNULL(MIN(IF(eventId = '333', best, NULL)), 0) AS UNSIGNED INT) AS best333,
            CAST(IFNULL(MIN(IF(eventId = '333', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank333,
            CAST(IFNULL(MIN(IF(eventId = '333', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank333,
            CAST(IFNULL(MIN(IF(eventId = '333', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank333,
            CAST(IFNULL(MIN(IF(eventId = '333', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile333,
            CAST(IFNULL(MIN(IF(eventId = '333', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile333,
            CAST(IFNULL(MIN(IF(eventId = '333', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile333,
            -- 444
            CAST(IFNULL(MIN(IF(eventId = '444', best, NULL)), 0) AS UNSIGNED INT) AS best444,
            CAST(IFNULL(MIN(IF(eventId = '444', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank444,
            CAST(IFNULL(MIN(IF(eventId = '444', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank444,
            CAST(IFNULL(MIN(IF(eventId = '444', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank444,
            CAST(IFNULL(MIN(IF(eventId = '444', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile444,
            CAST(IFNULL(MIN(IF(eventId = '444', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile444,
            CAST(IFNULL(MIN(IF(eventId = '444', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile444,
            -- 555
            CAST(IFNULL(MIN(IF(eventId = '555', best, NULL)), 0) AS UNSIGNED INT) AS best555,
            CAST(IFNULL(MIN(IF(eventId = '555', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank555,
            CAST(IFNULL(MIN(IF(eventId = '555', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank555,
            CAST(IFNULL(MIN(IF(eventId = '555', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank555,
            CAST(IFNULL(MIN(IF(eventId = '555', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile555,
            CAST(IFNULL(MIN(IF(eventId = '555', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile555,
            CAST(IFNULL(MIN(IF(eventId = '555', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile555,
            -- 222
            CAST(IFNULL(MIN(IF(eventId = '222', best, NULL)), 0) AS UNSIGNED INT) AS best222,
            CAST(IFNULL(MIN(IF(eventId = '222', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank222,
            CAST(IFNULL(MIN(IF(eventId = '222', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank222,
            CAST(IFNULL(MIN(IF(eventId = '222', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank222,
            CAST(IFNULL(MIN(IF(eventId = '222', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile222,
            CAST(IFNULL(MIN(IF(eventId = '222', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile222,
            CAST(IFNULL(MIN(IF(eventId = '222', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile222,
            -- 333bf
            CAST(IFNULL(MIN(IF(eventId = '333bf', best, NULL)), 0) AS UNSIGNED INT) AS best333bf,
            CAST(IFNULL(MIN(IF(eventId = '333bf', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank333bf,
            CAST(IFNULL(MIN(IF(eventId = '333bf', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank333bf,
            CAST(IFNULL(MIN(IF(eventId = '333bf', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank333bf,
            CAST(IFNULL(MIN(IF(eventId = '333bf', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile333bf,
            CAST(IFNULL(MIN(IF(eventId = '333bf', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile333bf,
            CAST(IFNULL(MIN(IF(eventId = '333bf', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile333bf,
            -- 333oh
            CAST(IFNULL(MIN(IF(eventId = '333oh', best, NULL)), 0) AS UNSIGNED INT) AS best333oh,
            CAST(IFNULL(MIN(IF(eventId = '333oh', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank333oh,
            CAST(IFNULL(MIN(IF(eventId = '333oh', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank333oh,
            CAST(IFNULL(MIN(IF(eventId = '333oh', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank333oh,
            CAST(IFNULL(MIN(IF(eventId = '333oh', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile333oh,
            CAST(IFNULL(MIN(IF(eventId = '333oh', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile333oh,
            CAST(IFNULL(MIN(IF(eventId = '333oh', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile333oh,
            -- 333fm
            CAST(IFNULL(MIN(IF(eventId = '333fm', best, NULL)), 0) AS UNSIGNED INT) AS best333fm,
            CAST(IFNULL(MIN(IF(eventId = '333fm', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank333fm,
            CAST(IFNULL(MIN(IF(eventId = '333fm', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank333fm,
            CAST(IFNULL(MIN(IF(eventId = '333fm', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank333fm,
            CAST(IFNULL(MIN(IF(eventId = '333fm', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile333fm,
            CAST(IFNULL(MIN(IF(eventId = '333fm', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile333fm,
            CAST(IFNULL(MIN(IF(eventId = '333fm', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile333fm,
            -- 333ft
            CAST(IFNULL(MIN(IF(eventId = '333ft', best, NULL)), 0) AS UNSIGNED INT) AS best333ft,
            CAST(IFNULL(MIN(IF(eventId = '333ft', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank333ft,
            CAST(IFNULL(MIN(IF(eventId = '333ft', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank333ft,
            CAST(IFNULL(MIN(IF(eventId = '333ft', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank333ft,
            CAST(IFNULL(MIN(IF(eventId = '333ft', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile333ft,
            CAST(IFNULL(MIN(IF(eventId = '333ft', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile333ft,
            CAST(IFNULL(MIN(IF(eventId = '333ft', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile333ft,
            -- minx
            CAST(IFNULL(MIN(IF(eventId = 'minx', best, NULL)), 0) AS UNSIGNED INT) AS bestminx,
            CAST(IFNULL(MIN(IF(eventId = 'minx', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRankminx,
            CAST(IFNULL(MIN(IF(eventId = 'minx', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRankminx,
            CAST(IFNULL(MIN(IF(eventId = 'minx', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRankminx,
            CAST(IFNULL(MIN(IF(eventId = 'minx', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentileminx,
            CAST(IFNULL(MIN(IF(eventId = 'minx', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentileminx,
            CAST(IFNULL(MIN(IF(eventId = 'minx', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentileminx,
            -- pyram
            CAST(IFNULL(MIN(IF(eventId = 'pyram', best, NULL)), 0) AS UNSIGNED INT) AS bestpyram,
            CAST(IFNULL(MIN(IF(eventId = 'pyram', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRankpyram,
            CAST(IFNULL(MIN(IF(eventId = 'pyram', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRankpyram,
            CAST(IFNULL(MIN(IF(eventId = 'pyram', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRankpyram,
            CAST(IFNULL(MIN(IF(eventId = 'pyram', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentilepyram,
            CAST(IFNULL(MIN(IF(eventId = 'pyram', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentilepyram,
            CAST(IFNULL(MIN(IF(eventId = 'pyram', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentilepyram,
            -- sq1
            CAST(IFNULL(MIN(IF(eventId = 'sq1', best, NULL)), 0) AS UNSIGNED INT) AS bestsq1,
            CAST(IFNULL(MIN(IF(eventId = 'sq1', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRanksq1,
            CAST(IFNULL(MIN(IF(eventId = 'sq1', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRanksq1,
            CAST(IFNULL(MIN(IF(eventId = 'sq1', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRanksq1,
            CAST(IFNULL(MIN(IF(eventId = 'sq1', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentilesq1,
            CAST(IFNULL(MIN(IF(eventId = 'sq1', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentilesq1,
            CAST(IFNULL(MIN(IF(eventId = 'sq1', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentilesq1,
            -- clock
            CAST(IFNULL(MIN(IF(eventId = 'clock', best, NULL)), 0) AS UNSIGNED INT) AS bestclock,
            CAST(IFNULL(MIN(IF(eventId = 'clock', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRankclock,
            CAST(IFNULL(MIN(IF(eventId = 'clock', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRankclock,
            CAST(IFNULL(MIN(IF(eventId = 'clock', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRankclock,
            CAST(IFNULL(MIN(IF(eventId = 'clock', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentileclock,
            CAST(IFNULL(MIN(IF(eventId = 'clock', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentileclock,
            CAST(IFNULL(MIN(IF(eventId = 'clock', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentileclock,
            -- skewb
            CAST(IFNULL(MIN(IF(eventId = 'skewb', best, NULL)), 0) AS UNSIGNED INT) AS bestskewb,
            CAST(IFNULL(MIN(IF(eventId = 'skewb', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRankskewb,
            CAST(IFNULL(MIN(IF(eventId = 'skewb', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRankskewb,
            CAST(IFNULL(MIN(IF(eventId = 'skewb', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRankskewb,
            CAST(IFNULL(MIN(IF(eventId = 'skewb', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentileskewb,
            CAST(IFNULL(MIN(IF(eventId = 'skewb', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentileskewb,
            CAST(IFNULL(MIN(IF(eventId = 'skewb', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentileskewb,
            -- 666
            CAST(IFNULL(MIN(IF(eventId = '666', best, NULL)), 0) AS UNSIGNED INT) AS best666,
            CAST(IFNULL(MIN(IF(eventId = '666', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank666,
            CAST(IFNULL(MIN(IF(eventId = '666', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank666,
            CAST(IFNULL(MIN(IF(eventId = '666', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank666,
            CAST(IFNULL(MIN(IF(eventId = '666', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile666,
            CAST(IFNULL(MIN(IF(eventId = '666', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile666,
            CAST(IFNULL(MIN(IF(eventId = '666', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile666,
            -- 777
            CAST(IFNULL(MIN(IF(eventId = '777', best, NULL)), 0) AS UNSIGNED INT) AS best777,
            CAST(IFNULL(MIN(IF(eventId = '777', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank777,
            CAST(IFNULL(MIN(IF(eventId = '777', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank777,
            CAST(IFNULL(MIN(IF(eventId = '777', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank777,
            CAST(IFNULL(MIN(IF(eventId = '777', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile777,
            CAST(IFNULL(MIN(IF(eventId = '777', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile777,
            CAST(IFNULL(MIN(IF(eventId = '777', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile777,
            -- 444bf
            CAST(IFNULL(MIN(IF(eventId = '444bf', best, NULL)), 0) AS UNSIGNED INT) AS best444bf,
            CAST(IFNULL(MIN(IF(eventId = '444bf', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank444bf,
            CAST(IFNULL(MIN(IF(eventId = '444bf', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank444bf,
            CAST(IFNULL(MIN(IF(eventId = '444bf', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank444bf,
            CAST(IFNULL(MIN(IF(eventId = '444bf', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile444bf,
            CAST(IFNULL(MIN(IF(eventId = '444bf', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile444bf,
            CAST(IFNULL(MIN(IF(eventId = '444bf', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile444bf,
            -- 555bf
            CAST(IFNULL(MIN(IF(eventId = '555bf', best, NULL)), 0) AS UNSIGNED INT) AS best555bf,
            CAST(IFNULL(MIN(IF(eventId = '555bf', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank555bf,
            CAST(IFNULL(MIN(IF(eventId = '555bf', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank555bf,
            CAST(IFNULL(MIN(IF(eventId = '555bf', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank555bf,
            CAST(IFNULL(MIN(IF(eventId = '555bf', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile555bf,
            CAST(IFNULL(MIN(IF(eventId = '555bf', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile555bf,
            CAST(IFNULL(MIN(IF(eventId = '555bf', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile555bf,
            -- 333mbf
            CAST(IFNULL(MIN(IF(eventId = '333mbf', best, NULL)), 0) AS UNSIGNED INT) AS best333mbf,
            CAST(IFNULL(MIN(IF(eventId = '333mbf', worldRank, NULL)), 0) AS UNSIGNED INT) AS worldRank333mbf,
            CAST(IFNULL(MIN(IF(eventId = '333mbf', continentRank, NULL)), 0) AS UNSIGNED INT) AS continentRank333mbf,
            CAST(IFNULL(MIN(IF(eventId = '333mbf', countryRank, NULL)), 0) AS UNSIGNED INT) AS countryRank333mbf,
            CAST(IFNULL(MIN(IF(eventId = '333mbf', worldCentile, NULL)), 0) AS UNSIGNED INT) AS worldCentile333mbf,
            CAST(IFNULL(MIN(IF(eventId = '333mbf', continentCentile, NULL)), 0) AS UNSIGNED INT) AS continentCentile333mbf,
            CAST(IFNULL(MIN(IF(eventId = '333mbf', countryCentile, NULL)), 0) AS UNSIGNED INT) AS countryCentile333mbf
FROM        RanksAverageExtra
GROUP BY    personId;

-- Add primary key
ALTER TABLE RanksAveragePivot ADD PRIMARY KEY (personId);

