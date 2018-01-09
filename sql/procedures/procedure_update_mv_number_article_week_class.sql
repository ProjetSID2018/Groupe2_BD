-- Groupe 2


DELIMITER |
--
-- Procédures
-- Procédure de calcul du nombre d'articles par semaine et par theme
--
CREATE PROCEDURE `update_mv_number_article_week_class`()
BEGIN
   TRUNCATE mv_number_article_week_class;

   INSERT INTO mv_number_article_week_class
   Select a.id_classe, COUNT(a.id_article) as number_article
    From appartient a, article ar
    Where a.id_article = ar.id_article AND TO_DAYS(Date(Now()))-7 <= TO_DAYS(ar.date_publication) AND TO_DAYS(ar.date_publication) <= TO_DAYS (Date(Now()))
	GROUP BY a.id_classe;
END |

DELIMITER ;