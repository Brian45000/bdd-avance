-- SQLBook: Code
-- Suppression des tables pour reexecution du script
DROP TABLE IF EXISTS notebooks;
DROP TABLE IF EXISTS tp ;

-- Création de la table TP
CREATE TABLE tp (
    tp_id SERIAL PRIMARY KEY, 
    tp_name VARCHAR(255) NOT NULL
);

-- Création de la table notebooks : 
CREATE TABLE notebooks (
    notebook_id SERIAL PRIMARY KEY,
    tp_id INTEGER NOT NULL,
    notebook_name varchar(255) NOT NULL,
    FOREIGN KEY (tp_id) REFERENCES tp(tp_id)
);

-- Insertion des TP 
INSERT INTO tp (tp_name) VALUES ('tp1');
INSERT INTO tp (tp_name) VALUES ('tp2');


-- Insertion des données pour le TP1
INSERT INTO notebooks (tp_id, notebook_name) VALUES (1, '0_sql_intro_northwind.ipynb');
INSERT INTO notebooks (tp_id, notebook_name) VALUES (1, '1_rapatrier_et_filtrer.ipynb');
INSERT INTO notebooks (tp_id, notebook_name) VALUES (1, '2_exercices.ipynb');
INSERT INTO notebooks (tp_id, notebook_name) VALUES (1, '3_corriges.ipynb');

-- Insertion des données pour le TP2
INSERT INTO notebooks (tp_id, notebook_name) VALUES (2, '0_jointures_aggregation_sets.ipynb');
INSERT INTO notebooks (tp_id, notebook_name) VALUES (2, '1_exercices_jointures_aggregation_sets.ipynb');
INSERT INTO notebooks (tp_id, notebook_name) VALUES (2, '2_corriges.ipynb');
INSERT INTO notebooks (tp_id, notebook_name) VALUES (2, '3_subqueries.ipynb');
INSERT INTO notebooks (tp_id, notebook_name) VALUES (2, '4_exercices_subqueries.ipynb');
INSERT INTO notebooks (tp_id, notebook_name) VALUES (2, '5_corriges.ipynb');
INSERT INTO notebooks (tp_id, notebook_name) VALUES (2, '6_exemples.ipynb');
