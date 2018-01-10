
 DELIMITER |
 
 CREATE TRIGGER TBELONG  BEFORE INSERT
  ON BELONG FOR EACH ROW

 BEGIN
       
   DECLARE nb1 int ;
       
   DECLARE CLE_ETRANGERE CONDITION FOR SQLSTATE '99990';
    
   Select count(id_label) into nb1
  
   from LABEL L
   
   where New.id_label IN (SELECT id_label from LABEL );
   
   IF (nb1= 0 )  THEN
       
     SIGNAL CLE_ETRANGERE SET MESSAGE_TEXT = 'foreign key does not exist';

   END IF;
 
 END |
 
 DELIMITER ;
