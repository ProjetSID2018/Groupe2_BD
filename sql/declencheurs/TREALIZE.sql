
 
 DELIMITER |
  CREATE TRIGGER TREALIZE BEFORE INSERT
  ON REALIZE FOR EACH ROW
  BEGIN
       DECLARE nb1 int ;
       DECLARE CLE_ETRANGERE CONDITION FOR SQLSTATE '99990';
       DECLARE CAPACITY_ERROR CONDITION FOR SQLSTATE '99991';  
       SIGNAL CLE_ETRANGERE SET MESSAGE_TEXT = 'foreign key does not exist';
       SIGNAL CAPACITY_ERROR SET MESSAGE_TEXT = 'the key cannot be empty';
       IF (id_article is NULL) THEN
		SIGNAL CAPACITY_ERROR;
	   END IF;

       Select count(id_author) into nb1
    from REALIZE R,AUTHOR A
    where R.id_journal= A.id_author;
    IF (nb1= 0 )  THEN
        SIGNAL CLE_ETRANGERE ;
    END IF;
  END |
  DELIMITER ;
