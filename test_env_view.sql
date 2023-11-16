-- SQLBook: Code
-- Création de la vue qui permet d'afficher le contenu de la table notebook avec le tp_name
CREATE VIEW tp_and_notebook AS
SELECT n.notebook_id, n.tp_id, n.notebook_name, t.tp_name
FROM notebooks n
INNER JOIN tp t ON n.tp_id = t.tp_id;
