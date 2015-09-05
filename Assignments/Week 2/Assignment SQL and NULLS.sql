-- 1) How many airplanes have listed speeds? 
--    23 airplanes have listed speeds.
SELECT COUNT(*)
FROM planes
WHERE speed IS NOT NULL;

-- 1) What is the minimum listed speed and the maximum listed speed
--    The minimum listed speed is 90 while the maxium listed speed is 432.
SELECT MAX(speed)
FROM planes
WHERE speed IS NOT NULL;

SELECT MIN(speed)
FROM planes
WHERE speed IS NOT NULL;

-- 2) What is the total distance flown by all of the planes in January 2013?
-- 	  The total distance flown by all of the planes in January 2013 is 2718805.

SELECT SUM(distance)
FROM flights
WHERE year = '2013' AND month = '1';

-- 2) What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
--    The total distance flown by all the planes in January 2013 where all the tailnum is missing is 81763
SELECT SUM(distance)
FROM flights
WHERE year = '2013' AND month = '1' AND tailnum IS NULL;


-- 3) What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?
-- The result for the total distance flown by all planes on July 2, 2013, grouped by aircraft manufacturer when quired using the Inner Join 
-- omitted records where the tail numbers were null.On the other hand, the left outer join included the records where the tail numbers were missing
--   Inner join

Select planes.manufacturer, SUM(flights.distance)
FROM flights INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.year = '2013' AND flights.month ='7' and flights.day = '5'
GROUP BY planes.manufacturer;

-- Left outer Join

Select planes.manufacturer, SUM(flights.distance)
FROM flights LEFT OUTER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE flights.year = '2013' AND flights.month ='7' and flights.day = '5'
GROUP BY planes.manufacturer;


--  4) What are the total air time for all planes  on December 25, 2013 grouped by airlne then by aircraft manufacturer?
Select airlines.name, planes.manufacturer, SUM(flights.air_time)
FROM flights LEFT OUTER JOIN planes
ON flights.tailnum = planes.tailnum
LEFT OUTER JOIN airlines 
ON airlines.carrier = flights.carrier
WHERE flights.year = '2013' AND flights.month ='12' and flights.day = '25'
GROUP BY airlines.name,planes.manufacturer;





