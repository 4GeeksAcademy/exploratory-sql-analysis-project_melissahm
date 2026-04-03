-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

--NIVEL1
-- pregunta 1;
--select tabla y luego limite de 10 lineas
SELECT * FROM observations LIMIT 10;
--PREGUNTA 2;(query 10)
-- select de region id de la tabla regions, considerando distinto region_id;
SELECT DISTINCT id 
FROM regions;
--PREGUNTA 3;
-- HACERR DISTINCT COUNT DE REGION_ID 
SELECT  COUNT(DISTINCT species_id) FROM observations;

--PREGUNTA 4;
--DISTINCT COUNT POR ID EN OBSERVATIONS
SELECT COUNT(*) FROM observations WHERE region_id=2;

--PREGUNTA 5;
SELECT COUNT(*) FROM observations WHERE observation_date="1998-08-08";


--NIVEL2
--PREGUNTA 6
SELECT region_id, --VALOR DE REGION_ID
COUNT(*) FROM observations --CUENTA DE ID DE TABLA OBBSERVATIONS
GROUP BY region_id ORDER BY COUNT(*) DESC --POR REGION_ID Y ORDENADO DESCENNDENTE
LIMIT 1;--LIMITADO A 1 PARA Q DE EL MÁXIMO

--PREGUNTA 7
SELECT species_id,--valor de specie_id para luego identificar
COUNT(*) FROM observations --cuenta por id 
GROUP BY species_id ORDER BY COUNT(*) DESC-- cuenta agrupado por specie_id ordenador descendente
LIMIT 5; --limite de los 5 para los 5 +frecuentes

--pregunta 8
SELECT species_id,--valor de specie_id para luego identificar
COUNT(*) FROM observations --cuenta por id 
GROUP BY species_id HAVING COUNT(*)<5; --cuenta por specie y condicion de <5
--pregunta 9
SELECT observer,
COUNT (*) FROM observations
GROUP BY observer ORDER BY COUNT(*) DESC;

--NIVEL 3
--PREGUNTA 10 LEFT JOIN
SELECT observations.id, regions.name -- SELECT DE ID DE OBSERV Y NOMBRE DE REGION SE USA TABLA.COLUMNA PORQUE SON EXTRACCIONENS DE TABLAS DISTINTAS
FROM observations -- CORRESPONDIENTE  A TABLA OBSERVATIONS 
LEFT JOIN regions -- LEFT JOIN POR CAMPOS REGION_ID=ID
ON observations.region_id=regions.id;

--PREGUNTA 11
SELECT observations.id, species.scientific_name -- select de la tabla observation, el id y nombre científico
FROM observations
LEFT JOIN species
ON observations.species_id=species.id; -- left join con species_id =id de species

--pregunta 12
SELECT species.common_name, regions.name,COUNT (*)
FROM observations
--dos join para relacionar tablas species y regions a observations
LEFT JOIN species
ON observations.species_id=species.id
LEFT JOIN regions
ON observations.region_id=regions.id
GROUP BY regions.name, species.common_name
ORDER BY regions.name, COUNT(*) DESC;

--NIVEL 4
