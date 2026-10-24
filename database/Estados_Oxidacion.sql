------------------------------------------
--Comprobamos los valores de la tabla

SELECT * FROM "Tabla_Elementos".estados_oxidacion;
------------------------------------------

------------------------------------------

SELECT *
FROM "Tabla_Elementos".estados_oxidacion
ORDER BY valor;

------------------------------------------
--Agregamos los estados de oxidacion a la tabla
-- Una sugerencia fue el valor UNIQUE para el diseño de la tabla para evitar la duplicación de valores 

INSERT INTO "Tabla_Elementos".estados_oxidacion (valor)
VALUES
    (-4),
    (-3),
    (-2),
    (-1),
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8);

------------------------------------------
-- Agregamos el valor de estado de oxidación 0
-- aqui comprovamos que no se dupliquen los valores podemos agregar un valor 2 veces y PostgreSQL nos arrojara un error
INSERT INTO "Tabla_Elementos".estados_oxidacion (valor)
VALUES (0);

------------------------------------------
-- introducimos los estados de oxidacion

INSERT INTO "Tabla_Elementos".elemento_estado_oxidacion
    (id_elemento, id_estado_oxidacion)
SELECT
    e.id_elemento,
    eo.id_estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eo.valor = ANY (
        CASE e.numero_atomico
            WHEN 1 THEN ARRAY[-1, 1]
            WHEN 2 THEN ARRAY[0]
            WHEN 3 THEN ARRAY[1]
            WHEN 4 THEN ARRAY[2]
            WHEN 5 THEN ARRAY[3]
            WHEN 6 THEN ARRAY[-4, 2, 4]
            WHEN 7 THEN ARRAY[-3, -2, -1, 1, 2, 3, 4, 5]
            WHEN 8 THEN ARRAY[-2]
            WHEN 9 THEN ARRAY[-1]
            WHEN 10 THEN ARRAY[0]
        END
    )
WHERE e.numero_atomico BETWEEN 1 AND 10;

----------------------------------------------
--y comprobamos su agregacion

SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    eo.valor AS estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eeo.id_estado_oxidacion = eo.id_estado_oxidacion
WHERE e.numero_atomico BETWEEN 1 AND 10
ORDER BY e.numero_atomico, eo.valor;

------------------------------------------------
-- Agregamos del 11-20

INSERT INTO "Tabla_Elementos".elemento_estado_oxidacion
    (id_elemento, id_estado_oxidacion)
SELECT
    e.id_elemento,
    eo.id_estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eo.valor = ANY (
        CASE e.numero_atomico
            WHEN 11 THEN ARRAY[1]
            WHEN 12 THEN ARRAY[2]
            WHEN 13 THEN ARRAY[3]
            WHEN 14 THEN ARRAY[-4, 2, 4]
            WHEN 15 THEN ARRAY[-3, 3, 5]
            WHEN 16 THEN ARRAY[-2, 2, 4, 6]
            WHEN 17 THEN ARRAY[-1, 1, 3, 5, 7]
            WHEN 18 THEN ARRAY[0]
            WHEN 19 THEN ARRAY[1]
            WHEN 20 THEN ARRAY[2]
        END
    )
WHERE e.numero_atomico BETWEEN 11 AND 20;

-- Comprobamos

SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    eo.valor AS estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eeo.id_estado_oxidacion = eo.id_estado_oxidacion
WHERE e.numero_atomico BETWEEN 11 AND 20
ORDER BY e.numero_atomico, eo.valor;

-----------------------------------------------

-- para obtener el total de relaciones
SELECT COUNT(*) AS total_relaciones
FROM "Tabla_Elementos".elemento_estado_oxidacion;

-- elementos y estados relacionados

SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    STRING_AGG(
        eo.valor::TEXT,
        ', ' ORDER BY eo.valor
    ) AS estados_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eeo.id_estado_oxidacion = eo.id_estado_oxidacion
WHERE e.numero_atomico BETWEEN 1 AND 20
GROUP BY
    e.numero_atomico,
    e.simbolo,
    e.nombre
