
--CREAR BASE DE DATOS--

CREATE DATABASE elporvenir;


								--------------------------
								--CREACION DE LAS TABLAS--
								--------------------------

--CREAR TABLA CLIENTES--

CREATE TABLE clientes(
	cedula VARCHAR(15),
  	primnombre VARCHAR(20),
  	segnombre VARCHAR(20),
  	primapellido VARCHAR(20),
  	segapellido VARCHAR(20),
  	localidad VARCHAR(20),
  	calle VARCHAR(35),
  	nropuerta VARCHAR(15),

PRIMARY KEY (cedula)
);


--CREAR TABLA TELÉFONO DE CLIENTES--

CREATE TABLE telclientes(
	cedula VARCHAR(15),
  	telefono VARCHAR(35),

PRIMARY KEY (cedula, telefono),
CONSTRAINT fk_telclientes FOREIGN KEY (cedula) REFERENCES clientes(cedula)
);


--CREAR TABLA PRODUCTOS--

CREATE TABLE productos(
	codigo VARCHAR(20), 
	descripcion VARCHAR(100) NOT NULL,
	envase VARCHAR(10) NOT NULL,
	marca VARCHAR(25) NOT NULL,
    
PRIMARY KEY (codigo)
);





--CREAR TABLA PROVEEDORES--

CREATE TABLE proveedores(
	nrorut INTEGER,
	nombre_cont VARCHAR(20) NOT NULL,
	razsocial VARCHAR(25) NOT NULL,
	localidad VARCHAR(20) NOT NULL,
	calle VARCHAR(35) NOT NULL,
	nropuerta VARCHAR(15),
	correo VARCHAR(35),

PRIMARY KEY (nrorut)
);


--CREAR TABLA TELÉFONO DE PROVEEDORES--

CREATE TABLE telproveedores(
	nrorut INTEGER,
  	telefono VARCHAR(35),

PRIMARY KEY (nrorut, telefono),

CONSTRAINT fk_telproveedores FOREIGN KEY (nrorut) REFERENCES proveedores(nrorut)
);


--CREAR TABLA RELACIÓN PROVEE--

CREATE TABLE provee(

nrorut INTEGER,
    	codigo VARCHAR(20),
    	precio DECIMAL(10,2),
    
PRIMARY KEY (nrorut, codigo),
CONSTRAINT fk_proveenrut FOREIGN KEY (nrorut) REFERENCES proveedores(nrorut),
CONSTRAINT fk_proveencodigo FOREIGN KEY (codigo) REFERENCES productos(codigo)
);


--CREAR TABLA RELACIÓN COMPRA--

CREATE TABLE compra(
	cedula VARCHAR(15),
   	codigo VARCHAR(20),
    
PRIMARY KEY (cedula, codigo),

CONSTRAINT fk_compra1 FOREIGN KEY (cedula) REFERENCES clientes(cedula),
CONSTRAINT fk_compra2 FOREIGN KEY (codigo) REFERENCES productos(codigo)

);


								------------------------------
								-- INSERTAR DATOS DE PRUEBA --
								------------------------------

INSERT INTO clientes VALUES ('50740357', 'Sergio', 'Ramiro', 'Sosa', 'Cabrera', 'Pan de Azucar', 'San Carlos', 469), ('43403421', 'Hector', 'Nahuel', 'Blanco', 'Amarillo', 'Las Piedras', 'Canelones', 883), ('79932813', 'Maxi', 'Roberto', 'Martinez', 'Rodriguez', 'Las Piedras', 'Canelones', 721), ('85327649', 'Manuel', 'Vivia', 'Pozada', 'Vigliante', 'Maldonado Nuevo', 'Maldonado', 122), ('65437891', 'Paola', 'Martina', 'Grafo', 'Conexo', 'Marconi', 'Montevideo', 649);

INSERT INTO telclientes VALUES ('50740357', '093636815'), ('50740357', '093656555'), ('43403421', '094536246'), ('65437891', '099146855'), ('79932813', '091002835'), ('85327649', '09234555');

INSERT INTO productos VALUES ('1', 'Barra de Cereal', '60 G', 'Quaker'), ('2', 'CocaCola', '1 L Vidrio', 'Coke'), ('3', 'Chocolates', '100 G', 'KitKat'), ('4', 'Harina', '500 G', 'El Molino'), ('5', 'Leche', '1 L', 'Parmalat');

INSERT INTO proveedores VALUES (100, 'Hector', 'ProfeSA', 'Pan de Azucar', 'Calle1', 12, 'hector@gmail.com'), (101, 'Andrea', 'PanaderiaSA', 'San Carlos', 'Calle Francisco', 88, 'Andrea@hotmail.es'), (102, 'Nicolas', 'Copsa SA', 'Maldonado', 'Calle Dodera', 553, 'nicoelcapo@gmail.com'), (103, 'Marcos', 'Liceo4SA', 'Balneario BsAs', 'Calle 53 Esq. 20', 432, 'markitos@yahoo.com'), (104, 'Doris', 'DoriseriaSA', 'Ocean Park', 'Buscando Esq Nemo', 631, 'doriss@outlook.es');

INSERT INTO telproveedores VALUES (100, '092323357'), (100, '093227377'), (101, '+598 93638174'), (102, '093456782'), (103, '091327357'), (104, '099714452');

INSERT INTO provee VALUES (100, '1', 26.70), (102, '1', 25.70), (104, '3', 77), (104, '4', 120.25), (101, '3', 6.50), (103, '2', 88.65);

INSERT INTO compra VALUES ('50740357', '1'), ('43403421', '2'), ('43403421', '1'), ('43403421', '3'), ('85327649', '5'), ('65437891', '2'), ('85327649', '4'), ('85327649', '2'), ('79932813', '3');


								-------------------
								-- CONSULTAS SQL --
								-------------------

--LISTADO DE TODOS LOS CLIENTES--
SELECT* FROM clientes

--LISTADO DE PROVEEDORES CON: RAZÓN SOCIAL, NOMBRE Y TELÉFONOS--

SELECT nombre_cont AS 'Nombre de Contacto', razsocial AS 'Razón Social', telproveedores.telefono AS 'Teléfono'
FROM proveedores LEFT JOIN telproveedores ON proveedores.nrorut=telproveedores.nrorut; 	--GROUP BY nombre_cont;

