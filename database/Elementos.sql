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

-- Para verificar bloques secciones especificas
SELECT
    numero_atomico,
    simbolo,
    nombre,
    id_categoria,
    id_estado,
    id_bloque
FROM "Tabla_Elementos".elementos
WHERE numero_atomico BETWEEN 81 AND 100 --solo se agrega un WHERE que indique desde que fila a que fila
ORDER BY numero_atomico;
----------------------------------------------------------------------------------
--Insertamos la siguiente tanda de datos

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
    (21, 'Sc', 'Escandio', 44.9559, '[Ar] 3d1 4s2', 1.36, 162, 1879, 3, 1, 3),
    (22, 'Ti', 'Titanio', 47.867, '[Ar] 3d2 4s2', 1.54, 147, 1791, 3, 1, 3),
    (23, 'V', 'Vanadio', 50.9415, '[Ar] 3d3 4s2', 1.63, 134, 1801, 3, 1, 3),
    (24, 'Cr', 'Cromo', 51.9961, '[Ar] 3d5 4s1', 1.66, 128, 1797, 3, 1, 3),
    (25, 'Mn', 'Manganeso', 54.9380, '[Ar] 3d5 4s2', 1.55, 127, 1774, 3, 1, 3),
    (26, 'Fe', 'Hierro', 55.845, '[Ar] 3d6 4s2', 1.83, 126, NULL, 3, 1, 3),
    (27, 'Co', 'Cobalto', 58.9332, '[Ar] 3d7 4s2', 1.88, 125, 1735, 3, 1, 3),
    (28, 'Ni', 'Níquel', 58.6934, '[Ar] 3d8 4s2', 1.91, 124, 1751, 3, 1, 3),
    (29, 'Cu', 'Cobre', 63.546, '[Ar] 3d10 4s1', 1.90, 128, NULL, 3, 1, 3),
    (30, 'Zn', 'Zinc', 65.38, '[Ar] 3d10 4s2', 1.65, 134, 1746, 3, 1, 3),
    (31, 'Ga', 'Galio', 69.723, '[Ar] 3d10 4s2 4p1', 1.81, 135, 1875, 6, 1, 2),
    (32, 'Ge', 'Germanio', 72.630, '[Ar] 3d10 4s2 4p2', 2.01, 122, 1886, 6, 1, 2),
    (33, 'As', 'Arsénico', 74.9216, '[Ar] 3d10 4s2 4p3', 2.18, 119, NULL, 6, 1, 2),
    (34, 'Se', 'Selenio', 78.971, '[Ar] 3d10 4s2 4p4', 2.55, 120, 1817, 7, 1, 2),
    (35, 'Br', 'Bromo', 79.904, '[Ar] 3d10 4s2 4p5', 2.96, 120, 1826, 8, 3, 2),
    (36, 'Kr', 'Criptón', 83.798, '[Ar] 3d10 4s2 4p6', 3.00, 116, 1898, 9, 3, 2),
    (37, 'Rb', 'Rubidio', 85.4678, '[Kr] 5s1', 0.82, 248, 1861, 1, 1, 1),
    (38, 'Sr', 'Estroncio', 87.62, '[Kr] 5s2', 0.95, 215, 1790, 2, 1, 1),
    (39, 'Y', 'Itrio', 88.9059, '[Kr] 4d1 5s2', 1.22, 180, 1794, 3, 1, 3),
    (40, 'Zr', 'Circonio', 91.224, '[Kr] 4d2 5s2', 1.33, 160, 1789, 3, 1, 3);

    -------------------------------------------------------------------------
    --Agregar el siguiente bloque de datos 41-60

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
    (41, 'Nb', 'Niobio', 92.9064, '[Kr] 4d4 5s1', 1.60, 146, 1801, 3, 1, 3),
    (42, 'Mo', 'Molibdeno', 95.95, '[Kr] 4d5 5s1', 2.16, 139, 1778, 3, 1, 3),
    (43, 'Tc', 'Tecnecio', 98.0, '[Kr] 4d5 5s2', 1.90, 136, 1937, 3, 1, 3),
    (44, 'Ru', 'Rutenio', 101.07, '[Kr] 4d7 5s1', 2.20, 134, 1844, 3, 1, 3),
    (45, 'Rh', 'Rodio', 102.9055, '[Kr] 4d8 5s1', 2.28, 134, 1803, 3, 1, 3),
    (46, 'Pd', 'Paladio', 106.42, '[Kr] 4d10', 2.20, 137, 1803, 3, 1, 3),
    (47, 'Ag', 'Plata', 107.8682, '[Kr] 4d10 5s1', 1.93, 144, NULL, 3, 1, 3),
    (48, 'Cd', 'Cadmio', 112.414, '[Kr] 4d10 5s2', 1.69, 151, 1817, 3, 1, 3),
    (49, 'In', 'Indio', 114.818, '[Kr] 4d10 5s2 5p1', 1.78, 167, 1863, 6, 1, 2),
    (50, 'Sn', 'Estaño', 118.710, '[Kr] 4d10 5s2 5p2', 1.96, 140, NULL, 6, 1, 2),
    (51, 'Sb', 'Antimonio', 121.760, '[Kr] 4d10 5s2 5p3', 2.05, 139, NULL, 6, 1, 2),
    (52, 'Te', 'Telurio', 127.60, '[Kr] 4d10 5s2 5p4', 2.10, 138, 1782, 6, 1, 2),
    (53, 'I', 'Yodo', 126.9045, '[Kr] 4d10 5s2 5p5', 2.66, 140, 1811, 8, 1, 2),
    (54, 'Xe', 'Xenón', 131.293, '[Kr] 4d10 5s2 5p6', 2.60, 140, 1898, 9, 3, 2),
    (55, 'Cs', 'Cesio', 132.9055, '[Xe] 6s1', 0.79, 265, 1860, 1, 1, 1),
    (56, 'Ba', 'Bario', 137.327, '[Xe] 6s2', 0.89, 222, 1808, 2, 1, 1),
    (57, 'La', 'Lantano', 138.9055, '[Xe] 5d1 6s2', 1.10, 187, 1839, 4, 1, 3),
    (58, 'Ce', 'Cerio', 140.116, '[Xe] 4f1 5d1 6s2', 1.12, 182, 1803, 4, 1, 4),
    (59, 'Pr', 'Praseodimio', 140.9077, '[Xe] 4f3 6s2', 1.13, 182, 1885, 4, 1, 4),
    (60, 'Nd', 'Neodimio', 144.242, '[Xe] 4f4 6s2', 1.14, 181, 1885, 4, 1, 4);
