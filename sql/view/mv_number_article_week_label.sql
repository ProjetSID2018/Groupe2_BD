#-- Groupe 2

#--
#-- Structure de la vue matérialisée `mv_number_article_week_label` pour stocker le nombre d'articles publiés par semaine
#-- et par theme
#--

CREATE TABLE IF NOT EXISTS `mv_number_article_week_label` (
  `id_label` int(11) NOT NULL,
  `number_article` int(11) NOT NULL,
  PRIMARY KEY (`id_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#--
#-- Contrainte de la clé étrangère

ALTER TABLE `mv_number_article_week_label`
  ADD CONSTRAINT `fk_article_label` FOREIGN KEY (`id_label`) REFERENCES `label` (`id_label`) ON DELETE CASCADE ON UPDATE CASCADE;