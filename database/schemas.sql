SET search_path TO Tabla_Elementos;
SHOW search_path;

SELECT schema_name
FROM information_schema.schemata;

CREATE TABLE "Tabla_Elementos".elementos(
	id_elemento SERIAL PRIMARY KEY ,
	numero_atomico INT NOT NULL UNIQUE,
	simbolo VARCHAR(3) NOT NULL UNIQUE,
	nombre VARCHAR(50) NOT NULL,
	masa_atomica DECIMAL(10, 6),
	configuracion_electronica VARCHAR(30),
	electronegatividad DECIMAL(4,2),
	radio_atomico INT,
	estado_oxidacion VARCHAR(20),
	año_descubrimiento INT
);

SELECT * FROM Tabla_Elementos.elementos;


-- Categorías de elementos
CREATE TABLE categorias (
    id PRIMARY KEY SERIAL,
    nombre VARCHAR(30) NOT NULL UNIQUE, -- 'Metal alcalino', 'Gas noble', etc.
    descripcion TEXT
);

-- Estados de la materia
CREATE TABLE estados (
    id PRIMARY KEY SERIAL,
    nombre VARCHAR(20) NOT NULL UNIQUE -- 'Sólido', 'Líquido', 'Gas', 'Desconocido'
);

-- Tipos de orbitales
CREATE TABLE bloques (
    id PRIMARY KEY SERIAL,
    letra CHAR(1) NOT NULL UNIQUE -- 's', 'p', 'd', 'f'
);

