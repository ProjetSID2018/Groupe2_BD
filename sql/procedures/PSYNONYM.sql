DROP PROCEDURE IF EXISTS PSYNONYM;
DELIMITER |
CREATE PROCEDURE PSYNONYM (IN VSYNONYM VARCHAR(50))   
BEGIN
     INSERT INTO SYNONYM VALUES (NULL,VSYNONYM);
END|         

DELIMITER ;
CALL PSYNONYM("TRUMP");
CALL PSYNONYM("MACRON");
