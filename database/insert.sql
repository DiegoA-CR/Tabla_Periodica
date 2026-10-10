-- Insertar categorías
INSERT INTO "Tabla_Elementos".categorias (nombre) VALUES 
	('Metal alcalino'),
    ('Metal alcalinotérreo'),
    ('Metal de transición'),
    ('Lantánido'),
    ('Actínido'),
    ('Metaloide'),
    ('No metal'),
    ('Halógeno'),
    ('Gas noble');

-- Insertar estados
INSERT INTO "Tabla_Elementos".estados (nombre) VALUES 
('Sólido'), ('Líquido'), ('Gaseoso'), ('Desconocido');

-- Vamos a modificar la estructura de la DB

modificación de tabla
------------------------------------------------------
-- agegamos las letras de los elementos
INSERT INTO "Tabla_Elementos".bloques (letra)
VALUES
    ('s'),
    ('p'),
    ('d'),
    ('f');
-- verificamos los valores agregados 
SELECT *
FROM "Tabla_Elementos".bloques
ORDER BY id;

------------------------------------------------------

ALTER TABLE "Tabla_Elementos".elementos
ADD COLUMN id_categoria INT,
ADD COLUMN id_estado INT,
ADD COLUMN id_bloque INT;

------------------------------------------------------
ALTER TABLE "Tabla_Elementos".elementos
ADD COLUMN id_categoria INT,
ADD COLUMN id_estado INT,
ADD COLUMN id_bloque INT;

------------------------------------------------------
ALTER TABLE "Tabla_Elementos".elementos
ADD CONSTRAINT fk_elementos_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES "Tabla_Elementos".categorias(id),

ADD CONSTRAINT fk_elementos_estado
    FOREIGN KEY (id_estado)
    REFERENCES "Tabla_Elementos".estados(id),

ADD CONSTRAINT fk_elementos_bloque
    FOREIGN KEY (id_bloque)
    REFERENCES "Tabla_Elementos".bloques(id);

-- comprobamos los cambios

SELECT
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns
WHERE table_schema = 'Tabla_Elementos'
  AND table_name = 'elementos'
ORDER BY ordinal_position;

-- comprobamos claves foraneas

SELECT
    constraint_name,
    constraint_type
FROM information_schema.table_constraints
WHERE table_schema = 'Tabla_Elementos'
  AND table_name = 'elementos'
ORDER BY constraint_type, constraint_name;
-------------------------------------------------
----------------------------------------------------
--creamos una tabla para los estados de oxidacion

CREATE TABLE "Tabla_Elementos".estados_oxidacion (
    id_estado_oxidacion SERIAL PRIMARY KEY,
    valor INT NOT NULL UNIQUE
);
--creamos una tabla intermedia

CREATE TABLE "Tabla_Elementos".elemento_estado_oxidacion (
    id_elemento INT NOT NULL,
    id_estado_oxidacion INT NOT NULL,

    PRIMARY KEY (id_"bloques"
"categorias"
"elemento_estado_oxidacion"
"elementos"
"estados"
"estados_oxidacion"elemento, id_estado_oxidacion),

    FOREIGN KEY (id_elemento)
        REFERENCES "Tabla_Elementos".elementos(id_elemento),

    FOREIGN KEY (id_estado_oxidacion)
        REFERENCES "Tabla_Elementos".estados_oxidacion(id_estado_oxidacion)
);
------------------------------------------
--eliminamos la columna de estado de oxidacion antigua
ALTER TABLE "Tabla_Elementos".elementos
DROP COLUMN estado_oxidacion;
-----------------------------------------
--comprobamos
SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'Tabla_Elementos'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
