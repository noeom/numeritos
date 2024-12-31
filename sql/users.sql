INSERT INTO organizations(id, name) VALUES (1, 'numeritos.net');
INSERT INTO user_groups(id, name, org_id) VALUES (1, 'Administradores', 1);
INSERT INTO users(name, surname, user_group_id, password_hash, email, admin) VALUES ('Noé', 'Otero Mateo', 1, '$2a$12$xVI.5CPpNUyTHXAh7vA6Jua/8MST.OCANANzoR7kbPFosGyDUbp3C', 'noe.otero@gmail.com', 1);