ORDER BY e.numero_atomico;

------------------------------------------------------
-- agregamos 21-40
INSERT INTO "Tabla_Elementos".elemento_estado_oxidacion
    (id_elemento, id_estado_oxidacion)
SELECT
    e.id_elemento,
    eo.id_estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eo.valor = ANY (
        CASE e.numero_atomico
            WHEN 21 THEN ARRAY[3]
            WHEN 22 THEN ARRAY[2, 3, 4]
            WHEN 23 THEN ARRAY[2, 3, 4, 5]
            WHEN 24 THEN ARRAY[2, 3, 6]
            WHEN 25 THEN ARRAY[2, 3, 4, 6, 7]
            WHEN 26 THEN ARRAY[2, 3]
            WHEN 27 THEN ARRAY[2, 3]
            WHEN 28 THEN ARRAY[2, 3]
            WHEN 29 THEN ARRAY[1, 2]
            WHEN 30 THEN ARRAY[2]

            WHEN 31 THEN ARRAY[1, 3]
            WHEN 32 THEN ARRAY[2, 4]
            WHEN 33 THEN ARRAY[-3, 3, 5]
            WHEN 34 THEN ARRAY[-2, 4, 6]
            WHEN 35 THEN ARRAY[-1, 1, 3, 5, 7]
            WHEN 36 THEN ARRAY[0, 2]

            WHEN 37 THEN ARRAY[1]
            WHEN 38 THEN ARRAY[2]
            WHEN 39 THEN ARRAY[3]
            WHEN 40 THEN ARRAY[2, 3, 4]
        END
    )
WHERE e.numero_atomico BETWEEN 21 AND 40;

-----------------------------------------------------
-- Comprobamos
SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    STRING_AGG(
        eo.valor::TEXT,
        ', ' ORDER BY eo.valor
    ) AS estados_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eeo.id_estado_oxidacion = eo.id_estado_oxidacion
WHERE e.numero_atomico BETWEEN 21 AND 40
GROUP BY
    e.numero_atomico,
    e.simbolo,
    e.nombre
ORDER BY e.numero_atomico;
-------------------------------------------------
-- Agregamos de 41-60
INSERT INTO "Tabla_Elementos".elemento_estado_oxidacion
    (id_elemento, id_estado_oxidacion)
SELECT
    e.id_elemento,
    eo.id_estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eo.valor = ANY (
        CASE e.numero_atomico
            WHEN 41 THEN ARRAY[3, 5]
            WHEN 42 THEN ARRAY[2, 3, 4, 5, 6]
            WHEN 43 THEN ARRAY[4, 7]
            WHEN 44 THEN ARRAY[2, 3, 4, 6, 8]
            WHEN 45 THEN ARRAY[1, 3]
            WHEN 46 THEN ARRAY[2, 4]
            WHEN 47 THEN ARRAY[1, 2]
            WHEN 48 THEN ARRAY[2]

            WHEN 49 THEN ARRAY[1, 3]
            WHEN 50 THEN ARRAY[2, 4]
            WHEN 51 THEN ARRAY[-3, 3, 5]
            WHEN 52 THEN ARRAY[-2, 4, 6]
            WHEN 53 THEN ARRAY[-1, 1, 3, 5, 7]
            WHEN 54 THEN ARRAY[0]

            WHEN 55 THEN ARRAY[1]
            WHEN 56 THEN ARRAY[2]

            WHEN 57 THEN ARRAY[3]
            WHEN 58 THEN ARRAY[3, 4]
            WHEN 59 THEN ARRAY[3, 4]
            WHEN 60 THEN ARRAY[3]
        END
    )
WHERE e.numero_atomico BETWEEN 41 AND 60;

--Comprobamos

INSERT INTO "Tabla_Elementos".elemento_estado_oxidacion
    (id_elemento, id_estado_oxidacion)
