--Elementos con estado
SELECT COUNT(DISTINCT id_elemento) AS elementos_con_estado
FROM "Tabla_Elementos".elemento_estado_oxidacion;

-------------------------------------------------
--Con mas de un estado
SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    COUNT(eeo.id_estado_oxidacion) AS cantidad_estados
FROM "Tabla_Elementos".elementos e
JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
GROUP BY
    e.numero_atomico,
    e.simbolo,
    e.nombre
ORDER BY e.numero_atomico;

-------------------------------------------------------
--Generamos tabla con los estados
SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre,
    STRING_AGG(
        eo.valor::TEXT,
        ', ' ORDER BY eo.valor
    ) AS estados_oxidacion
FROM "Tabla_Elementos".elementos e
LEFT JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
LEFT JOIN "Tabla_Elementos".estados_oxidacion eo
    ON eeo.id_estado_oxidacion = eo.id_estado_oxidacion
GROUP BY
    e.numero_atomico,
    e.simbolo,
    e.nombre
ORDER BY e.numero_atomico;

---------------------------------------------------
-- revison datos faltantes
SELECT COUNT(DISTINCT id_elemento) AS elementos_con_estado
FROM "Tabla_Elementos".elemento_estado_oxidacion;

----------------------------------------------------
-- Volvemos a pedir cuantos elementos tienes al menos un estado de oxidacion
SELECT
    e.numero_atomico,
    e.simbolo,
    e.nombre
FROM "Tabla_Elementos".elementos e
LEFT JOIN "Tabla_Elementos".elemento_estado_oxidacion eeo
    ON e.id_elemento = eeo.id_elemento
WHERE eeo.id_elemento IS NULL
ORDER BY e.numero_atomico;

---------------------------------------------------------
-- comprobamos que no tenemos relaciones duplicadas
SELECT
    id_elemento,
    id_estado_oxidacion,
    COUNT(*) AS cantidad
FROM "Tabla_Elementos".elemento_estado_oxidacion
GROUP BY id_elemento, id_estado_oxidacion
HAVING COUNT(*) > 1;