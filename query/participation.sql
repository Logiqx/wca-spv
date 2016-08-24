-- Top 10 competitors who've competed the most times across all events
-- Note: numHours excludes multi-blind
SELECT      countryName, name, numAttempt, numSuccess, numDns, numDnf,
            TRUNCATE(totTime / 100.0 / 3600, 0) AS numHours
FROM        PersonsView
ORDER BY    numAttempt DESC
LIMIT       10;

-- Top 10 competitors with the highest percentage of DNF for 3x3x3
SELECT      countryName, name, numAttempt333, numDnf333,
            TRUNCATE(100.0 * numDnf333 / numAttempt333, 2) as pctDnf333
FROM        PersonsView
WHERE       numDnf333 >= 10
HAVING      pctDnf333 >= 10
ORDER BY    pctDnf333 DESC
LIMIT       10;
