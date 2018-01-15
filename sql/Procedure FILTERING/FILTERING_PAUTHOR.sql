DELIMITER /
DROP PROCEDURE IF EXISTS FILTERING_PAUTHOR/

CREATE PROCEDURE FILTERING_PAUTHOR (IN v_id_article INT, IN v_surname_author VARCHAR(50), IN v_firstname_author VARCHAR(50))
	BEGIN
		DECLARE v_id_author INT;

		SELECT a.id_author INTO v_id_author
		FROM author a
		WHERE a.surname_author = v_surname_author
		AND a.firstname_author = v_firstname_author;

		IF (v_id_author IS NULL AND v_surname_author IS NOT NULL AND v_firstname_author IS NOT NULL)  THEN
			INSERT INTO author (id_author, surname_author, firstname_author) VALUES (NULL, v_surname_author,v_firstname_author);
			SELECT LAST_INSERT_ID() INTO v_id_author;
		END IF;

		INSERT INTO realize(id_author, id_article) VALUES(v_id_author, v_id_article);

		COMMIT;
	END/