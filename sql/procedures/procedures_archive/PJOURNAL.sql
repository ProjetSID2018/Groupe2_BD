DROP PROCEDURE IF EXISTS PJOURNAL;
DELIMITER |
CREATE PROCEDURE PJOURNAL (IN VJOURNAL VARCHAR(50))
BEGIN
     INSERT INTO JOURNAL VALUES (NULL,VJOURNAL);
END|

DELIMITER ;
CALL PJOURNAL("LIBERATION");
CALL PJOURNAL("FIGARO");