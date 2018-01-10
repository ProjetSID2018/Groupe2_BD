#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: article
#------------------------------------------------------------

CREATE TABLE article(
        id_article       int (11) Auto_increment  NOT NULL ,
        date_publication Date ,
        rate_positivity  Float ,
        rate_negativity  Float ,
        rate_joy         Float ,
        rate_fear        Float ,
        rate_sadness     Float ,
        rate_angry       Float ,
        rate_surprise    Float ,
        rate_disgust     Float ,
        id_newspaper     Int NOT NULL ,
        PRIMARY KEY (id_article )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: newspaper
#------------------------------------------------------------

CREATE TABLE newspaper(
        id_newspaper   int (11) Auto_increment  NOT NULL ,
        name_newspaper Varchar (50) ,
        link_newspaper Varchar (2083) ,
        link_logo      Varchar (2083) ,
        PRIMARY KEY (id_newspaper ) ,
        UNIQUE (name_newspaper )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: author
#------------------------------------------------------------

CREATE TABLE author(
        id_author        int (11) Auto_increment  NOT NULL ,
        surname_author   Varchar (50) ,
        firstname_author Varchar (50) ,
        PRIMARY KEY (id_author )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: classification
#------------------------------------------------------------

CREATE TABLE classification(
        id_class int (11) Auto_increment  NOT NULL ,
        class    Varchar (25) ,
        PRIMARY KEY (id_class ) ,
        UNIQUE (class )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: lemma
#------------------------------------------------------------

CREATE TABLE lemma(
        id_lemma int (11) Auto_increment  NOT NULL ,
        lemma    Varchar (25) ,
        PRIMARY KEY (id_lemma ) ,
        UNIQUE (lemma )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: entity
#------------------------------------------------------------

CREATE TABLE entity(
        id_entity   int (11) Auto_increment  NOT NULL ,
        type_entity Varchar (25) ,
        PRIMARY KEY (id_entity ) ,
        UNIQUE (type_entity )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: word
#------------------------------------------------------------

CREATE TABLE word(
        id_word  int (11) Auto_increment  NOT NULL ,
        word     Varchar (50) NOT NULL ,
        id_lemma Int NOT NULL ,
        PRIMARY KEY (id_word ) ,
        UNIQUE (word )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: pos_tagging
#------------------------------------------------------------

CREATE TABLE pos_tagging(
        id_pos_tag int (11) Auto_increment  NOT NULL ,
        pos_tag    Varchar (25) ,
        PRIMARY KEY (id_pos_tag ) ,
        UNIQUE (pos_tag )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: position_word
#------------------------------------------------------------

CREATE TABLE position_word(
        id_position int (11) Auto_increment  NOT NULL ,
        position    Int NOT NULL ,
        title       Boolean NOT NULL ,
        id_word     Int NOT NULL ,
        id_entity   Int NOT NULL ,
        id_pos_tag  Int NOT NULL ,
        id_article  Int NOT NULL ,
        id_synonym  Int NOT NULL ,
        id_wiki     Int NOT NULL ,
        PRIMARY KEY (id_position )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: synonym
#------------------------------------------------------------

CREATE TABLE synonym(
        id_synonym int (11) Auto_increment  NOT NULL ,
        synonym    Varchar (50) NOT NULL ,
        PRIMARY KEY (id_synonym ) ,
        UNIQUE (synonym )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: wiki
#------------------------------------------------------------

CREATE TABLE wiki(
        id_wiki   int (11) Auto_increment  NOT NULL ,
        file_wiki Varchar (2803) NOT NULL ,
        PRIMARY KEY (id_wiki )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: realize
#------------------------------------------------------------

CREATE TABLE realize(
        id_article Int NOT NULL ,
        id_author  Int NOT NULL ,
        PRIMARY KEY (id_article ,id_author )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: belong
#------------------------------------------------------------

CREATE TABLE belong(
        id_article Int NOT NULL ,
        id_class   Int NOT NULL ,
        PRIMARY KEY (id_article ,id_class )
)ENGINE=InnoDB;

ALTER TABLE article ADD CONSTRAINT FK_article_id_newspaper FOREIGN KEY (id_newspaper) REFERENCES newspaper(id_newspaper);
ALTER TABLE word ADD CONSTRAINT FK_word_id_lemma FOREIGN KEY (id_lemma) REFERENCES lemma(id_lemma);
ALTER TABLE position_word ADD CONSTRAINT FK_position_word_id_word FOREIGN KEY (id_word) REFERENCES word(id_word);
ALTER TABLE position_word ADD CONSTRAINT FK_position_word_id_entity FOREIGN KEY (id_entity) REFERENCES entity(id_entity);
ALTER TABLE position_word ADD CONSTRAINT FK_position_word_id_pos_tag FOREIGN KEY (id_pos_tag) REFERENCES pos_tagging(id_pos_tag);
ALTER TABLE position_word ADD CONSTRAINT FK_position_word_id_article FOREIGN KEY (id_article) REFERENCES article(id_article);
ALTER TABLE position_word ADD CONSTRAINT FK_position_word_id_synonym FOREIGN KEY (id_synonym) REFERENCES synonym(id_synonym);
ALTER TABLE position_word ADD CONSTRAINT FK_position_word_id_wiki FOREIGN KEY (id_wiki) REFERENCES wiki(id_wiki);
ALTER TABLE realize ADD CONSTRAINT FK_realize_id_article FOREIGN KEY (id_article) REFERENCES article(id_article);
ALTER TABLE realize ADD CONSTRAINT FK_realize_id_author FOREIGN KEY (id_author) REFERENCES author(id_author);
ALTER TABLE belong ADD CONSTRAINT FK_belong_id_article FOREIGN KEY (id_article) REFERENCES article(id_article);
ALTER TABLE belong ADD CONSTRAINT FK_belong_id_class FOREIGN KEY (id_class) REFERENCES classification(id_class);
