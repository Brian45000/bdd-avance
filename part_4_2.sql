-- Création de la table username_history
CREATE TABLE username_history (
    username_history_id SERIAL PRIMARY KEY,
    user_id INT,
    username_new VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user_table(user_id)
);

-- Création de la fonction pour le trigger
CREATE OR REPLACE FUNCTION update_username_history()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO username_history (user_id, username_new)
    VALUES (NEW.user_id, NEW.username);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Création du trigger trigger_update_username
CREATE TRIGGER trigger_update_username
AFTER INSERT OR UPDATE ON user_table
FOR EACH ROW
EXECUTE FUNCTION update_username_history();


-- Insertion de 5 Users
INSERT INTO user_table (firstname, lastname, email, username, password) VALUES
('John', 'Doe', 'john.doe99@example.com', 'johndoe54852', 'securepwd123');
INSERT INTO user_table (firstname, lastname, email, username, password) VALUES
('Jane', 'Smith', 'jane.smith58@example.com', 'janesmith654985', 'myp@ssword');
INSERT INTO user_table (firstname, lastname, email, username, password) VALUES
('Alice', 'Johnson', 'alice.johnson56@example.com', 'alice12345687', 'strongpwd');
INSERT INTO user_table (firstname, lastname, email, username, password) VALUES
('Bob', 'Miller', 'bob.miller25@example.com', 'bobm654789531684', 'password123');
INSERT INTO user_table (firstname, lastname, email, username, password) VALUES
('Eva', 'Williams', 'eva.williams15@example.com', 'evaw1657825', 'secret123');

--MAJ de nos utilisateurs
UPDATE user_table SET username = username || '_update' WHERE username = 'johndoe54852';
UPDATE user_table SET username = username || '_update' WHERE username = 'janesmith654985';
UPDATE user_table SET username = username || '_update' WHERE username = 'alice12345687';
UPDATE user_table SET username = username || '_update' WHERE username = 'bobm654789531684';
UPDATE user_table SET username = username || '_update' WHERE username = 'evaw1657825';


SELECT * FROM username_history;