DELIMITER /
DROP PROCEDURE IF EXISTS SEMANTIC_PSYNONYM/

CREATE PROCEDURE SEMANTIC_PSYNONYM (IN v_id_article INT, IN v_position INT,v_synonym VARCHAR(25))
	BEGIN

		DECLARE v_id_synonym INT;
		
		SELECT s.id_synonym INTO v_id_synonym
		FROM synonym s
		WHERE s.synonym = v_synonym;

		IF (vid_synonym IS NULL AND v_synonym is not NULL)  THEN
			INSERT INTO synonym (id_synonym, v_synonym) VALUES (NULL, v_synonym);
			SELECT LAST_INSERT_ID() INTO vid_synonym;
		END IF;
		
		SELECT w.id_word INTO vid_word
		FROM word w
		WHERE w.word = v_word;

		IF (vid_word IS NOT NULL) THEN 
			INSERT INTO common(id_synonym, id_word) VALUES (v_synonym,v_word);
		ELSE 
			SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'The word is missing in the database';
		END IF;
		
		COMMIT;
	END/