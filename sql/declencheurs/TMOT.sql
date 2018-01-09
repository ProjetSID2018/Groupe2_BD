DELIMITER |
CREATE TRIGGER TMOT BEFORE INSERT
ON MOT FOR EACH ROW
BEGIN
    IF id_mot IS  NULL   
      THEN
        SELECT'La clé ne doit pas etre nulle' ;
    END IF;
END |
DELIMITER ;
