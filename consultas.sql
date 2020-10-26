								#CONSULTAS SQL
								

#LISTADO DE TODOS LOS CLIENTES
SELECT* FROM clientes

#LISTADO DE PROVEEDORES CON: RAZÓN SOCIAL, NOMBRE Y TELÉFONOS

SELECT nombre_cont AS 'Nombre de Contacto', razsocial AS 'Razón Social', telproveedores.telefono AS 'Teléfono'
FROM proveedores LEFT JOIN telproveedores ON proveedores.nrorut=telproveedores.nrorut GROUP BY nombre_cont;
