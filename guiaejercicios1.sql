--1. Cree una base de datos con los valores por defecto de crecimiento, ubicación de
--archivos, etc. Llame a la misma con su nombre o el de su grupo

create database grupo7

--2. Cree un esquema denominado “ddbba” (por bases de datos aplicada). Todos los
--objetos que cree a partir de aquí deberán pertenecer a este esquema o a otro según
--corresponda. No debe usar el esquema default (dbo).

create schema ddbba

--3. Cree una tabla llamada “registro” que tenga los siguientes campos: id entero
--autoincremental como primary key; fecha y hora con valor default del momento de
--inserción, texto con un tamaño máximo de 50 caracteres, modulo con un tamaño
--máximo de 10 caracteres. Esta tabla la empleará como bitácora (log) de las
--operaciones de los puntos siguientes.

create table ddbba.registro (
	id int identity(1,1) primary key,
	fechaHora datetime default getdate(),
	texto char(50),
	modulo char(10),
	);
	
	--para probar que la tabla estaba bien--
--insert into ddbba.registro (texto,modulo) 
--values ('hola','holi');

--select * from ddbba.registro;

--drop table ddbba.registro;
       -------------------------

--4. Cree un SP llamado “insertarLog” que reciba dos parámetros: modulo y texto. Si el
--modulo llega en blanco debe utilizar el texto “N/A”. Este SP insertará registros en la
--tabla de bitácora. A partir del siguiente punto, cada inserción, borrado, modificación,
--debe crear un registro en la mencionada tabla. En ningún caso debe realizar
--INSERTs por fuera del SP insertarLog.

create procedure ddbba.insertarLog (@texto char(50), @modulo char(10)) as
	BEGIN--{
	 if @modulo is null or @modulo =' '
		insert into ddbba.registro (texto,modulo) values (@texto,'N/A')
	else
		insert into ddbba.registro (texto,modulo) values (@texto,@modulo)
	END; --}

--drop procedure ddbba.insertarLog;


