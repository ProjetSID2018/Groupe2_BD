#--Groupe 2

#--Création de l'événement pour calculer les tf_idf chaque semaine 

DELIMITER |

CREATE EVENT `e_tf_idf_week` 
ON SCHEDULE EVERY 1 DAY STARTS '2018-01-10 01:00:00' 
ON COMPLETION PRESERVE ENABLE 
DO CALL update_mv_term_frequency_week() |

DELIMITER ;