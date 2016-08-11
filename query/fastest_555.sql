-- Countries ranked by their fastest 555 solver
SELECT      continentName, countryName, COUNT(*) AS numPersons,
            TRUNCATE(MIN(bestSingle555) / 100, 2) AS bestSingle555, TRUNCATE(MIN(bestAverage555) / 100, 2) AS bestAverage555
FROM        PersonsView
WHERE       bestAverage555 > 0
GROUP BY    continentName, countryName
ORDER BY    bestAverage555 ASC;

-- Countries ranked by their median 555 solver, restricted to countries with 10 or more persons
SELECT      p.continentName, c.countryName, c.maxRank AS numPersons,
            TRUNCATE(AVG(bestSingle555) / 100, 2) AS medianSingle555, TRUNCATE(AVG(bestAverage555) / 100, 2) AS medianAverage555
FROM        PersonsView p
JOIN        RanksAverageCountryRollup c ON c.eventId = '555' AND c.countryName = p.countryName
WHERE       countryCentileAverage555 = 50
AND         c.maxRank > 9
GROUP BY    continentName, countryName
ORDER BY    medianAverage555 ASC;
