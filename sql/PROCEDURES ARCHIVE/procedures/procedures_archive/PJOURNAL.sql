DROP PROCEDURE IF EXISTS PNEWSPAPER;
DELIMITER |
CREATE PROCEDURE PJOURNAL (IN VNOM_JOURNAL VARCHAR(50),IN VLIEN_JOURNAL VARCHAR(2083),IN VLIEN_LOGO VARCHAR(2083))
BEGIN
     INSERT INTO NEWSPAPER VALUES (NULL,VNOM_JOURNAL,VLIEN_JOURNAL,VLIEN_LOGO);
END|

DELIMITER ;
CALL PJOURNAL("LIBERATION","HTTP liberation","http image");

