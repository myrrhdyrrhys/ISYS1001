DROP PROCEDURE IF EXISTS addWeight;
DELIMITER //
CREATE PROCEDURE addWeight()
COMMENT 'Gives each Athlete a weight value between 50.0 and 100.0 kilograms'
BEGIN
    ALTER TABLE Athletes
        ADD athleteWeight DECIMAL(5, 2);
    UPDATE Athletes
        SET athleteWeight = ROUND(RAND()*(50.0)+50.0, 2);
END//
DELIMITER ;