---------------------------------------------------
--Agregamos el siguiente bloque de 61-80

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
    (61, 'Pm', 'Prometio', 145.0, '[Xe] 4f5 6s2', NULL, 183, 1945, 4, 1, 4),
    (62, 'Sm', 'Samario', 150.36, '[Xe] 4f6 6s2', 1.17, 180, 1879, 4, 1, 4),
    (63, 'Eu', 'Europio', 151.964, '[Xe] 4f7 6s2', 1.20, 180, 1901, 4, 1, 4),
    (64, 'Gd', 'Gadolinio', 157.25, '[Xe] 4f7 5d1 6s2', 1.20, 180, 1880, 4, 1, 4),
    (65, 'Tb', 'Terbio', 158.9254, '[Xe] 4f9 6s2', 1.20, 177, 1843, 4, 1, 4),
    (66, 'Dy', 'Disprosio', 162.500, '[Xe] 4f10 6s2', 1.22, 178, 1886, 4, 1, 4),
    (67, 'Ho', 'Holmio', 164.9303, '[Xe] 4f11 6s2', 1.23, 176, 1878, 4, 1, 4),
    (68, 'Er', 'Erbio', 167.259, '[Xe] 4f12 6s2', 1.24, 176, 1843, 4, 1, 4),
    (69, 'Tm', 'Tulio', 168.9342, '[Xe] 4f13 6s2', 1.25, 175, 1879, 4, 1, 4),
    (70, 'Yb', 'Iterbio', 173.045, '[Xe] 4f14 6s2', 1.10, 194, 1878, 4, 1, 4),
    (71, 'Lu', 'Lutecio', 174.9668, '[Xe] 4f14 5d1 6s2', 1.27, 173, 1907, 4, 1, 4),
    (72, 'Hf', 'Hafnio', 178.49, '[Xe] 4f14 5d2 6s2', 1.30, 159, 1923, 3, 1, 3),
    (73, 'Ta', 'Tantalio', 180.9479, '[Xe] 4f14 5d3 6s2', 1.50, 146, 1802, 3, 1, 3),
    (74, 'W', 'Wolframio', 183.84, '[Xe] 4f14 5d4 6s2', 2.36, 139, 1783, 3, 1, 3),
    (75, 'Re', 'Renio', 186.207, '[Xe] 4f14 5d5 6s2', 1.90, 137, 1925, 3, 1, 3),
    (76, 'Os', 'Osmio', 190.23, '[Xe] 4f14 5d6 6s2', 2.20, 135, 1803, 3, 1, 3),
    (77, 'Ir', 'Iridio', 192.217, '[Xe] 4f14 5d7 6s2', 2.20, 136, 1803, 3, 1, 3),
    (78, 'Pt', 'Platino', 195.084, '[Xe] 4f14 5d9 6s1', 2.28, 139, 1735, 3, 1, 3),
    (79, 'Au', 'Oro', 196.9666, '[Xe] 4f14 5d10 6s1', 2.54, 144, NULL, 3, 1, 3),
    (80, 'Hg', 'Mercurio', 200.592, '[Xe] 4f14 5d10 6s2', 2.00, 151, NULL, 3, 2, 3);

