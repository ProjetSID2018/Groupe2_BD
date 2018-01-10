Format de données pour le groupe filtrage, les requêtes sont présentées dans un ordre logique :

---

Alimentations des journaux (link_newspaper : lien vers le journal, link logo : lien vers le logo du journal) : 

POST : /newspaper

```{"name_newspaper" : string, link_newspaper : string, link_logo : string}```

---

Alimentation des entitées :

POST : /entity

```{"type_entity" : string}```

---

Alimentation des pos-tag :

POST : /postagging

```{"post_tag" : string}```

---

Alimentation des mots et des racines en même temps (lemma peut être vide : "") 

POST : /word

```{"word" : string, "lemma" : string}```

--> récupération de "id_word" renvoyé par la requête de l'alimentation des mots : à ajouter au dictionnaire pour la requête position_word (sémantique).

---

Alimentation des auteurs : 

POST : /author

```{"surname_author" : string, "firstname_author" : string}```

--> récupération de l'id_author ou de la liste renvoyé par la requête de l'alimentation des auteurs : à ajouter au dictionnaire pour la requête write (sémantique).

--- 

Les informations envoyés par le groupe filtrage au groupe sémantique pour l'alimentation de l'index pour chaque article (important chaque article)  : 

#### 1) Un dictionnaire contenant les informations de l'article et la liste des id_author de l'article :

```{"date_publication" : 1996-06-18, "name_newspaper" : string}```

Ce dictionnaire n'est pas exhaustif mais doit au moins contenir les informations ci-dessus.


#### 2) Autant de dictionnaires que de mots sélectionnés dans l'article (position_word est la position dans le texte, title = True si élément du titre False sinon) : 

```{"id_word" : int, "position_word" : int, "title": boolean}```

Ce dictionnaire n'est pas exhaustif mais doit au moins contenir les informations ci-dessus.

Le package request est fonctionne très bien.

J'essayerai de me libérer si vous avez besoin d'une main supplémentaire pour pythoner, conscient que c'est lourd. 
Ps : Paul va faire la gueule.
Bien à vous.
Raph



------

Format de données pour le groupe sémantique, les requêtes sont présentées dans un ordre logique : 

Alimentation des pages wikipedia : 

POST

```{"wiki" : string}```

Alimentation des synonyme :

POST

```{"synonym" : string}```

--

Alimentation de l'article : 

POST : 

```{"date_publication" : 2016-11-28, "name_newspaper" : string}```

--> récupération de "id_article" nécessaire pour la requête write




note créer procedure article pour filtrage puis autre procedure article pour semantique. cette procédure récupère l'id du journal pour filtrage.
La procédure sémantique met à jour à partir de l'id_article. créer un attribut synthetic boolean true lors de l'insertion par filtrage et false lors de la mise à jour par sémantique.


To do modifier la procédure PPOSITIONWORD aller chercher l'id de l'entité, du pos tag, du synonyme et du file wiki à partir des chaines de caractères. La procédure prend l'entite en entrée et va chercher l'id...
 
Charles de Gaulle 

Personne Personne Personne 

Gaulle -> Personne

