
   DELIMITER |
 
   CREATE TRIGGER TBELONG  BEFORE INSERT
  ON belong FOR EACH ROW

   BEGIN
       
     DECLARE nb1 int ;
       
     DECLARE CLE_ETRANGERE CONDITION FOR SQLSTATE '99990';
    
     Select count(id_label) into nb1
  
     from label L
   
     where New.id_label IN (SELECT id_label from label );
   
     IF (nb1= 0 )  THEN
       
       SIGNAL CLE_ETRANGERE SET MESSAGE_TEXT = 'foreign key does not exist';

     END IF;
 
   END |
 
   DELIMITER ;
