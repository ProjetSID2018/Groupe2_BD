-- Groupe 2

--
-- Structure de la vue matérialisée `mv_number_article_week_class` pour stocker le nombre d'articles publiés par semaine
-- et par theme
--

CREATE TABLE IF NOT EXISTS `mv_number_article_week_class` (
  `id_classe` int(11) NOT NULL,
  `number_article` int(11) NOT NULL,
  PRIMARY KEY (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mv_number_article_week`
--
-- Contrainte de la clé étrangère

ALTER TABLE `mv_number_article_week_class`
  ADD CONSTRAINT `fk_article_classification` FOREIGN KEY (`id_classe`) REFERENCES `classification` (`id_classe`) ON DELETE CASCADE ON UPDATE CASCADE;