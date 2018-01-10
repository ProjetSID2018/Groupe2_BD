 -- Triggers articles
 
 DELIMITER |
  CREATE TRIGGER TARTICLE BEFORE INSERT
  ON ARTICLE FOR EACH ROW
BEGIN
       DECLARE compteur int ;
       DECLARE CLE_ETRANGERE CONDITION FOR SQLSTATE '99990';
      
    Select count(N.id_newspaper) into compteur
    from ARTICLE A, NEWSPAPER N
    where A.id_newspaper = N.id_newspaper;
    IF (compteur = 0) THEN
       SIGNAL CLE_ETRANGERE SET MESSAGE_TEXT = 'foreign key does not exist';
    END IF;
  END