INSERT INTO organizations(id, name) VALUES (1, 'IES San Blas');
INSERT INTO organizations(id, name) VALUES (2, 'IES El Brocense');
INSERT INTO user_groups(id, name, org_id) VALUES (1, 'Profesores', 1);
INSERT INTO user_groups(id, name, org_id) VALUES (2, 'Profesores', 2);
INSERT INTO users(name, surname, user_group_id, password_hash, email, admin) VALUES ('Noé', 'Otero Mateo', 1, '$2a$10$AMZoKCg1s5hx4.K7RdG3.exr1v7mHmRJrS/pm3QPR.gCn4IPyQZVW', 'noe.otero@gmail.com', 1);
INSERT INTO users(name, surname, user_group_id, password_hash, email, admin) VALUES ('Antonio Juan', 'Nieto Bravo', 2, '$2a$10$AMZoKCg1s5hx4.K7RdG3.exr1v7mHmRJrS/pm3QPR.gCn4IPyQZVW', 'ajnietob01@educarex.es ', 1);
