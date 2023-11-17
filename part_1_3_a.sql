--Création de la vue session_and_user qui permet d'afficher toutes les sessions ainsi que les données de l'utilisateur
CREATE VIEW session_and_user AS
SELECT s.connected_at, u.user_id, u.firstname, u.lastname, u.email, u.username, u.created_at 
FROM session_table s
INNER JOIN user_table u ON s.user_id = u.user_id;