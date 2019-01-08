INSERT INTO organizations(name) VALUES ("IES San Blas");

INSERT INTO user_groups(name, org_id) VALUES ("Profesores", 1);
INSERT INTO user_groups(name, org_id) VALUES ("1º ESO D", 1);

INSERT INTO users(name, surname, user_name, user_group_id, password_hash, email) VALUES ('Noé', 'Otero Mateo', 'noe', 1, '$2y$10$ftDyzwnr4Yyk1IToEvqpj.TVtp8I20NRMntHAHIgluibX3Vii71Iu', 'noe.otero@gmail.com');
INSERT INTO users(name, surname, user_name, user_group_id, password_hash, email) VALUES ('Antonio Juan', 'Nieto Bravo', 'tato', 1, '$2y$10$RjFmlmfb9.RWCV2ZlkAfEuyPQyTX9GNRmB1LdWMuuMAuvJXj0PHGu', 'tateberets@gmail.com');
INSERT INTO users(name, surname, user_name, user_group_id, password_hash, email) VALUES ('User', 'Without Name', 'user', 2, '$2y$10$ZIP4sffPZKJaI/nGmKc1Ceh.DJY2Aqz5twjHD9iNjFAD6Q9tacEMa', 'user@server.com');

INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('María', 'Cabral Sánchez', 'mariacs', 2, '$2y$10$UJBPxWcIPAWxDNHSBnzfRerjEcUTOTs0/ZutsqUWcEfDHGEH8OUhG');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Cristóbal', 'Domínguez Martínez', 'cristobaldm', 2, '$2y$10$8qy4f4CuKrY4H9bb3cpauODrHQ.WtoSGXMlxi/5cvndtkD4Isb6oO');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Carlos', 'Durán García', 'carlosdg', 2, '$2y$10$M1/iBIlC1NqxHDX0wvusb.CgWi5vPZX2QY7FnLEj2B7wEdC.SIwaa');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Sayef-Edine', 'El Arfaoui Belbouli', 'sayefab', 2, '$2y$10$S1Z086KpsRjhDJn1QKqjG.vBodIsLjmuNJ6RRXVt1WNbf8nRJAFgi');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('José Luis', 'Escobar Durán', 'joseled', 2, '$2y$10$rbHCOY2jXgxAaFhBD4GGvuc.GI/ghvb5RUPoNX6GeCzf8eq7q49Bi');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Macarena', 'Fernández Márquez', 'macarenafm', 2, '$2y$10$pkP3vDV77FZ0yFgJFc9UN.ehIEUrA1XhUTxMcJOg1yElyb3x.SK42');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Rocío', 'Gómez Garzón', 'rociogg', 2, '$2y$10$1ghTboujuQ/CSj57UMdXKeLPJjHQgdracGLfTqMClFZX9O6Mmhvu2');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Alejandro', 'González Santos', 'alejandrogs', 2, '$2y$10$vdDcRtGsU6VQYFBMYPjzwOOp8iqkEx714f2J2vaXaBgpgyKlaV/Qu');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Alba', 'Jiménez Carrión', 'albajc', 2, '$2y$10$WNKDw3iHZAe2OQyb911Xg.6CtVOyQ3yov/1lmEn08MPOWaHC6/hKK');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Inoe', 'Leitao Varet', 'inoelv', 2, '$2y$10$QglD17DQsYM038PMPRztsOHaCIQHx39kEYboHciVC7uwoZo6eeDCq');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Germán', 'Macías Rivero', 'germanmr', 2, '$2y$10$zXaQii1PIlxxiIBRGpVEFuXG1DUKvUtCB.4Kei4EoxFt0HTJ/bhZ2');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Irene María', 'Miranda Sánchez', 'irenemms', 2, '$2y$10$cqHI9uKPccY39pGlhIFku.EdeTZkEEiuQ0YO4axfP/X1VOsDanHjK');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Matías', 'Montejo Fernández', 'matiasmf', 2, '$2y$10$EmvWRXxW/Avm2R6X1b1Nc.MeqSqYAcRY9RsD/Za2MeFnpEJ6NGXRe');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Lola', 'Pinto Topic', 'lolapt', 2, '$2y$10$rHp8H/teBM9a8Ssymmah.ugmtZwZmpl/Iz1MM2VvkKcIFPc3fJHgO');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Abel', 'Rivero López', 'abelrl', 2, '$2y$10$Q.zuMpDyZBXnQoJJMmeiuerCrlYHYf6w1EmpZUX7voJ4b.glSMJ2y');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Juan', 'Rodríguez Fernández', 'juanrf', 2, '$2y$10$QuFdpnadWIiAEpeiv2uvyuSSxdWBZkR1tso66iBH5qSf/OnyP61NC');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Javier', 'Rodríguez Soto', 'javierrs', 2, '$2y$10$8FyQ0s.rQSXHAOUdcYecKutUa5ewRTG5gigQdiI4JZKzZbYULKt8y');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Mercedes', 'Rodríguez Valiente', 'mercedesrv', 2, '$2y$10$NE0ka3oUYsSUXfaPwj8uSOvnOTqtzeU0veP.qBj.ZmhUYY20.k8Xu');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Julián', 'Romero Velasco', 'julianrv', 2, '$2y$10$q5Ey84.yqEWk18ovV8CP7..ejdyBe3H.FIBibrkWI0ZqaS56NsKfW');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Alegría', 'Shabahang Matito', 'alegriasm', 2, '$2y$10$oT8W7RlPOCenYKBT0TWjT.FH3BWlzYDOxxX7ac4cgVQdoJXBMvBDq');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Amaia', 'Tobalina Quejido', 'amaiatq', 2, '$2y$10$5C.rhskHebi0Fw0.9EUdoehcnZm9u/Jo3mNoVH3qOBcZ98IAwdsdu');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Enrique', 'Urbano Soria', 'enriqueus', 2, '$2y$10$gH9.f495l8LpohTdw49jCuQB/xkW9uiVa/PVEFL.UFAY4VNdc6jjW');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Ainhoa', 'Vázquez González', 'ainhoavg', 2, '$2y$10$G/B7gcJO7mM.5BVwg9lCReMGTcw9dFonizFATvLrc3j/I3UQ9/qCO');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Cristina', 'Vázquez Rebollo', 'cristinavr', 2, '$2y$10$SSscIGyApnlr5RDpFCBViuZMI1c6obO3ZJSdYW.ohqpKKQ512q7W2');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Antonio', 'Vega González', 'antoniovg', 2, '$2y$10$3QnAQnh51d/5.NG3Ft5geegL8sg3Wr2lFSH/BsKLIBGAIFbBWwfSa');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Rubén', 'Zafra Rufino', 'rubenzr', 2, '$2y$10$iGmcyUt7OtjKZohBsKWmROEqbmCHSYHpF2Gwr8n7Hn20CMdzPkWEy');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Florín Carlos Daniel', 'Zamfir Asan', 'carlosdza', 2, '$2y$10$ede.9D2jXH2n0i/edfltf.JW1sBFxoUsDzhdGmESDi5FxBdKbga5i');
INSERT INTO users (name, surname, user_name, user_group_id, password_hash) VALUES ('Marioara', 'Zamfir', 'marioaraz', 2, '$2y$10$uVIP.ZeUx3QuydgnevIWF.oRckNgisLfFty9ROQbUXEmromo0DaWO');



