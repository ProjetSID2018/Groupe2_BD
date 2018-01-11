#-- Groupe 2

#--
#-- Structure de la vue matérialisée `mv_number_article_week` pour stocker le nombre d'articles publiés par semaine
#--

CREATE TABLE IF NOT EXISTS `mv_number_article_week` (
  `number_article` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
