DELIMITER |
CREATE TRIGGER TREALIZE BEFORE INSERT
ON realize FOR EACH ROW

BEGIN

   DECLARE compteur1 int;
   DECLARE CLE_ETRANGERE CONDITION FOR SQLSTATE '99990';


   SELECT COUNT(A.id_author) INTO compteur1
   FROM author A
   WHERE NEW.id_author IN (SELECT id_author FROM author);
   
   IF (compteur1=0)  THEN
   
	 SIGNAL CLE_ETRANGERE SET MESSAGE_TEXT = "AUTHOR's foreign key does not exist";

   END IF;

END |
DELIMITER ;