SELECT
    e.id_elemento,
    eo.id_estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eo.valor = ANY (
        CASE e.numero_atomico
            WHEN 41 THEN ARRAY[3, 5]
            WHEN 42 THEN ARRAY[2, 3, 4, 5, 6]
            WHEN 43 THEN ARRAY[4, 7]
            WHEN 44 THEN ARRAY[2, 3, 4, 6, 8]
            WHEN 45 THEN ARRAY[1, 3]
            WHEN 46 THEN ARRAY[2, 4]
            WHEN 47 THEN ARRAY[1, 2]
            WHEN 48 THEN ARRAY[2]

            WHEN 49 THEN ARRAY[1, 3]
            WHEN 50 THEN ARRAY[2, 4]
            WHEN 51 THEN ARRAY[-3, 3, 5]
            WHEN 52 THEN ARRAY[-2, 4, 6]
            WHEN 53 THEN ARRAY[-1, 1, 3, 5, 7]
            WHEN 54 THEN ARRAY[0]

            WHEN 55 THEN ARRAY[1]
            WHEN 56 THEN ARRAY[2]

            WHEN 57 THEN ARRAY[3]
            WHEN 58 THEN ARRAY[3, 4]
            WHEN 59 THEN ARRAY[3, 4]
            WHEN 60 THEN ARRAY[3]
        END
    )
WHERE e.numero_atomico BETWEEN 41 AND 60;

--
SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    STRING_AGG(
        eo.valor::TEXT,
        ', ' ORDER BY eo.valor
    ) AS estados_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eeo.id_estado_oxidacion = eo.id_estado_oxidacion
WHERE e.numero_atomico BETWEEN 41 AND 60
GROUP BY
    e.numero_atomico,
    e.simbolo,
    e.nombre
ORDER BY e.numero_atomico;

-----------------------------------------------------------
--Agregamos 61-80

INSERT INTO "Tabla_Elementos".elemento_estado_oxidacion
    (id_elemento, id_estado_oxidacion)
SELECT
    e.id_elemento,
    eo.id_estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eo.valor = ANY (
        CASE e.numero_atomico
            WHEN 61 THEN ARRAY[3]
            WHEN 62 THEN ARRAY[2, 3]
            WHEN 63 THEN ARRAY[2, 3]
            WHEN 64 THEN ARRAY[3]
            WHEN 65 THEN ARRAY[3, 4]
            WHEN 66 THEN ARRAY[3]
            WHEN 67 THEN ARRAY[3]
            WHEN 68 THEN ARRAY[3]
            WHEN 69 THEN ARRAY[2, 3]
            WHEN 70 THEN ARRAY[2, 3]

            WHEN 71 THEN ARRAY[3]
            WHEN 72 THEN ARRAY[4]
            WHEN 73 THEN ARRAY[3, 5]
            WHEN 74 THEN ARRAY[2, 3, 4, 5, 6]
            WHEN 75 THEN ARRAY[2, 3, 4, 5, 6, 7]
            WHEN 76 THEN ARRAY[2, 3, 4, 6, 8]
            WHEN 77 THEN ARRAY[3, 4]
            WHEN 78 THEN ARRAY[2, 4]
            WHEN 79 THEN ARRAY[1, 3]
            WHEN 80 THEN ARRAY[1, 2]
        END
    )
WHERE e.numero_atomico BETWEEN 61 AND 80;
---------------------------------------------------------
--Comprobamos
SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    STRING_AGG(
        eo.valor::TEXT,
        ', ' ORDER BY eo.valor
    ) AS estados_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eeo.id_estado_oxidacion = eo.id_estado_oxidacion
WHERE e.numero_atomico BETWEEN 61 AND 80
GROUP BY
    e.numero_atomico,
    e.simbolo,
    e.nombre
ORDER BY e.numero_atomico;
------------------------------------------------------
--Comprobamos que no tenemos duplicados <----- esto es importate
SELECT
    id_elemento,
    id_estado_oxidacion,
    COUNT(*) AS cantidad
