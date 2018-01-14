DROP PROCEDURE IF EXISTS PPOSITION_WORD;
DELIMITER |
CREATE PROCEDURE UPDATE_POSITION_WORD (IN VID_POSITION INT,IN VPOSITION INT, IN VTITLE BOOLEAN, IN VWORD VARCHAR(50), VTYPE_ENTITY VARCHAR(25), IN VPOS_TAG VARCHAR(25), IN VID_ARTICLE INT,IN VFILE_WIKI VARCHAR(255),IN VSYNONYM VARCHAR(50)) 

BEGIN
	DECLARE VID_WORD INT;
     DECLARE VID_ENTITY INT; 
     DECLARE VID_POS_TAG INT;
     DECLARE VID_WIKI INT;
     DECLARE VID_SYNONYM INT;
	 
     SELECT id_word INTO VID_WORD
     FROM word
     WHERE word = VWORD;
     
     SELECT id_entity INTO VID_ENTITY
     FROM entity
     WHERE type_entity = VTYPE_ENTITY;
     
     SELECT id_pos_tag INTO VID_POS_TAG
     FROM pos_tagging
     WHERE pos_tag = VPOS_TAG;
     
     SELECT id_wiki INTO VID_WIKI
     FROM wiki
     WHERE file_wiki = VFILE_WIKI;
	 
	 SELECT id_synonym INTO VID_SYNONYM
     FROM synonym
     WHERE synonym = VSYNONYM;
	 
	IF (VID_WORD IS NULL)  THEN 
		INSERT INTO word (id_word, word) VALUES (NULL, VWORD);
    	SELECT LAST_INSERT_ID() INTO VID_WORD;
	END IF;

	IF (VID_ENTITY IS NULL)  THEN 
		INSERT INTO entity (id_entity, type_entity) VALUES (NULL, VTYPE_ENTITY);
    	SELECT LAST_INSERT_ID() INTO VID_ENTITY;
	END IF;
	
	IF (VID_POS_TAG IS NULL)  THEN 
		INSERT INTO pos_tagging (id_pos_tag, pos_tag) VALUES (NULL, VPOS_TAG);
    	SELECT LAST_INSERT_ID() INTO VID_POS_TAG;
	END IF;
	
	IF (VID_WIKI IS NULL)  THEN 
		INSERT INTO wiki (id_wiki, file_wiki) VALUES (NULL, VFILE_WIKI);
    	SELECT LAST_INSERT_ID() INTO VID_WIKI;
	END IF;
			
	UPDATE  position_word 
        SET position = VPOSITION ,
             title = VTITLE ,
             id_word = VID_WORD,
             id_entity =VID_ENTITY,
             id_pos_tag = VID_POS_TAG,
             id_article = VID_ARTICLE,
            id_wiki = VID_WIKI
        where id_position = VID_POSITION ;
    
    	IF (VID_SYNONYM IS NULL) THEN 
         CALL PSYNONYM(VSYNONYM,VWORD);
    	 SELECT LAST_INSERT_ID() INTO VID_SYNONYM;
	END IF;
		
END|         
DELIMITER ;
CALL UPDATE_POSITION_WORD(1,17,TRUE,"VB0","PERSONNE1","adjectifA",2,"wikipedia.org","voire");