DROP PROCEDURE IF EXISTS PSYNONYME;
DELIMITER |
CREATE PROCEDURE PSYNONYME (IN VSYNONYME VARCHAR(50))   
BEGIN
     INSERT INTO SYNONYME VALUES (NULL,VSYNONYME);
END|         

DELIMITER ;
CALL PSYNONYME("TRUMP");
CALL PSYNONYME("MACRON");
