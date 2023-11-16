-- SQLBook: Code
-- Suppression des tables si existantes
DROP TABLE IF EXISTS user_table ;
DROP TABLE IF EXISTS user_email_verification_table;
DROP TABLE IF EXISTS session_table;

-- Création de la table 'user_table'
CREATE TABLE user_table (
    user_id SERIAL PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    username VARCHAR(255) UNIQUE CHECK (LENGTH(password) > 8),
    password VARCHAR(255) CHECK (LENGTH(password) > 8),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table 'user_email_verification_table'
CREATE TABLE user_email_verification_table (
    uev_id SERIAL PRIMARY KEY,
    user_id INT,
    verified_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_table(user_id)
);

-- Création de la table 'session_table'
CREATE TABLE session_table (
    session_id SERIAL PRIMARY KEY,
    user_id INT,
    connected_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_table(user_id)
);