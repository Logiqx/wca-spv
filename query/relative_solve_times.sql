-- 4x4x4 VS 3x3x3 (World) - Approach 1 uses the SPV
SELECT      CEIL(worldCentileAverage444 / 5.0) * 5 AS vigintile, COUNT(*) AS numPersons,
            TRUNCATE(AVG(bestAverage444) / 100.0, 2) AS avg444,
            TRUNCATE(AVG(bestAverage333) / 100.0, 2) AS avg333,
            TRUNCATE(AVG(bestAverage444 / bestAverage333), 2) AS factor
FROM        PersonsView
WHERE       worldCentileAverage444 > 0
AND         worldCentileAverage333 > 0
GROUP BY    vigintile;

SELECT      TRUNCATE(AVG(bestAverage444 / bestAverage333), 2) AS mean
FROM        PersonsView
WHERE       worldCentileAverage444 > 0
AND         worldCentileAverage333 > 0;

SELECT      TRUNCATE(AVG(bestAverage444 / bestAverage333), 2) AS iqm
FROM        PersonsView
WHERE       worldCentileAverage444 > 25
AND         worldCentileAverage444 < 76
AND         worldCentileAverage333 > 0;

-- 4x4x4 VS 3x3x3 (World) - Approach 2 uses the ranks pivot table
SELECT      CEIL(worldCentile444 / 5.0) * 5 AS vigintile, COUNT(*) AS numPersons,
            TRUNCATE(AVG(best444) / 100.0, 2) AS avg444,
            TRUNCATE(AVG(best333) / 100.0, 2) AS avg333,
            TRUNCATE(AVG(best444 / best333), 2) AS factor
FROM        RanksAveragePivot
WHERE       worldCentile444 > 0
AND         worldCentile333 > 0
GROUP BY    vigintile;

SELECT      TRUNCATE(AVG(best444 / best333), 2) AS mean
FROM        RanksAveragePivot
WHERE       worldCentile444 > 0
AND         worldCentile333 > 0;

SELECT      TRUNCATE(AVG(best444 / best333), 2) AS iqm
FROM        RanksAveragePivot
WHERE       worldCentile444 > 25
AND         worldCentile444 < 76
AND         worldCentile333 > 0;

-- 4x4x4 VS 3x3x3 (UK) - Approach 1 uses the SPV
SELECT      CEIL(countryCentileAverage444 / 5.0) * 5 AS vigintile, COUNT(*) AS numPersons,
            TRUNCATE(AVG(bestAverage444) / 100.0, 2) AS avg444,
            TRUNCATE(AVG(bestAverage333) / 100.0, 2) AS avg333,
            TRUNCATE(AVG(bestAverage444 / bestAverage333), 2) AS factor
FROM        PersonsView
WHERE       countryName = 'United Kingdom'
AND         countryCentileAverage444 > 0
AND         countryCentileAverage333 > 0
GROUP BY    vigintile;

SELECT      TRUNCATE(AVG(bestAverage444 / bestAverage333), 2) AS mean
FROM        PersonsView
WHERE       countryName = 'United Kingdom'
AND         worldCentileAverage444 > 0
AND         worldCentileAverage333 > 0;

SELECT      TRUNCATE(AVG(bestAverage444 / bestAverage333), 2) AS iqm
FROM        PersonsView
WHERE       countryName = 'United Kingdom'
AND         worldCentileAverage444 > 25
AND         worldCentileAverage444 < 76
AND         worldCentileAverage333 > 0;

-- 4x4x4 VS 3x3x3 (UK) - Approach 2 uses the ranks pivot tabl, joined back to the persons table
SELECT      CEIL(countryCentile444 / 5.0) * 5 AS vigintile, COUNT(*) AS numPersons,
            TRUNCATE(AVG(best444) / 100.0, 2) AS avg444,
            TRUNCATE(AVG(best333) / 100.0, 2) AS avg333,
            TRUNCATE(AVG(best444 / best333), 2) AS factor
FROM        RanksAveragePivot r
JOIN        PersonsExtra p ON p.id = r.personId
WHERE       countryName = 'United Kingdom'
AND         worldCentile444 > 0
AND         worldCentile333 > 0
GROUP BY    vigintile;

SELECT      TRUNCATE(AVG(best444 / best333), 2) AS mean
FROM        RanksAveragePivot r
JOIN        PersonsExtra p ON p.id = r.personId
WHERE       countryName = 'United Kingdom'
AND         worldCentile444 > 0
AND         worldCentile333 > 0;

SELECT      TRUNCATE(AVG(best444 / best333), 2) AS iqm
FROM        RanksAveragePivot r
JOIN        PersonsExtra p ON p.id = r.personId
WHERE       countryName = 'United Kingdom'
AND         worldCentile444 > 25
AND         worldCentile444 < 76
AND         worldCentile333 > 0;
