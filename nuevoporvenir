
CREATE DATABASE elporvenir;


CREATE TABLE clientes(

	cedula VARCHAR(15),
  	primnombre VARCHAR(20),
  	segnombre VARCHAR(20),
  	primapellido VARCHAR(20),
  	segapellido VARCHAR(20),
  	localidad VARCHAR(20),
  	calle VARCHAR(20),
  	nropuerta VARCHAR(15),

 	PRIMARY KEY (cedula)
)
INSERT INTO clientes VALUES (50740357, 'Sergio', 'Ramiro', 'Sosa', 'Cabrera', 'Pan de Azucar', 'San Carlos', 469)

CREATE TABLE telclientes(
	cedula VARCHAR(15),
  	telefono VARCHAR(35),

  	PRIMARY KEY (cedula, telefono),
  	CONSTRAINT fk_telclientes FOREIGN KEY (cedula) REFERENCES clientes(cedula)
)
INSERT INTO telclientes VALUES (50740357, '093636815');

CREATE TABLE productos(

codigo VARCHAR(20), 
descripcion VARCHAR(100) NOT NULL,
envase VARCHAR(10) NOT NULL,
marca VARCHAR(25) NOT NULL,
    
PRIMARY KEY (codigo)
)
INSERT INTO productos VALUES (1, 'CocaCola', 555, 'Coke')
INSERT INTO productos VALUES (2, 'Fanta', 234, 'Fantasmas')

CREATE TABLE proveedores(

nrorut INTEGER,
nombre_cont VARCHAR(20) NOT NULL,
razsocial VARCHAR(25) NOT NULL,
localidad VARCHAR(20) NOT NULL,
calle VARCHAR(20) NOT NULL,
nropuerta VARCHAR(15),
correo VARCHAR(20),

PRIMARY KEY (nrorut)

)
INSERT INTO proveedores VALUES (123, 'Hector', 'ProfeSA', 'Pan de Azucar', 'Calle1', 12, 'hola@gmail.com')

CREATE TABLE telproveedores(
	nrorut INTEGER,
  	telefono VARCHAR(35),

PRIMARY KEY (nrorut, telefono),

CONSTRAINT fk_telproveedores FOREIGN KEY (nrorut) REFERENCES proveedores(nrorut)

)

INSERT INTO telproveedores VALUES (123, '09232335');

CREATE TABLE provee(

nrorut INTEGER,
    	codigo VARCHAR(20),
    	precio DECIMAL(10,2),
    
 PRIMARY KEY (nrorut, codigo),
 CONSTRAINT fk_proveenrut FOREIGN KEY (nrorut) REFERENCES proveedores(nrorut),
 CONSTRAINT fk_proveencodigo FOREIGN KEY (codigo) REFERENCES productos(codigo)

)

INSERT INTO provee VALUES (123, 5, 100) caso que no funciona porque el producto no existe.

CREATE TABLE compra(

cedula VARCHAR(15),
   	codigo VARCHAR(20),
    
PRIMARY KEY (cedula, codigo),

CONSTRAINT fk_compra1 FOREIGN KEY (cedula) REFERENCES clientes(cedula),
CONSTRAINT fk_compra2 FOREIGN KEY (codigo) REFERENCES productos(codigo)

)

SELECT* FROM clientes

SELECT proveedores.nombre_cont, proveedores.razsocial, telproveedores.telefono
FROM proveedores
INNER JOIN telproveedores ON proveedores.nrorut=telproveedores.nrorut;
