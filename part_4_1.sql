DROP TABLE IF EXISTS session_count CASCADE;

--Création de la table session_count
CREATE TABLE session_count (
    session_count_id SERIAL PRIMARY KEY,
    user_id INT,
    session_count_value INT,
    FOREIGN KEY (user_id) REFERENCES user_table(user_id)
);

DROP FUNCTION IF EXISTS update_session_count CASCADE;

-- Création de la function update_session_count
CREATE OR REPLACE FUNCTION update_session_count()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifier si l'utilisateur a déjà une entrée dans la table session_count
    IF NOT EXISTS (SELECT 1 FROM session_count WHERE user_id = NEW.user_id) THEN
        -- Si l'utilisateur n'a pas d'entrée, ajouter une nouvelle ligne dans session_count
        INSERT INTO session_count (user_id, session_count_value) VALUES (NEW.user_id, 1);
    ELSE
        -- Sinon, mettre à jour la valeur de session_count_value
        UPDATE session_count
        SET session_count_value = session_count_value + 1
        WHERE user_id = NEW.user_id;
    END IF;
    RETURN NULL; -- Le déclencheur AFTER INSERT ne nécessite pas de valeur de retour
END;
$$ LANGUAGE plpgsql;

-- Création du trigger
CREATE TRIGGER trigger_update_session_count
AFTER INSERT ON session_table
FOR EACH ROW
EXECUTE FUNCTION update_session_count();