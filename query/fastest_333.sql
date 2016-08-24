-- Countries ranked by their fastest 3x3x3 solver
SELECT      continentName, countryName, COUNT(*) AS numPersons,
            TRUNCATE(MIN(bestSingle333) / 100, 2) AS bestSingle333,
            TRUNCATE(MIN(bestAverage333) / 100, 2) AS bestAverage333
FROM        PersonsView
WHERE       bestAverage333 > 0
GROUP BY    continentName, countryName
ORDER BY    bestAverage333 ASC;

-- Countries ranked by their "average" 3x3x3 solver (i.e. ignoring top and bottom 5%)
-- Note: Restricted to countries with 10 or more persons being averaged
SELECT      continentName, countryName, COUNT(*) AS numPersons,
            TRUNCATE(AVG(bestSingle333) / 100, 2) AS averageSingle333,
            TRUNCATE(AVG(bestAverage333) / 100, 2) AS averageAverage333
FROM        PersonsView
WHERE       countryCentileAverage333 BETWEEN 6 AND 95
GROUP BY    continentName, countryName
HAVING      numPersons >= 10
ORDER BY    averageAverage333 ASC;