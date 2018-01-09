-- Groupe 2


DELIMITER |
--
-- Procédures
-- Procédure de calcul du nombre d'articles par semaine
--
CREATE PROCEDURE `update_mv_number_article_week`()
BEGIN
   TRUNCATE mv_number_article_week;

   INSERT INTO mv_number_article_week
   Select COUNT(id_article) as number_article
    From article 
    Where TO_DAYS(Date(Now()))-7 <= TO_DAYS(date_publication) AND TO_DAYS(date_publication) <= TO_DAYS (Date(Now()));
END |

DELIMITER ;