DROP VIEW IF EXISTS trip_info;

CREATE VIEW trip_info
AS
SELECT o.iso_code AS country_iso_origin, o.cname AS country_name_origin, d.iso_code AS country_iso_dest, d.cname AS country_name_dest,
       o.locname AS loc_name_origin, d.locname AS loc_name_dest, o.cni AS cni_boat, bt.iso AS country_iso_boat, bt.name_boat AS country_name_boat,
       o.date AS trip_start_date
FROM (
    SELECT c.iso_code AS iso_code, c.name AS cname, l.name AS locname, t.cni, t.date, t.iso_code_boat, t.id_sailor, t.iso_code_sailor, t.start_date, t.end_date
    FROM trip t JOIN location l ON t.start_latitude = l.latitude AND t.start_longitude = l.longitude
                JOIN country c ON l.iso_code = c.iso_code
    ) o
JOIN (
    SELECT c.iso_code AS iso_code, c.name AS cname, l.name AS locname, t.cni, t.date, t.iso_code_boat, t.id_sailor, t.iso_code_sailor, t.start_date, t.end_date
    FROM trip t JOIN location l ON t.end_latitude = l.latitude AND t.end_longitude = l.longitude
            JOIN country c ON l.iso_code = c.iso_code
    ) d ON o.date = d.date AND o.cni = d.cni AND o.iso_code_boat = d.iso_code_boat AND o.id_sailor = d.id_sailor
    AND o.iso_code_sailor = d.iso_code_sailor AND  o.start_date = d.start_date AND  o.end_date = d.end_date
JOIN (
    SELECT b.iso_code AS iso, b.name AS name_boat, t.cni, t.date, t.iso_code_boat, t.id_sailor, t.iso_code_sailor, t.start_date, t.end_date
    FROM trip t JOIN reservation r ON t.cni = r.cni AND t.iso_code_boat = r.iso_code_boat AND t.id_sailor = r.id_sailor AND t.iso_code_sailor = r.iso_code_sailor AND t.start_date = r.start_date AND t.end_date = r.end_date
                JOIN boat b ON r.iso_code_boat = b.iso_code AND r.cni = b.cni

     ) bt ON o.date = bt.date AND o.cni = bt.cni AND o.iso_code_boat = bt.iso_code_boat AND o.id_sailor = bt.id_sailor
    AND o.iso_code_sailor = bt.iso_code_sailor AND  o.start_date = bt.start_date AND  o.end_date = bt.end_date;
