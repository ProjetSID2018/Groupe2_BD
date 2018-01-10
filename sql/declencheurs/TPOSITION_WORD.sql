  DELIMITER |
  CREATE TRIGGER Tposition_word BEFORE INSERT
  ON position_word FOR EACH ROW
  BEGIN
      DECLARE counter1 INT;
      DECLARE counter2 INT;
      DECLARE counter3 INT;
      DECLARE counter4 INT;
      DECLARE counter5 INT;
      DECLARE counter6 INT;
      DECLARE CLE_ETRANGERE1 CONDITION FOR SQLSTATE '99990';
      DECLARE CLE_ETRANGERE2 CONDITION FOR SQLSTATE '99992';
      DECLARE CLE_ETRANGERE3 CONDITION FOR SQLSTATE '99993';
      DECLARE CLE_ETRANGERE4 CONDITION FOR SQLSTATE '99994';
      DECLARE CLE_ETRANGERE5 CONDITION FOR SQLSTATE '99995';
      DECLARE CLE_ETRANGERE6 CONDITION FOR SQLSTATE '99996';
      SELECT count(W.id_position) INTO counter1
      FROM  word W
      WHERE NEW.id_position IN (SELECT id_position from Word);
      IF (nb1 = 0) THEN
          SIGNAL CLE_ETRANGERE1 SET MESSAGE_TEXT = "Foreign key of Word doesn't exist";
      END IF;

      SELECT count(E.id_entity) INTO counter2
      FROM  entity E
      WHERE NEW.id_entity IN (SELECT id_entity from entity);
      IF (nb2 = 0 ) THEN
          SIGNAL CLE_ETRANGERE2 SET MESSAGE_TEXT = "Foreign key of Entity doesn't exist";
      END IF;

      SELECT count(PT.id_post_tag) INTO counter3
      FROM POS_TAGGING PT
      WHERE NEW.id_pos_tag IN (SELECT id_pos_tag from POS_TAGGING);
      IF (nb3 = 0) THEN
          SIGNAL CLE_ETRANGERE3 SET MESSAGE_TEXT = "Foreign key of POS_TAGGING doesn't exist";
      END IF;

      SELECT count(A.id_article) INTO counter4
      FROM  article A
      WHERE NEW.id_article IN (SELECT id_article from ARTICLE);
      IF (nb4 = 0) THEN
          SIGNAL CLE_ETRANGERE4 SET MESSAGE_TEXT = "Foreign key of ARTICLE doesn't exist";
      END IF;
    
      SELECT count(S.id_synonym) INTO counter5
      FROM SYNONYM S
      WHERE NEW.id_synonym IN (SELECT id_synonym from SYNONYM);
      IF (nb5 = 0) THEN
          SIGNAL CLE_ETRANGERE5 SET MESSAGE_TEXT = "Foreign key of SYNONYME doesn't exist";
      END IF;

      SELECT count(W.id_wiki) INTO counter6
      FROM wiki W
      WHERE NEW.id_wiki IN (SELECT id_wiki from WIKI);
      IF (nb6 = 0) THEN
          SIGNAL CLE_ETRANGERE6 SET MESSAGE_TEXT = "Foreign key of WIKI doesn't exist";
      END IF;
  END |
  DELIMITER ;






