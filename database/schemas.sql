CREATE TABLE elementos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero_atomico INT NOT NULL UNIQUE,
    simbolo VARCHAR(3) NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    masa_atomica DECIMAL(10,6),
    configuracion_electronica VARCHAR(30),
    electronegatividad DECIMAL(4,2),
    radio_atomico INT, -- en picómetros
    estado_oxidacion VARCHAR(20),
    año_descubrimiento INT
);

-- Categorías de elementos
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL UNIQUE, -- 'Metal alcalino', 'Gas noble', etc.
    descripcion TEXT
);

-- Estados de la materia
CREATE TABLE estados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL UNIQUE -- 'Sólido', 'Líquido', 'Gas', 'Desconocido'
);

-- Tipos de orbitales
CREATE TABLE bloques (
    id INT PRIMARY KEY AUTO_INCREMENT,
    letra CHAR(1) NOT NULL UNIQUE -- 's', 'p', 'd', 'f'
);

