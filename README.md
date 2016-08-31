# World Cube Association - Single Person View

The project name "wca-spv" is an abbreviation of "World Cube Association - Single Person View".


## Overview

This project started when I wanted to determine the relative solve times for 2x2x2 - 7x7x7. The original thread around this topic can be found on the [Speedsolving.com](https://www.speedsolving.com/forum/threads/relative-solve-times-for-2x2x2-7x7x7.47405/) forum. To determine relative solve times, I needed a simple way to calculate vigintile rankings for the baseline event (i.e. rankings in 5% bands) and some way to correlate times peoples times for different events. Since completing the original investigation the SQL scripts have been tidied up and a few extras have been added to create the WCA SPV.

The WCA SPV is essentially a single table containing one record for each person who has ever competed under the WCA. The results and rankings from the WCA database have been rolled up and pivoted to provide a summarised view for each person. The summary records contain a large number of "facts", summarizing peoples participation and performance in individual events as well as across all events. The main benefits of the summary table are to simplify common analytical queries and assist with queries correlating facts across multiple events. A number of example queries are shown later in this document, demonstrating how the SPV can be utilised.

I've drawn upon my experiences in the workplace where I have been involved in "Single Customer View" projects for a number of UK corporations. The WCA SPV is a lot simpler than a corporate Single Customer View but there are some common principles and themes. Wide tables with lots of columns may seem unusual at first but they can be really useful and effective. The number of people in the WCA is small enough for MySQL to cope with all of the competitors in a single wide table, even on modest hardware. A corporate SCV often contains information about 10's to 100's of millions of people and often requires terrabytes of storage, typically employing alternative database technologies (e.g. column-oriented DBMS). There are far less people in the WCA SPV!

These scripts have been tested on MySql 5.7.12 (OS X) and MySql 5.5.1.9 (Windows 7). The build time is about 45 seconds on my Macbook Pro running MySQL 5.7.12.


## Import the WCA database

If you've never imported the WCA database you can do so with the following command, substituting the database name and username:

```code
mysql --database=MYSQL_DATABASE --user=MYSQL_USERNAME --password --execute="source WCA_export.sql" --default-character-set=utf8
```

Note: The above command will prompt for a password.


## Build the SPV

1. Edit build\_all.bat (Windows) or build\_all.sh (Linux / Mac), setting MYSQL\_DATABASE and MYSQL\_USERNAME to match your database.
2. Run build\_all.bat (Windows) or build\_all.sh (Linux / Mac) and wait for it to run all of the SQL scripts. It'll probably take 45-90 seconds, depending on your hardware and the version of MySQL.


# Example Queries

Note: The output from the example queries below related to the WCA export from 2016-08-17.

## fastest\_333.sql

### Countries ranked by their fastest 3x3x3 solver

```SQL
SELECT      continentName, countryName, COUNT(*) AS numPersons,
            TRUNCATE(MIN(bestSingle333) / 100, 2) AS bestSingle333,
            TRUNCATE(MIN(bestAverage333) / 100, 2) AS bestAverage333
FROM        PersonsView
WHERE       bestAverage333 > 0
GROUP BY    continentName, countryName
ORDER BY    bestAverage333 ASC;
```

continentName | countryName    | numPersons | bestSingle333 | bestAverage333 
------------- | -------------- | ---------: | ------------: | -------------: 
Oceania       | Australia      | 926        | 5.39          | 6.45           
North America | USA            | 10890      | 4.90          | 7.06           
Asia          | Korea          | 954        | 4.94          | 7.06           
Europe        | Poland         | 1817       | 5.81          | 7.13           
Europe        | Netherlands    | 326        | 5.13          | 7.24           
Europe        | United Kingdom | 570        | 5.96          | 7.37           
Europe        | Germany        | 1161       | 5.88          | 7.42           
North America | Canada         | 2069       | 5.72          | 7.47           
Europe        | Spain          | 1148       | 6.55          | 7.56           
Europe        | Russia         | 925        | 6.77          | 7.78           


### Countries ranked by their "average" 3x3x3 solver (i.e. ignoring top and bottom 5%)

Note: Restricted to countries with 10 or more persons being averaged

```SQL
SELECT      continentName, countryName, COUNT(*) AS numPersons,
            TRUNCATE(AVG(bestSingle333) / 100, 2) AS averageSingle333,
            TRUNCATE(AVG(bestAverage333) / 100, 2) AS averageAverage333
FROM        PersonsView
WHERE       countryCentileAverage333 BETWEEN 6 AND 95
GROUP BY    continentName, countryName
HAVING      numPersons >= 10
ORDER BY    averageAverage333 ASC;
```

continentName | countryName    | numPersons | averageSingle333 | averageAverage333 
------------- | -------------- | ---------: | ---------------: | ---------------: 
Asia          | Vietnam        | 452        | 18.82            | 22.34            
Asia          | Taiwan         | 756        | 20.82            | 24.78            
Asia          | Hong Kong      | 171        | 20.62            | 24.95            
Europe        | Lithuania      | 25         | 21.86            | 25.26            
Asia          | Philippines    | 1128       | 21.12            | 25.40            
Asia          | Indonesia      | 1081       | 22.12            | 26.44            
Asia          | Singapore      | 260        | 21.89            | 26.44            
Asia          | Korea          | 859        | 22.31            | 26.62            
Asia          | Thailand       | 301        | 22.52            | 26.91            
Europe        | Czech Republic | 120        | 22.67            | 27.23            


## participation.sql

### Top 10 competitors who've competed the most times across all events

Note: numHours excludes MBLD + FMC

```SQL
SELECT      countryName, name, numAttempt, numSuccess, numDns, numDnf,
            TRUNCATE(totTime / 100.0 / 3600, 0) AS numHours
FROM        PersonsView
ORDER BY    numAttempt DESC
LIMIT       10;
```

countryName | name                 | numAttempt | numSuccess | numDns | numDnf | numHours 
----------- | -------------------- | ---------: | ---------: | -----: | -----: | -------: 
Germany     | Sébastien Auroux     | 12073      | 11499      | 57     | 517    | 128      
France      | François Courtès     | 10798      | 9827       | 55     | 916    | 142      
Hungary     | Bence Barát          | 9184       | 8860       | 37     | 287    | 79       
Germany     | Jan Bentlage         | 8965       | 8501       | 90     | 374    | 93       
Netherlands | Erik Akkersdijk      | 8610       | 7985       | 38     | 587    | 69       
Netherlands | Arnaud van Galen     | 7297       | 6857       | 24     | 416    | 90       
Poland      | Wojciech Szatanowski | 7048       | 6731       | 44     | 273    | 62       
USA         | Tim Reynolds         | 6687       | 6320       | 22     | 345    | 56       
Hungary     | Olivér Perge         | 6246       | 5747       | 23     | 476    | 59       
Hungary     | Dániel Varga         | 6117       | 5917       | 9      | 191    | 61       


### Top 10 competitors with the highest percentage of DNF for 3x3x3

```SQL
SELECT      countryName, name, numAttempt333, numDnf333,
            TRUNCATE(100.0 * numDnf333 / numAttempt333, 2) as pctDnf333
FROM        PersonsView
WHERE       numDnf333 >= 10
HAVING      pctDnf333 >= 10
ORDER BY    pctDnf333 DESC
LIMIT       10;
```

countryName | name                    | numAttempt333 | numDnf333 | pctDnf333 
----------- | ----------------------- | ------------: | --------: | --------: 
Chile       | Sebastián Pino Castillo | 180           | 150       | 83.33     
Australia   | Grace Middleton         | 15            | 10        | 66.66     
China       | Haiyan Zhuang (庄海燕)   | 78            | 49        | 62.82     
Hong Kong   | Wong Yat Loon           | 23            | 11        | 47.82     
France      | Claude Arsicaud         | 70            | 14        | 20.00     
Canada      | Isaiah Stairs           | 50            | 10        | 20.00     
Canada      | Sarah Strong            | 562           | 95        | 16.90     
China       | Yang Guan (关养)         | 78            | 12        | 15.38     
Poland      | Krzysztof Szwarc        | 107           | 13        | 12.14     
Canada      | Thomas Henderson        | 145           | 17        | 11.72     


## relative\_solve\_times.sql

### 4x4x4 VS 3x3x3 (World)

```SQL
SELECT      CEIL(worldCentileAverage444 / 5.0) * 5 AS vigintile, COUNT(*) AS numPersons,
            TRUNCATE(AVG(bestAverage444) / 100.0, 2) AS avg444,
            TRUNCATE(AVG(bestAverage333) / 100.0, 2) AS avg333,
            TRUNCATE(AVG(bestAverage444) / AVG(bestAverage333), 2) AS factor
FROM        PersonsView
WHERE       worldCentileAverage444 > 0
AND         worldCentileAverage333 > 0
GROUP BY    vigintile;
```

vigintile | numPersons | avg444 | avg333 | factor 
--------: | ---------: | -----: | -----: | -----: 
5         | 594        | 39.76  | 10.05  | 3.95   
10        | 592        | 46.87  | 11.56  | 4.05   
15        | 595        | 51.12  | 12.48  | 4.09   
20        | 589        | 54.76  | 13.19  | 4.14   
25        | 592        | 58.24  | 13.85  | 4.20   
30        | 589        | 61.57  | 14.41  | 4.27   
35        | 592        | 65.08  | 14.93  | 4.35   
40        | 592        | 68.64  | 15.67  | 4.38   
45        | 592        | 72.32  | 15.94  | 4.53   
50        | 591        | 76.12  | 16.44  | 4.62   
55        | 587        | 80.09  | 17.22  | 4.64   
60        | 587        | 84.39  | 17.90  | 4.71   
65        | 591        | 89.14  | 18.47  | 4.82   
70        | 585        | 94.80  | 19.20  | 4.93   
75        | 593        | 101.16 | 20.13  | 5.02   
80        | 584        | 108.57 | 21.00  | 5.17   
85        | 587        | 117.90 | 22.22  | 5.30   
90        | 583        | 131.37 | 24.04  | 5.46   
95        | 579        | 153.00 | 26.84  | 5.69   
100       | 559        | 212.63 | 34.69  | 6.12   


## world\_records.sql

### Countries with the most world records

```SQL
SELECT      continentName, countryName, COUNT(*) AS numPersons,
            SUM(numSingleWr) AS numSingleWr, SUM(numAverageWr) AS numAverageWr
FROM        PersonsView
GROUP BY    continentName, countryName
HAVING      numSingleWr + numAverageWr > 0
ORDER BY    numAverageWr DESC, numSingleWr DESC
LIMIT       10;
```

continentName | countryName | numPersons | numSingleWr | numAverageWr 
------------- | ----------- | ---------: | ----------: | -----------: 
North America | USA         | 11624      | 75          | 71           
Oceania       | Australia   | 970        | 41          | 47           
Europe        | Poland      | 1979       | 43          | 46           
Asia          | Japan       | 1123       | 32          | 41           
Asia          | China       | 8048       | 32          | 30           
Europe        | Netherlands | 367        | 32          | 27           
Europe        | Hungary     | 618        | 36          | 21           
Europe        | Germany     | 1225       | 28          | 20           
Europe        | Sweden      | 606        | 18          | 11           
Europe        | France      | 1246       | 10          | 11           


### Competitors with the most world records

```SQL
SELECT      countryName, name, numComp, numPodium, numSingleWr, numAverageWr
FROM        PersonsView
WHERE       numSingleWr + numAverageWr > 0
ORDER BY    numAverageWr DESC, numSingleWr DESC
LIMIT       10;
```

countryName | name                        | numComp | numPodium | numSingleWr | numAverageWr 
----------- | --------------------------- | ------: | --------: | ----------: | -----------: 
Australia   | Feliks Zemdegs              | 441     | 356       | 39          | 46           
Netherlands | Erik Akkersdijk             | 1404    | 827       | 18          | 15           
Poland      | Michał Halczuk              | 621     | 299       | 9           | 11           
Japan       | Shotaro Makisumi (牧角章太郎) | 132     | 56        | 12          | 9            
USA         | Kevin Hays                  | 230     | 107       | 5           | 9            
Hungary     | Mátyás Kuti                 | 130     | 64        | 9           | 8            
USA         | Dan Cohen                   | 659     | 372       | 8           | 8            
Finland     | Anssi Vanhala               | 151     | 121       | 5           | 8            
Japan       | Yohei Oka (岡要平)           | 245     | 111       | 1           | 8            
Belgium     | Lars Vandenbergh            | 956     | 181       | 6           | 7            

