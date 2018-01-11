DELIMITER /
DROP PROCEDURE IF EXISTS pwiki/

CREATE PROCEDURE pwiki (IN vfile_wiki VARCHAR(500), OUT vid_wiki INT)   
BEGIN
     INSERT INTO wiki (id_wiki, file_wiki) VALUES (NULL, vfile_wiki);
     SELECT LAST_INSERT_ID() INTO vid_wiki;
END/

CALL pwiki("wikipedia.org", @vid_wiki)/
SELECT @vid_wiki
