INSERT INTO "Tabla_Elementos".elementos (
    numero_atomico,
    simbolo,
    nombre,
    masa_atomica,
    configuracion_electronica,
    electronegatividad,
    radio_atomico,
    año_descubrimiento,
    id_categoria,
    id_estado,
    id_bloque
)
VALUES
    (1,  'H',  'Hidrógeno', 1.008,   '1s1',             2.20,  37, 1766, 7, 3, 1),
    (2,  'He', 'Helio',     4.0026,  '1s2',             NULL,  32, 1868, 9, 3, 1),
    (3,  'Li', 'Litio',     6.94,    '[He] 2s1',       0.98, 152, 1817, 1, 3, 1),
    (4,  'Be', 'Berilio',   9.0122,  '[He] 2s2',       1.57, 112, 1798, 2, 3, 1),
    (5,  'B',  'Boro',      10.81,   '[He] 2s2 2p1',   2.04,  87, 1808, 6, 1, 2),
    (6,  'C',  'Carbono',   12.011,  '[He] 2s2 2p2',   2.55,  77, NULL, 7, 1, 2),
    (7,  'N',  'Nitrógeno', 14.007,  '[He] 2s2 2p3',   3.04,  75, 1772, 7, 3, 2),
    (8,  'O',  'Oxígeno',   15.999,  '[He] 2s2 2p4',   3.44,  73, 1774, 7, 3, 2),
    (9,  'F',  'Flúor',     18.998,  '[He] 2s2 2p5',   3.98,  72, 1886, 8, 3, 2),
    (10, 'Ne', 'Neón',      20.180,  '[He] 2s2 2p6',   NULL,  69, 1898, 9, 3, 2),

    (11, 'Na', 'Sodio',     22.990,  '[Ne] 3s1',       0.93, 186, 1807, 1, 1, 1),
    (12, 'Mg', 'Magnesio',  24.305,  '[Ne] 3s2',       1.31, 160, 1755, 2, 1, 1),
    (13, 'Al', 'Aluminio',  26.982,  '[Ne] 3s2 3p1',   1.61, 143, 1825, 6, 1, 2),
    (14, 'Si', 'Silicio',   28.085,  '[Ne] 3s2 3p2',   1.90, 118, 1824, 6, 1, 2),
    (15, 'P',  'Fósforo',   30.974,  '[Ne] 3s2 3p3',   2.19, 110, 1669, 7, 1, 2),
    (16, 'S',  'Azufre',    32.06,   '[Ne] 3s2 3p4',   2.58, 103, 1777, 7, 1, 2),
    (17, 'Cl', 'Cloro',     35.45,   '[Ne] 3s2 3p5',   3.16,  99, 1774, 8, 3, 2),
    (18, 'Ar', 'Argón',     39.948,  '[Ne] 3s2 3p6',   NULL,  97, 1894, 9, 3, 2),
    (19, 'K',  'Potasio',   39.0983, '[Ar] 4s1',       0.82, 227, 1807, 1, 1, 1),
    (20, 'Ca', 'Calcio',    40.078,  '[Ar] 4s2',       1.00, 197, 1808, 2, 1, 1);

---------------------------------------------------------------------------------
--Verificamos los datos agregados
SELECT
    numero_atomico,
    simbolo,
    nombre,
    id_categoria,
    id_estado,
    id_bloque
FROM "Tabla_Elementos".elementos
ORDER BY numero_atomico;

--Solicitamos el numero de filas
SELECT COUNT(*) AS total
FROM "Tabla_Elementos".elementos;

