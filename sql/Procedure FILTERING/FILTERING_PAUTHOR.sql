DELIMITER /
DROP PROCEDURE IF EXISTS FILTERING_PAUTHOR/

CREATE PROCEDURE FILTERING_PAUTHOR (IN vid_article INT, IN v_surname_author VARCHAR(50), IN v_firstname_author VARCHAR(50))
	BEGIN

		DECLARE count_id_ INT DEFAULT 0;
		DECLARE vid_author INT DEFAULT 0;

		DECLARE CONTINUE HANDLER FOR NOT FOUND SET vid_author = NULL;

		SELECT a.id_author INTO vid_author
		FROM author a
		WHERE a.surname_author = v_surname_author;

		IF (vid_author IS NULL)  THEN
			INSERT INTO author (id_author, surname_author, firstname_author) VALUES (NULL, v_surname_author,v_firstname_author);
			SELECT LAST_INSERT_ID() INTO vid_author;
		END IF;

		INSERT INTO realize(id_author, id_article) VALUES(vid_author ,vid_article);

		COMMIT;
	END/