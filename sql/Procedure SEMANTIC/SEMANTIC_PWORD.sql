DELIMITER /
DROP PROCEDURE IF EXISTS SEMANTIC_PWORD/

CREATE PROCEDURE SEMANTIC_PWORD(IN v_id_article INT, IN v_position INT, IN v_word VARCHAR(25), IN v_file_wiki VARCHAR(25),IN v_synonym VARCHAR(50))
  BEGIN

    DECLARE v_id_word INT;
    DECLARE v_id_wiki INT;
    DECLARE v_id_synonym INT;
    DECLARE v_position_up INT;


    SELECT id_word INTO v_id_word
    FROM word
    WHERE word = v_word;

    SELECT id_synonym INTO v_id_synonym
    FROM synonym
    WHERE synonym = v_synonym;

    SELECT id_wiki INTO v_id_wiki
    FROM wiki
    WHERE file_wiki = v_file_wiki;

    # If the word doesn't exist, we can't add a synonym
    IF (v_id_word IS NOT NULL AND v_id_synonym IS NULL AND v_synonym IS NOT NULL) THEN
      INSERT INTO synonym(id_synonym,synonym) VALUES(NULL,v_synonym);
      SELECT LAST_INSERT_ID() INTO v_id_synonym;
    END IF ;

    # If the word doesn't exist, we can't add a wiki
    IF (v_id_word IS NOT NULL AND v_id_wiki IS NULL AND v_file_wiki IS NOT NULL) THEN
      INSERT INTO wiki(id_wiki,file_wiki) VALUES(NULL,v_file_wiki);
      SELECT LAST_INSERT_ID() INTO v_id_wiki;
    END IF ;

    # If the word doesn't exist, we get the id_word for the article and the postion choosen
    IF (v_id_word IS NULL) THEN
      SELECT W.id_word  INTO v_id_word FROM position_word PW,word W
      WHERE PW.id_word = W.id_word AND PW.id_article = v_id_article
            AND PW.position = v_position;
    END IF;

    UPDATE word SET id_synonym = v_id_synonym WHERE id_word = v_id_word;

    SELECT position INTO v_position_up FROM position_word WHERE id_article = v_id_article AND position = v_position;

    IF (v_position_up IS NOT NULL) THEN
      UPDATE position_word
      SET
        id_word = v_id_word,
        id_wiki = v_id_wiki
      WHERE id_article = v_id_article
            AND position = v_position;
    END IF;

    COMMIT;

  END/