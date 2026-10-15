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

