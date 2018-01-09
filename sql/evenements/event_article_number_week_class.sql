-- GROUPE 2

-- Nécessaire pour le lancement des evenements
SET GLOBAL event_scheduler = ON;

DELIMITER |
--
-- Événements
-- Evenement qui déclenche la procédure de mise à jour du nombre d'article de la semaine et par theme
--
CREATE EVENT `e_article_number_week_class` 
	ON SCHEDULE EVERY 1 WEEK STARTS '2018-01-08 04:00:00' 
	ON COMPLETION PRESERVE ENABLE 
	DO CALL update_mv_number_article_week_class();
	|
DELIMITER ;