DROP PROCEDURE IF EXISTS PPOSITION_WORD;
DELIMITER |
CREATE PROCEDURE PPOSITION_WORD (IN VPOSITION INT, IN VTITLE BOOLEAN, IN VWORD VARCHAR(50), VTYPE_ENTITY VARCHAR(25), IN VPOS_TAG VARCHAR(25), IN VID_ARTICLE INT,IN VFILE_WIKI VARCHAR(255),IN VSYNONYM VARCHAR(50)) 

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
	 
	IF (VID_WORD IS NULL AND VID_WORD IS NOT NULL)  THEN 
		INSERT INTO word (id_word, word) VALUES (NULL, VWORD);
    	SELECT LAST_INSERT_ID() INTO VID_WORD;
	END IF;

	IF (VID_ENTITY IS NULL AND VID_ENTITY IS NOT NULL)  THEN 
		INSERT INTO entity (id_entity, type_entity) VALUES (NULL, VTYPE_ENTITY);
    	SELECT LAST_INSERT_ID() INTO VID_ENTITY;
	END IF;
	
	IF (VID_POS_TAG IS NULL AND VID_POS_TAG IS NOT NULL)  THEN 
		INSERT INTO pos_tagging (id_pos_tag, pos_tag) VALUES (NULL, VPOS_TAG);
    	SELECT LAST_INSERT_ID() INTO VID_POS_TAG;
	END IF;
	
	IF (VID_WIKI IS NULL AND VID_WIKI IS NOT NULL)  THEN 
		INSERT INTO wiki (id_wiki, file_wiki) VALUES (NULL, VFILE_WIKI);
    	SELECT LAST_INSERT_ID() INTO VID_WIKI;
	END IF;
			
	INSERT INTO position_word (id_position, position,title,id_word,id_entity,id_pos_tag,id_article,id_wiki) 
    VALUES (NULL, VPOSITION,VTITLE,VID_WORD,VID_ENTITY,VID_POS_TAG,VID_ARTICLE,VID_WIKI);
    
    	IF (VID_SYNONYM IS NULL AND VID_SYNONYM IS NOT NULL) THEN 
         CALL PSYNONYM(VSYNONYM,VWORD);
    	 SELECT LAST_INSERT_ID() INTO VID_SYNONYM;
	END IF;
		
END|         
DELIMITER ;
CALL PPOSITION_WORD(18,TRUE,"VBA","PERSONNE","adjectif",1,"wikipedia.org","voit");