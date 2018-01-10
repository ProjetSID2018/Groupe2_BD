
 DELIMITER |
 
 CREATE TRIGGER TBELONG  BEFORE INSERT
  ON BELONG FOR EACH ROW

 BEGIN
       
   DECLARE nb1 int ;
       
   DECLARE CLE_ETRANGERE CONDITION FOR SQLSTATE '99990';
    
   Select count(id_label) into nb1
  
   from BELONG B,LABEL L
   
   where B.id_label= L.id_label;
   
   IF (nb1= 0 )  THEN
       
     SIGNAL CLE_ETRANGERE SET MESSAGE_TEXT = 'foreign key does not exist';

   END IF;
 
 END |
 
 DELIMITER ;
