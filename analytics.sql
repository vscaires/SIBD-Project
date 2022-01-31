--Data analytics queries
--1. The start date (i.e., per year, per month independently of year, and per exact date)
SELECT EXTRACT(year FROM trip_start_date) AS year, EXTRACT(month FROM trip_start_date) AS month, trip_start_date AS exact_date, COUNT(*)
FROM trip_info
GROUP BY GROUPING SETS(year, month, exact_date);

--2. The location of origin (i.e., per location within countries, per country, and in total)
SELECT loc_name_origin AS location, country_name_origin AS country, COUNT(*)
FROM trip_info
GROUP BY ROLLUP(country, location);