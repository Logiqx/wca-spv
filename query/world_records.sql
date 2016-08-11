-- Countries with the most world records
SELECT      continentName, countryName, COUNT(id) AS numPersons, SUM(numSingleWr) AS numSingleWr, SUM(numAverageWr) AS numAverageWr
FROM        PersonsView
GROUP BY    continentName, countryName
HAVING      numSingleWr + numAverageWr > 0
ORDER BY    numAverageWr DESC, numSingleWr DESC
LIMIT       10;

-- Competitors with the most world records
SELECT      continentName, countryName, name, numComp, numPodium, numSingleWr, numAverageWr
FROM        PersonsView
WHERE       numSingleWr + numAverageWr > 0
ORDER BY    numAverageWr DESC, numSingleWr DESC
LIMIT       10;
