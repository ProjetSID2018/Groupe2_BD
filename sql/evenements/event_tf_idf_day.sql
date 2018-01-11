#--Groupe 2

#--Création de l'événement pour calculer les tf_idf chaque jour 

DELIMITER |

CREATE EVENT `e_tf_idf_day` 
ON SCHEDULE EVERY 1 DAY STARTS '2018-01-11 00:30:00' 
ON COMPLETION PRESERVE ENABLE 
DO CALL update_mv_term_frequency_day() |

DELIMITER ;