---------------------------------------------------
--Agregamos el siguiente bloque de 81-100

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
    (81, 'Tl', 'Talio', 204.38, '[Xe] 4f14 5d10 6s2 6p1', 1.62, 170, 1861, 3, 1, 2),
    (82, 'Pb', 'Plomo', 207.2, '[Xe] 4f14 5d10 6s2 6p2', 2.33, 175, NULL, 3, 1, 2),
    (83, 'Bi', 'Bismuto', 208.9804, '[Xe] 4f14 5d10 6s2 6p3', 2.02, 160, 1753, 3, 1, 2),
    (84, 'Po', 'Polonio', 209.0, '[Xe] 4f14 5d10 6s2 6p4', 2.00, 190, 1898, 3, 1, 2),
    (85, 'At', 'Astato', 210.0, '[Xe] 4f14 5d10 6s2 6p5', 2.20, 202, 1940, 8, 1, 2),
    (86, 'Rn', 'Radón', 222.0, '[Xe] 4f14 5d10 6s2 6p6', NULL, 220, 1900, 9, 3, 2),
    (87, 'Fr', 'Francio', 223.0, '[Rn] 7s1', 0.70, 260, 1939, 1, 1, 1),
    (88, 'Ra', 'Radio', 226.0, '[Rn] 7s2', 0.90, 221, 1898, 2, 1, 1),
    (89, 'Ac', 'Actinio', 227.0, '[Rn] 6d1 7s2', 1.10, 195, 1899, 5, 1, 3),
    (90, 'Th', 'Torio', 232.0381, '[Rn] 6d2 7s2', 1.30, 180, 1828, 5, 1, 4),
    (91, 'Pa', 'Protactinio', 231.0359, '[Rn] 5f2 6d1 7s2', 1.50, 163, 1913, 5, 1, 4),
    (92, 'U', 'Uranio', 238.0289, '[Rn] 5f3 6d1 7s2', 1.38, 156, 1789, 5, 1, 4),
    (93, 'Np', 'Neptunio', 237.0, '[Rn] 5f4 6d1 7s2', 1.36, 155, 1940, 5, 1, 4),
    (94, 'Pu', 'Plutonio', 244.0, '[Rn] 5f6 7s2', 1.28, 159, 1940, 5, 1, 4),
    (95, 'Am', 'Americio', 243.0, '[Rn] 5f7 7s2', 1.13, 173, 1944, 5, 1, 4),
    (96, 'Cm', 'Curio', 247.0, '[Rn] 5f7 6d1 7s2', 1.28, 174, 1944, 5, 1, 4),
    (97, 'Bk', 'Berkelio', 247.0, '[Rn] 5f9 7s2', 1.30, 170, 1949, 5, 1, 4),
    (98, 'Cf', 'Californio', 251.0, '[Rn] 5f10 7s2', 1.30, 168, 1950, 5, 1, 4),
    (99, 'Es', 'Einsteinio', 252.0, '[Rn] 5f11 7s2', 1.30, 165, 1952, 5, 1, 4),
    (100, 'Fm', 'Fermio', 257.0, '[Rn] 5f12 7s2', 1.30, 167, 1952, 5, 1, 4);