FROM "Tabla_Elementos".elemento_estado_oxidacion
GROUP BY id_elemento, id_estado_oxidacion
HAVING COUNT(*) > 1;
-------------------------------------------------------
-- cuantos elementos tienen al menos un estado <----- esto es importate
SELECT COUNT(DISTINCT id_elemento) AS elementos_con_estado
FROM "Tabla_Elementos".elemento_estado_oxidacion;
------------------------------------------------------
-- Agregamos 81-100
INSERT INTO "Tabla_Elementos".elemento_estado_oxidacion
    (id_elemento, id_estado_oxidacion)
SELECT
    e.id_elemento,
    eo.id_estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eo.valor = ANY (
        CASE e.numero_atomico
            WHEN 81 THEN ARRAY[1, 3]
            WHEN 82 THEN ARRAY[2, 4]
            WHEN 83 THEN ARRAY[3, 5]
            WHEN 84 THEN ARRAY[2, 4, 6]
            WHEN 85 THEN ARRAY[-1, 1, 3, 5, 7]
            WHEN 86 THEN ARRAY[0, 2]
            WHEN 87 THEN ARRAY[1]
            WHEN 88 THEN ARRAY[2]
            WHEN 89 THEN ARRAY[3]
            WHEN 90 THEN ARRAY[4]
            WHEN 91 THEN ARRAY[4, 5]
            WHEN 92 THEN ARRAY[3, 4, 5, 6]
            WHEN 93 THEN ARRAY[3, 4, 5, 6, 7]
            WHEN 94 THEN ARRAY[3, 4, 5, 6]
            WHEN 95 THEN ARRAY[3, 4, 5, 6]
            WHEN 96 THEN ARRAY[3, 4]
            WHEN 97 THEN ARRAY[3, 4]
            WHEN 98 THEN ARRAY[3, 4]
            WHEN 99 THEN ARRAY[3]
            WHEN 100 THEN ARRAY[3]
        END
    )
WHERE e.numero_atomico BETWEEN 81 AND 100;
-----------------------------------------------
--comprobamos
SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    STRING_AGG(
        eo.valor::TEXT,
        ', ' ORDER BY eo.valor
    ) AS estados_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eeo.id_estado_oxidacion = eo.id_estado_oxidacion
WHERE e.numero_atomico BETWEEN 81 AND 100
GROUP BY
    e.numero_atomico,
    e.simbolo,
    e.nombre
ORDER BY e.numero_atomico;
-------------------------------------------------------
-- Agregamos 101-118
INSERT INTO "Tabla_Elementos".elemento_estado_oxidacion
    (id_elemento, id_estado_oxidacion)
SELECT
    e.id_elemento,
    eo.id_estado_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eo.valor = ANY (
        CASE e.numero_atomico
            WHEN 101 THEN ARRAY[2, 3]
            WHEN 102 THEN ARRAY[2, 3]
            WHEN 103 THEN ARRAY[3]
            WHEN 104 THEN ARRAY[4]
            WHEN 105 THEN ARRAY[5]
            WHEN 106 THEN ARRAY[6]
            WHEN 107 THEN ARRAY[7]
            WHEN 108 THEN ARRAY[8]
            WHEN 109 THEN ARRAY[1, 3]
            WHEN 110 THEN ARRAY[2, 4]
            WHEN 111 THEN ARRAY[1, 3]
            WHEN 112 THEN ARRAY[2]
            WHEN 113 THEN ARRAY[1, 3]
            WHEN 114 THEN ARRAY[2, 4]
            WHEN 115 THEN ARRAY[1, 3, 5]
            WHEN 116 THEN ARRAY[2, 4]
            WHEN 117 THEN ARRAY[-1, 1, 3, 5, 7]
            WHEN 118 THEN ARRAY[0]
        END
    )
WHERE e.numero_atomico BETWEEN 101 AND 118;
----------------------------------------------------
--Comprobamos
SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    STRING_AGG(
        eo.valor::TEXT,
        ', ' ORDER BY eo.valor
    ) AS estados_oxidacion
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eeo.id_estado_oxidacion = eo.id_estado_oxidacion
WHERE e.numero_atomico BETWEEN 101 AND 118
GROUP BY
    e.numero_atomico,
    e.simbolo,
    e.nombre
ORDER BY e.numero_atomico;

--fin es momento de auditar