-- Countries ranked by their fastest 444 solver
SELECT      continentName, countryName, COUNT(*) AS numPersons,
            TRUNCATE(MIN(bestSingle444) / 100, 2) AS bestSingle444, TRUNCATE(MIN(bestAverage444) / 100, 2) AS bestAverage444
FROM        PersonsView
WHERE       bestAverage444 > 0
GROUP BY    continentName, countryName
ORDER BY    bestAverage444 ASC;

-- Countries ranked by their median 444 solver, restricted to countries with 10 or more persons
SELECT      p.continentName, c.countryName, c.maxRank AS numPersons,
            TRUNCATE(AVG(bestSingle444) / 100, 2) AS medianSingle444, TRUNCATE(AVG(bestAverage444) / 100, 2) AS medianAverage444
FROM        PersonsView p
JOIN        RanksAverageCountryRollup c ON c.eventId = '444' AND c.countryName = p.countryName
WHERE       countryCentileAverage444 = 50
AND         c.maxRank > 9
GROUP BY    continentName, countryName
ORDER BY    medianAverage444 ASC;
