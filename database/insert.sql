-- Insertar categorías
INSERT INTO categorias (nombre) VALUES 
('Metal alcalino'),
('Gas noble'),
('No metal'),
('Metal de transición');

-- Insertar estados
INSERT INTO estados (nombre) VALUES 
('Sólido'), ('Líquido'), ('Gaseoso'), ('Desconocido');

-- Insertar elementos
INSERT INTO elementos (numero_atomico, simbolo, nombre, masa_atomica, 
                       categoria_id, estado_id, periodo, grupo) 
VALUES 
(1, 'H', 'Hidrógeno', 1.008, 3, 3, 1, 1),
(2, 'He', 'Helio', 4.0026, 2, 3, 1, 18),
(3, 'Li', 'Litio', 6.94, 1, 1, 2, 1);