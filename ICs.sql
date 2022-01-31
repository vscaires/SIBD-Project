DROP FUNCTION IF EXISTS chk_date_intersect_proc() CASCADE;
DROP FUNCTION IF EXISTS ic3_prod() CASCADE;
DROP TRIGGER IF EXISTS wrong_location ON location;

CREATE OR REPLACE FUNCTION chk_date_intersect_proc()
RETURNS TRIGGER AS
$$
BEGIN
    IF EXISTS(
    SELECT * FROM reservation
    WHERE (start_date < NEW.start_date AND end_date > NEW.start_date)
        OR (start_date < NEW.end_date AND end_date > NEW.end_date)
        OR (start_date >= NEW.start_date AND end_date < NEW.end_date)
        OR (start_date > NEW.start_date AND end_date <= NEW.end_date))
    THEN
    RAISE EXCEPTION 'Date overlaps with existing one';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER chk_date_intersect
BEFORE UPDATE OR INSERT ON reservation
FOR EACH ROW EXECUTE PROCEDURE chk_date_intersect_proc();

CREATE OR REPLACE FUNCTION	verify_location()
RETURNS TRIGGER AS
$$
BEGIN

    IF ((NEW.latitude IN (SELECT latitude FROM location)
        AND NEW.longitude IN (SELECT longitude FROM location))
        AND NOT((NEW.latitude IN (SELECT latitude FROM wharf) AND NEW.longitude IN (SELECT longitude FROM wharf))
        OR (NEW.latitude IN (SELECT latitude FROM marina) AND NEW.longitude IN (SELECT longitude FROM marina))
        OR (NEW.latitude IN (SELECT latitude FROM port) AND NEW.longitude IN (SELECT longitude FROM port))))
       THEN
        RAISE EXCEPTION 'Location % not in port marina or wharf',NEW.name;
    END IF;
    IF ((NEW.latitude IN (SELECT latitude FROM location)
        AND NEW.longitude IN (SELECT longitude FROM location))
        AND ((NEW.latitude IN (SELECT latitude FROM marina) AND NEW.latitude IN (SELECT latitude FROM port) AND (NEW.longitude IN (SELECT longitude FROM marina) AND NEW.longitude IN (SELECT longitude FROM port)))
            OR (NEW.latitude IN (SELECT latitude FROM marina) AND NEW.latitude IN (SELECT latitude FROM wharf) AND (NEW.longitude IN (SELECT longitude FROM marina) AND NEW.longitude IN (SELECT longitude FROM marina)))
            OR ((NEW.latitude IN (SELECT latitude FROM port) AND NEW.latitude IN (SELECT latitude FROM wharf) AND (NEW.longitude IN (SELECT longitude FROM port) AND NEW.longitude IN (SELECT longitude FROM marina))))))
       THEN
        RAISE EXCEPTION 'Location % repeated in port marina or wharf',NEW.name;
    END IF;
    RETURN NEW;
END

$$	LANGUAGE	plpgsql;

CREATE CONSTRAINT TRIGGER wrong_location
AFTER UPDATE or INSERT ON location DEFERRABLE
FOR EACH ROW EXECUTE PROCEDURE verify_location();

CREATE OR REPLACE FUNCTION ic3_prod ()
RETURNS TRIGGER AS
$$
    BEGIN
        IF NEW.iso_code NOT IN (SELECT iso_code FROM location) THEN
            RAISE EXCEPTION 'The country of registry has no locations associated to it';
        END IF;
        RETURN NEW;
    END;
$$  LANGUAGE plpgsql;


CREATE TRIGGER  ic3
BEFORE UPDATE OR INSERT ON boat
FOR EACH ROW EXECUTE PROCEDURE ic3_prod();