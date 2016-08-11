-- Countries ranked by their fastest 3x3 solver
SELECT      continentName, countryName, COUNT(*) AS numPersons,
            TRUNCATE(MIN(bestSingle333) / 100, 2) AS bestSingle333, TRUNCATE(MIN(bestAverage333) / 100, 2) AS bestAverage333
FROM        PersonsView
WHERE       bestAverage333 > 0
GROUP BY    continentName, countryName
ORDER BY    bestAverage333 ASC;

-- Countries ranked by their median 3x3 solver, restricted to countries with 10 or more persons
SELECT      p.continentName, c.countryName, c.maxRank AS numPersons,
            TRUNCATE(AVG(bestSingle333) / 100, 2) AS medianSingle333, TRUNCATE(AVG(bestAverage333) / 100, 2) AS medianAverage333
FROM        PersonsView p
JOIN        RanksAverageCountryRollup c ON c.eventId = '333' AND c.countryName = p.countryName
WHERE       countryCentileAverage333 = 50
AND         c.maxRank > 9
GROUP BY    continentName, countryName
ORDER BY    medianAverage333 ASC;
