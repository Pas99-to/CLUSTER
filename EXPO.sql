use autos
go

INSERT INTO cliente VALUES ('C500','Juan Perez','Guanajuato','M')
INSERT INTO cliente VALUES ('C600','Karla Escobedo','Jalisco','F')
INSERT INTO cliente VALUES ('C700','Osvaldo Gutierrez','Sinaloa','M')
INSERT INTO cliente VALUES ('C800','Jazmin Hernandez','Queretaro','F')
INSERT INTO cliente VALUES ('C900','Camila Araujo','Tabasco','F')
GO

SELECT * FROM dbo.cliente
go

---Borrro la clave primaria de Ventas 
ALTER TABLE dbo.cliente  
DROP CONSTRAINT pk_cliente;   
GO 

---Ver indices de una tabla
EXECUTE sp_helpindex cliente
go

---Crear un Indice agrupado en la tabla cliente con la columna nombre_C
---Se agrupen de forma ASC o DESC, por default los agripa de foma Ascendente
CREATE CLUSTERED INDEX NOMBRE_CLIENTE ON dbo.cliente (nombre_C);

SELECT * FROM dbo.cliente
go

---Borrar Indice Agrupado
DROP INDEX NOMBRE_CLIENTE   
    ON dbo.cliente;  
GO  

-----Indice no agrupado en la tabla cliente con la columna ciudad.

CREATE NONCLUSTERED INDEX  CIUDAD_CLIENTE  
    ON dbo.cliente (ciudad);   
GO  

SELECT * FROM dbo.cliente
go

---Borrar Indice no Agrupado
DROP INDEX CIUDAD_CLIENTE 
    ON dbo.cliente;  
GO 

UPDATE cliente
  SET ciudad='Zacatecas'
  WHERE ciudad='Guanajuato'
