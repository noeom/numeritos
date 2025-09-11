DROP DATABASE IF EXISTS numeritos;
CREATE DATABASE numeritos;

USE numeritos;

DROP TABLE IF EXISTS user_exercise_activity;
DROP TABLE IF EXISTS user_module_index;
DROP TABLE IF EXISTS exercises;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_groups;
DROP TABLE IF EXISTS organizations;

CREATE TABLE IF NOT EXISTS organizations (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS user_groups (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL,
    org_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (org_id)
        REFERENCES organizations(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS users (
    id  INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(200) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    admin BOOLEAN NOT NULL DEFAULT FALSE,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    expiry_date DATETIME,
    default_module INT NOT NULL DEFAULT 101,
    user_group_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_group_id)
        REFERENCES user_groups(id) ON DELETE CASCADE ON UPDATE NO ACTION,
    UNIQUE(email)
);

CREATE TABLE IF NOT EXISTS exercises (
    id  INT NOT NULL AUTO_INCREMENT,
    type INT NOT NULL,
    statement VARCHAR(300) NOT NULL,
    solution VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS user_module_index (
    user_id INT NOT NULL,
    module_id INT NOT NULL,
    current_index INT NOT NULL,
    PRIMARY KEY (user_id, module_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS user_exercise_activity (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    exercise_id INT NOT NULL,
    result INT NOT NULL,
    time DATETIME DEFAULT CURRENT_TIMESTAMP,
    raw_answer VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (exercise_id)
        REFERENCES exercises(id) ON DELETE CASCADE ON UPDATE CASCADE
);
