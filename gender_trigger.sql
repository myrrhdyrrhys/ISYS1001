DROP TRIGGER IF EXISTS afterAthleteDelete;
DELIMITER //
CREATE TRIGGER afterAthleteDelete
	AFTER DELETE ON Athletes
	FOR EACH ROW
BEGIN
    IF OLD.gender = 'Male' THEN 
        UPDATE Disciplines
            SET maleParticipants = maleParticipants - 1
            WHERE disciplineName = OLD.disciplineName;
    ELSEIF OLD.gender = 'Female' THEN
        UPDATE Disciplines
            SET femaleParticipants = femaleParticipants - 1
            WHERE disciplineName = OLD.disciplineName;
    END IF; 
    UPDATE Disciplines 
	SET totalParticipants = totalParticipants - 1 
	WHERE disciplineName = OLD.disciplineName;
END//
DELIMITER ;
