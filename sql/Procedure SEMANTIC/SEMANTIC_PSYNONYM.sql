DELIMITER /
DROP PROCEDURE IF EXISTS SEMANTIC_PSYNONYM/

CREATE PROCEDURE SEMANTIC_PSYNONYM (IN v_word VARCHAR(25), IN v_synonym VARCHAR(25))
	BEGIN

		DECLARE count_id_ INT DEFAULT 0;
		DECLARE vid_synonym INT DEFAULT 0;
		DECLARE vid_word INT DEFAULT 0;

		DECLARE CONTINUE HANDLER FOR NOT FOUND SET vid_synonym = NULL AND vid_word = NULL;
		
		SELECT s.id_synonym INTO vid_synonym
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
			INSERT INTO equivalent(id_synonym, id_word) VALUES (v_synonym,v_word);
		ELSE 
			SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'The word is missing in the database';
		END IF;
		
		COMMIT;
	END/