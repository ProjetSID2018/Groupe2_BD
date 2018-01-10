  DELIMITER |
  CREATE TRIGGER TWORD BEFORE INSERT
  ON WORD FOR EACH ROW
  BEGIN
       DECLARE nb1 int ;
       DECLARE CLE_ETRANGERE CONDITION FOR SQLSTATE '99990';
       DECLARE CAPACITY_ERROR CONDITION FOR SQLSTATE '99991';
       SIGNAL CLE_ETRANGERE SET MESSAGE_TEXT = 'The foreign key does not exist';  
       SIGNAL CAPACITY_ERROR SET MESSAGE_TEXT = 'The key cannot be empty';
       IF (id_word is NULL) THEN
		SIGNAL CAPACITY_ERROR;
	   END IF;

       Select count(W.id_lemma) into nb1
    from WORD W ,LEMMA L
    where W.id_lemma= L.id_lemma ;
    IF (nb1= 0 )  THEN
        SIGNAL CLE_ETRANGERE ;
    END IF;
  END |
  DELIMITER ;
