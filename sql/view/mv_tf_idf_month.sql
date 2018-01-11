#--Groupe 2 

#--Table des tf par mois

CREATE TABLE IF NOT EXISTS `mv_term_frequency_month` (
  `id_word` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `frequency` int(11) NOT NULL,
  PRIMARY KEY (`id_word`,`id_article`),
  KEY `fk_article_tf_month` (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mv_term_frequency_month`
  ADD CONSTRAINT `fk_article_tf_month` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_word_tf_month` FOREIGN KEY (`id_word`) REFERENCES `word` (`id_word`) ON DELETE CASCADE ON UPDATE CASCADE;
  
#--Table des nombres d'articles par mois

CREATE TABLE IF NOT EXISTS `nb_articles_month` (
  `nb_articles` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#--Table des nombres d'articles par mot

CREATE TABLE IF NOT EXISTS `nb_articles_word_month` (
  `id_word` int(11) NOT NULL,
  `nb_articles` int(11) NOT NULL,
  PRIMARY KEY (`id_word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `nb_articles_word_month`
  ADD CONSTRAINT `fk_word_nb_articles_word_month` FOREIGN KEY (`id_word`) REFERENCES `word` (`id_word`) ON DELETE CASCADE ON UPDATE CASCADE;
  
#--Table des idf par mois

CREATE TABLE IF NOT EXISTS `mv_inverse_document_frequency_month` (
  `id_word` int(11) NOT NULL,
  `idf` float NOT NULL,
  PRIMARY KEY (`id_word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mv_inverse_document_frequency_month`
  ADD CONSTRAINT `fk_word_idf_month` FOREIGN KEY (`id_word`) REFERENCES `word` (`id_word`) ON DELETE CASCADE ON UPDATE CASCADE;
  
#--Table des tf_idf par mois

CREATE TABLE IF NOT EXISTS `mv_tf_idf_month` (
  `date_publication` date NOT NULL,
  `id_word` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `tf` int(11) NOT NULL,
  `tf_idf` float NOT NULL,
  PRIMARY KEY (`date_publication`,`id_word`,`id_article`),
  KEY `fk_article_tf_idf_month` (`id_article`),
  KEY `fk_word_tf_idf_month` (`id_word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `mv_tf_idf_month`
  ADD CONSTRAINT `fk_article_tf_idf_month` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_word_tf_idf_month` FOREIGN KEY (`id_word`) REFERENCES `word` (`id_word`) ON DELETE CASCADE ON UPDATE CASCADE;