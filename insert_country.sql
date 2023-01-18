DROP PROCEDURE IF EXISTS insertCountry;
DELIMITER //
CREATE PROCEDURE insertCountry(
    inCountryName VARCHAR(35),
    inNumGold INT(2),  
    inNumSilver INT(2),
    inNumBronze INT(2)
)
COMMENT 'Allows for programmatically inserting a new Country to the Countries table, with validation'
BEGIN
    IF inNumGold < 0 THEN 
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The number of Gold medals should not be negative';
        SET inNumGold = 0;
    END IF;
    IF inNumSilver < 0 THEN 
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The number of Silver medals should not be negative';
        SET inNumSilver = 0;
    END IF;
    IF inNumBronze < 0 THEN 
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The number of Bronze medals should not be negative';
        SET inNumBronze = 0;
    END IF;
    INSERT INTO Countries(countryName, numGold, numSilver, numBronze, numMedals, ranking) VALUES(inCountryName, inNumGold, inNumSilver, inNumBronze, (inNumGold + inNumSilver + inNumBronze), NULL);
END//
DELIMITER ;
