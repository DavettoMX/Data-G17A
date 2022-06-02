use countries;
show tables;

-- Utiliza INNER JOIN para cruzar las tablas 'cities' y 'countries'
SELECT city.name, country.country_name, country.code, country.region, city.city_proper_pop
FROM cities as city
INNER JOIN countries as country
ON city.name = country.capital
ORDER BY country_code DESC;

-- Utiliza LEFT JOIN para cruzar las tablas 'countries' y 'languages'
SELECT country.country_name, country.local_name, langs.name, langs.percent
FROM countries as country
LEFT JOIN languages as langs
ON country.code = langs.code
ORDER BY country.country_name ASC;

-- Utiliza LEFT JOIN para cruzar las tablas 'countries' y 'economies'
SELECT country.country_name, country.region, economy.gdp_percapita
FROM countries as country
LEFT JOIN economies as economy
ON country.code = economy.code
WHERE year = 2010;

-- Convierte el Ejemplo para utilizar RIGHT JOINS pero obteniendo el mismo resultado
SELECT city.name, city.urbanarea_pop, country.country_name, country.indep_year, langs.name, langs.percent, COUNT(*)
FROM countries as country
LEFT JOIN languages as langs
ON country.code = langs.code
RIGHT JOIN cities as city
ON country.CODE = city.country_code
GROUP BY city.name;

-- Has una subconsulta en WHERE donde calcules el promedio de la expectativa de vida en la tabla 'populations', filtrando solo para el año 2015
SELECT *
FROM populations
WHERE life_expectancy > 1.15*(SELECT AVG(life_expectancy)
FROM populations
WHERE year = 2015)
GROUP BY country_code
ORDER BY life_expectancy DESC;