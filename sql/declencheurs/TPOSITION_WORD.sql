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
    SELECT count(PW.id_position) INTO counter1
    FROM position_word PW, word W
    WHERE PW.id_position = W.id_position;
    IF (nb1 = 0) THEN
        SIGNAL CLE_ETRANGERE1 SET MESSAGE_TEXT = "Foreign key of Word doesn't exist";
    END IF;

    SELECT count(PW.id_entity) INTO counter2
    FROM position_word PW, entity E
    WHERE PW.id_entity = E.id_entity;
    IF (nb2 = 0 ) THEN
        SIGNAL CLE_ETRANGERE2 SET MESSAGE_TEXT = "Foreign key of Entity doesn't exist";
    END IF;

    SELECT count(PW.id_post_tag) INTO counter3
    FROM position_word PW ,POS_TAGGING PT
    WHERE PW.id_pos_tag = PT.id_pos_tag;
    IF (nb3 = 0) THEN
        SIGNAL CLE_ETRANGERE3 SET MESSAGE_TEXT = "Foreign key of POS_TAGGING doesn't exist";
    END IF;

    SELECT count(PW.id_article) INTO counter4
    FROM position_word PW, article A
    WHERE PW.id_article = A.id_article;
    IF (nb4 = 0) THEN
        SIGNAL CLE_ETRANGERE4 SET MESSAGE_TEXT = "Foreign key of ARTICLE doesn't exist";
    END IF;
    
    SELECT count(PW.id_synonym) INTO counter5
    FROM position_word PW ,SYNONYM S
    WHERE PW.id_synonym = S.id_synonym;
    IF (nb5 = 0) THEN
        SIGNAL CLE_ETRANGERE5 SET MESSAGE_TEXT = "Foreign key of SYNONYME doesn't exist";
    END IF;

    SELECT count(PW.id_wiki) INTO counter6
    FROM position_word PW ,wiki W
    WHERE PW.id_wiki = W.id_wiki;
    IF (nb6 = 0) THEN
        SIGNAL CLE_ETRANGERE6 SET MESSAGE_TEXT = "Foreign key of WIKI doesn't exist";
    END IF;
END |
DELIMITER ;






