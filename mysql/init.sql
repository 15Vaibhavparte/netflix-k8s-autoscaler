CREATE DATABASE IF NOT EXISTS netflix_db;
USE netflix_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Seed data for testing
INSERT INTO users (email, password) VALUES ('admin@netflix.com', 'password123');