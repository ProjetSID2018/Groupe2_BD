﻿  DELIMITER |
  CREATE TRIGGER TMOT_RACINE BEFORE INSERT
  ON MOT_RACINE FOR EACH ROW
  BEGIN
       DECLARE CAPACITY_ERROR CONDITION FOR SQLSTATE '99991';  
       SIGNAL CAPACITY_ERROR SET MESSAGE_TEXT = 'la clé ne peut pas etre nulle';
       IF (id_racine is NULL) THEN
		SIGNAL CAPACITY_ERROR;
	   END IF;

  END |
  DELIMITER ;
