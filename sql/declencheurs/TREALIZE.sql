
 
 DELIMITER |

  CREATE TRIGGER TREALIZE BEFORE INSERT
  ON REALIZE FOR EACH ROW

  BEGIN

       DECLARE nb1 int ;

       DECLARE CLE_ETRANGERE CONDITION FOR SQLSTATE '99990';


       Select count(id_author) into nb1

       from REALIZE R,AUTHOR A
    
       where R.id_journal= A.id_author;

       IF (nb1= 0 )  THEN
       
         SIGNAL CLE_ETRANGERE SET MESSAGE_TEXT = 'foreign key does not exist';

       END IF;
 
   END |

  DELIMITER ;
