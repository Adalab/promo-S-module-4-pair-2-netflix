use netflix;

INSERT INTO users(user, password, name, email, plan_details)
VALUES ('La Lore', '12345678', 'Lore', 'lore@hotmail.com', ''),
('La Macu', '123456578', 'Macu', 'macu@hotmail.com', '');

-- CAMBIO DE FOTOS PARA ESTÁTICO

SELECT * FROM movies;
UPDATE movies SET image='//localhost:4000/pulp-fiction.jpg' WHERE id=1;
UPDATE movies SET image='//localhost:4000/la-vida-es-bella.jpg' WHERE id=2;
UPDATE movies SET image='//localhost:4000/forrest-gump.jpg' WHERE id=3;
