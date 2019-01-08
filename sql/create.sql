DROP TABLE IF EXISTS mod_equations_transposition;
DROP TABLE IF EXISTS mod_simple_fractions;
DROP TABLE IF EXISTS mod_simple_ints;
DROP TABLE IF EXISTS user_module_index;
DROP TABLE IF EXISTS user_exercise_activity;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_groups;
DROP TABLE IF EXISTS organizations;
DROP TABLE IF EXISTS modules;

CREATE TABLE IF NOT EXISTS modules (
    id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    idkey VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(1000) NOT NULL,
    controller VARCHAR(100) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT unique_key UNIQUE(idkey)
);

CREATE TABLE IF NOT EXISTS organizations (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS user_groups (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    org_id INT UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (org_id)
        REFERENCES organizations(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS users (
    id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(200) NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    isadmin BOOLEAN NOT NULL DEFAULT FALSE,
    default_module INT UNSIGNED NOT NULL DEFAULT 1,
    user_group_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (default_module)
        REFERENCES modules(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY (user_group_id)
        REFERENCES user_groups(id) ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS user_exercise_activity (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    module_id INT UNSIGNED NOT NULL,
    exercise_id INT UNSIGNED NOT NULL,
    result BOOLEAN NOT NULL DEFAULT TRUE,
    time DATETIME DEFAULT CURRENT_TIMESTAMP,
    raw_answer VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id)
        REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (module_id)
        REFERENCES modules(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS user_module_index (
    user_id INT UNSIGNED NOT NULL,
    module_id INT UNSIGNED NOT NULL,
    start_index INT UNSIGNED NOT NULL,
    current_index INT UNSIGNED NOT NULL,
    PRIMARY KEY (user_id, module_id)
);

CREATE TABLE IF NOT EXISTS mod_simple_ints (
    id  INT UNSIGNED NOT NULL AUTO_INCREMENT,
    statement VARCHAR(100) NOT NULL,
    solution INTEGER NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS mod_simple_fractions (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    statement VARCHAR(100) NOT NULL,
    solution VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS mod_equations_transposition (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    statement VARCHAR(100) NOT NULL,
    solution VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
