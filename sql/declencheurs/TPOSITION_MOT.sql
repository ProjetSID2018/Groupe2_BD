DELIMITER |
CREATE TRIGGER TPOSITION_MOT BEFORE INSERT
ON POSITION_MOT FOR EACH ROW
BEGIN
    DECLARE nb1 int;
    DECLARE nb2 int;
    DECLARE nb3 int;
    DECLARE nb4 int;
    DECLARE nb5 int;
    DECLARE nb6 int;
    DECLARE CAPACITY_ERROR CONDITION FOR SQLSTATE '99991';  
    DECLARE CLE_ETRANGERE1 CONDITION FOR SQLSTATE '99990';
    DECLARE CLE_ETRANGERE2 CONDITION FOR SQLSTATE '99992';
    DECLARE CLE_ETRANGERE3 CONDITION FOR SQLSTATE '99993';
    DECLARE CLE_ETRANGERE4 CONDITION FOR SQLSTATE '99994';
    DECLARE CLE_ETRANGERE5 CONDITION FOR SQLSTATE '99995';
    DECLARE CLE_ETRANGERE6 CONDITION FOR SQLSTATE '99996';
    SIGNAL CLE_ETRANGERE1 SET MESSAGE_TEXT = 'la cle etrangere liée au mot nexiste pas';
    SIGNAL CLE_ETRANGERE2 SET MESSAGE_TEXT = 'la cle etrangere liée a lentité nexiste pas';
    SIGNAL CLE_ETRANGERE3 SET MESSAGE_TEXT = 'la cle etrangere liée a pos_tagging nexiste pas';
    SIGNAL CLE_ETRANGERE4 SET MESSAGE_TEXT = 'la cle etrangere liée a larticle nexiste pas';
    SIGNAL CLE_ETRANGERE5 SET MESSAGE_TEXT = 'la cle etrangere liée au synonyme nexiste pas';
    SIGNAL CLE_ETRANGERE6 SET MESSAGE_TEXT = 'la cle etrangere liée a wiki nexiste pas';
    SIGNAL CAPACITY_ERROR SET MESSAGE_TEXT = 'la clé ne peut pas etre nulle';
    IF (id_position IS  NULL) THEN  
      SIGNAL CAPACITY_ERROR ;
    END IF;

    Select count(*) into nb1
    from POSITION_MOT M ,MOT M1
    where M.id_mot= M1.id_mot ;
    IF (nb1== 0)  THEN
        SIGNAL CLE_ETRANGERE1 ;
    END IF;

    Select count(*) into nb2
    from POSITION_MOT M ,entite M1
    where M.id_entite= M1.id_entite ;
    IF (nb2== 0 )  THEN
        SIGNAL CLE_ETRANGERE2 ;
    END IF;

    Select count(*) into nb3
    from POSITION_MOT M ,POS_TAGGING M1
    where M.id_pos_tag= M1.id_pos_tag ;
    IF (nb3== 0) THEN
        SIGNAL CLE_ETRANGERE3 ;
    END IF;

    Select count(*) into nb4
    from POSITION_MOT M ,article M1
    where M.id_article= M1.id_article ;
    IF (nb4== 0) THEN
        SIGNAL CLE_ETRANGERE4 ;
    END IF;
    
    Select count(*) into nb5
    from POSITION_MOT M ,SYNONYME M1
    where M.id_synonyme= M1.id_synonyme ;
    IF (nb5== 0) THEN
        SIGNAL CLE_ETRANGERE5 ;
    END IF;

    Select count(*) into nb6
    from POSITION_MOT M ,wikiM1
    where M.id_wiki= M1.id_wiki ;
    IF (nb6== 0) THEN
        SIGNAL CLE_ETRANGERE6 ;
    END IF;
END |
DELIMITER ;