---------------------------------------------------
--Agregamos el ultimo bloque del 101-118

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
    (101, 'Md', 'Mendelevio', 258.0, '[Rn] 5f13 7s2', 1.30, 173, 1955, 5, 1, 4),
    (102, 'No', 'Nobelio', 259.0, '[Rn] 5f14 7s2', 1.30, 176, 1958, 5, 1, 4),
    (103, 'Lr', 'Lawrencio', 266.0, '[Rn] 5f14 7s2 7p1', 1.30, 161, 1961, 5, 1, 4),
    (104, 'Rf', 'Rutherfordio', 267.0, '[Rn] 5f14 6d2 7s2', NULL, 157, 1969, 3, 1, 3),
    (105, 'Db', 'Dubnio', 268.0, '[Rn] 5f14 6d3 7s2', NULL, 149, 1970, 3, 1, 3),
    (106, 'Sg', 'Seaborgio', 269.0, '[Rn] 5f14 6d4 7s2', NULL, 143, 1974, 3, 1, 3),
    (107, 'Bh', 'Bohrio', 270.0, '[Rn] 5f14 6d5 7s2', NULL, 141, 1981, 3, 1, 3),
    (108, 'Hs', 'Hassio', 277.0, '[Rn] 5f14 6d6 7s2', NULL, 134, 1984, 3, 1, 3),
    (109, 'Mt', 'Meitnerio', 278.0, '[Rn] 5f14 6d7 7s2', NULL, 129, 1982, 3, 1, 3),
    (110, 'Ds', 'Darmstadtio', 281.0, '[Rn] 5f14 6d9 7s1', NULL, 128, 1994, 3, 1, 3),
    (111, 'Rg', 'Roentgenio', 282.0, '[Rn] 5f14 6d10 7s1', NULL, 121, 1994, 3, 1, 3),
    (112, 'Cn', 'Copernicio', 285.0, '[Rn] 5f14 6d10 7s2', NULL, 122, 1996, 3, 1, 3),
    (113, 'Nh', 'Nihonio', 286.0, '[Rn] 5f14 6d10 7s2 7p1', NULL, 136, 2004, 3, 1, 2),
    (114, 'Fl', 'Flerovio', 289.0, '[Rn] 5f14 6d10 7s2 7p2', NULL, 143, 1998, 3, 1, 2),
    (115, 'Mc', 'Moscovio', 290.0, '[Rn] 5f14 6d10 7s2 7p3', NULL, 162, 2003, 3, 1, 2),
    (116, 'Lv', 'Livermorio', 293.0, '[Rn] 5f14 6d10 7s2 7p4', NULL, 175, 2000, 3, 1, 2),
    (117, 'Ts', 'Teneso', 294.0, '[Rn] 5f14 6d10 7s2 7p5', NULL, 165, 2010, 8, 1, 2),
    (118, 'Og', 'Oganesón', 294.0, '[Rn] 5f14 6d10 7s2 7p6', NULL, 157, 2006, 9, 3, 2);

