DROP TRIGGER IF EXISTS afterResultInsert;
DELIMITER //
CREATE TRIGGER afterResultInsert
	AFTER INSERT ON Results
	FOR EACH ROW
BEGIN
    IF NEW.medalType = 'Gold Medal' THEN
        UPDATE Countries
            SET numGold = numGold + 1
            WHERE countryName = NEW.countryName;
    ELSEIF NEW.medalType = 'Silver Medal' THEN
        UPDATE Countries
            SET numSilver = numSilver + 1
            WHERE countryName = NEW.countryName;
    ELSEIF NEW.medalType = 'Bronze Medal' THEN
        UPDATE Countries
            SET numBronze = numBronze + 1
            WHERE countryName = NEW.countryName;
    END IF;
    UPDATE Countries
        SET numMedals = numMedals + 1
        WHERE countryName = NEW.countryName;
END//
DELIMITER ;
