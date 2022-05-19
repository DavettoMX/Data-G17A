use sesion6;

SELECT * FROM netflix_titles;

SELECT * FROM netflix_activity;

SELECT * FROM netflix_users;

-- Joining Tables
SELECT u.user_id, u.nombre, a.show
FROM netflix_users as u
LEFT JOIN netflix_activity as a
ON u.user_id = a.user_id;

-- Qué titulo le corresponde a cada actividad
-- Tabla : Titulos
-- show_id
-- title
-- Tabla : Activity
-- show_id
-- view_date
SELECT t.show_id, t.title, a.view_date
FROM netflix_titles as t
LEFT JOIN netflix_activity as a
ON t.show_id = a.show;

-- 
SELECT t.show_id, t.type, t.title, a.user_id, u.nombre
FROM netflix_titles as t
INNER JOIN netflix_activity as a
ON t.show_id = a.show
LEFT JOIN netflix_users as u
USING (user_id)
ORDER BY nombre;

# ACTIVIDAD

-- MUESTRA SOLO LOS TÍTULOS QUE SEAN PELÍCULAS
SELECT t.title, t.type
FROM netflix_titles as t
WHERE type = 'Movie';

-- CUENTA CUANTOS USUARIOS HAN VISTO CADA PELÍCULA Y ORDENA POR SHOW_ID
SELECT t.show_id, t.type, t.title, COUNT(*)
FROM netflix_titles as t
INNER JOIN netflix_activity as a
ON t.show_id = a.show
WHERE type = 'Movie'
GROUP BY show_id
ORDER BY show_id;

-- CUENTA CUANTOS USUARIOS HAN VISTO CADA PELÍCULA Y ORDENA POR SHOW_ID
SELECT t.show_id, t.type, t.title, t.release_year, COUNT(*)
FROM netflix_titles as t
INNER JOIN netflix_activity as a
ON t.show_id = a.show
WHERE type = 'Movie' AND release_year = 2021
GROUP BY show_id
ORDER BY show_id;

-- TODAS LAS PELÍCULAS QUE SEAN DE 'UNITED STATES' o 'UNITED KINGDOM' y sean arriba del 2010
SELECT type, title, release_year, country
FROM netflix_titles
WHERE type = 'Movie' AND release_year > 2010 AND (country = 'United States' OR country = 'United Kingdom');