-- Query 1 --
SELECT max_boat.iso_code_owner,max_boat.max,id_owner
FROM(
    SELECT max_boat_per_country.iso_code_owner,MAX(max_boat_per_country.count)
    FROM (
             SELECT COUNT(*), b.iso_code_owner, b.id_owner
                FROM boat b
             GROUP BY b.id_owner, b.iso_code_owner
        )AS max_boat_per_country
    GROUP BY max_boat_per_country.iso_code_owner) AS max_boat
JOIN
     (SELECT COUNT(*), b.iso_code_owner, b.id_owner
        FROM boat b
     GROUP BY b.id_owner, b.iso_code_owner) AS boats_per_county_per_owner
ON boats_per_county_per_owner.count=max_boat.max and boats_per_county_per_owner.iso_code_owner=max_boat.iso_code_owner
ORDER BY iso_code_owner;

-- Query 2 --
SELECT COUNT(*),boats_distinct_init.id_owner
 FROM (
      SELECT b.id_owner, b.iso_code
      FROM boat b
               LEFT JOIN owner o on b.id_owner = o.id AND b.iso_code_owner = o.iso_code
      GROUP BY b.iso_code, b.id_owner
 ) AS boats_distinct_init
GROUP BY boats_distinct_init.id_owner
HAVING COUNT(*)>=2;

-- Query 3 --
SELECT *
FROM person
WHERE id IN(
    SELECT id_sailor
    FROM trip t
        JOIN(
            SELECT *
            FROM   location
            WHERE  iso_code='PT') l
        ON (end_latitude, end_longitude)=(latitude, longitude)
        GROUP BY id_sailor
        HAVING count(DISTINCT (end_latitude, end_longitude))=(
            SELECT   count((latitude, longitude))
            FROM     location
            GROUP BY iso_code
            HAVING   iso_code='PT'));

-- Query 4 --
CREATE OR REPLACE FUNCTION sailor_max_trips()
RETURNS VARCHAR(20) AS
    $$ DECLARE id VARCHAR(20);
    BEGIN
        SELECT id_sailor INTO id
        FROM trip
        GROUP BY id_sailor
        HAVING COUNT(date)>=ALL(SELECT COUNT(date)
                                FROM trip
                                GROUP BY id_sailor);
        RETURN id;
    END;
$$ language plpgsql;

SELECT name, id_sailor, iso_code_sailor, cni, iso_code_boat, start_date, end_date
FROM reservation r
    JOIN person p ON r.id_sailor=p.id AND r.iso_code_sailor=p.iso_code
WHERE r.id_sailor IN (SELECT * FROM sailor_max_trips());

-- Query 5 --
SELECT p.name AS Sailor_Name, m.durations as Maximum_Duration
FROM (
    SELECT MAX(a.durations) as durations, a.id AS id , a.iso_code AS iso_code
    FROM (
        SELECT SUM(t.duration) AS durations, r.id_sailor AS id , r.iso_code_sailor AS iso_code
        FROM trip t
        NATURAL JOIN reservation r
        GROUP BY (r.start_date, r.end_date, r.cni, r.iso_code_boat, r.id_sailor, r.iso_code_sailor)
         ) a
        GROUP BY (a.id, a.iso_code)
    ) m
    JOIN sailor s ON m.iso_code = s.iso_code AND m.id = s.id
    JOIN person p ON s.iso_code = p.iso_code AND s.id = p.id;