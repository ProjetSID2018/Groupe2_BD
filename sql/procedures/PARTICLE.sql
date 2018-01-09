DROP PROCEDURE IF EXISTS PARTICLE;
DELIMITER |
CREATE PROCEDURE PARTICLE (IN VDATE_PUBLICATION DATE, IN VRATE_POSITIVITY FLOAT, IN VRATE_NEGATIVITY FLOAT,
    IN VRATE_JOY FLOAT, IN VRATE_FEAR FLOAT, IN VRATE_SADNESS FLOAT, IN VRATE_ANGRY FLOAT,
    IN VRATE_SURPRISE FLOAT, IN VRATE_DISGUST FLOAT, IN VID_NEWSPAPER INT, OUT VID_ARTICLE INT)

BEGIN

    INSERT INTO ARTICLE (id_article, date_publication, rate_positivity, rate_negativity, rate_joy, rate_fear, rate_sadness, rate_angry, rate_surprise, rate_disgust, id_newspaper) 
	VALUES (NULL,VDATE_PUBLICATION,VRATE_POSITIVITY,VRATE_NEGATIVITY,VRATE_JOY,VRATE_FEAR,
     VRATE_SADNESS,VRATE_ANGRY,VRATE_SURPRISE,VRATE_DISGUST,VID_NEWSPAPER);
    SELECT LAST_INSERT_ID() INTO VID_ARTICLE;

END|         

DELIMITER ;
CALL PARTICLE("2017-12-31",0.10,0.11,0.12,0.13,0.14,0.15,0.16,0.17,1,@VID_ARTICLE);
SELECT @VID_ARTICLE;