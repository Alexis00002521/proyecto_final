CREATE DATABASE databank_POO;
GO
USE dataBank_POO;
GO
-- DEFINICION DE TABLAS 

CREATE TABLE USUARIO(
	UsuarioID INT NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Ocupacion VARCHAR(50) NOT NULL,
	Direccion VARCHAR(50) NOT NULL,
	Institucion VARCHAR(50) NOT NULL,
	Telefono VARCHAR(12) NOT NULL,
	Fotografia IMAGE NOT NULL,
	Correo VARCHAR(50) NOT NULL,
		PRIMARY KEY (UsuarioID)
);
GO


CREATE TABLE INGRESOXUSUARIO(
	AreaID INT NOT NULL,
	UsuarioID INT NOT NULL,
	Fecha DATE NOT NULL,
	Hora TIME NOT NULL
);
GO

CREATE TABLE SALIDAXUSUARIO(
	AreaID INT NOT NULL,
	UsuarioID INT NOT NULL,
	Fecha DATE, 
	Hora TIME
);
GO


CREATE TABLE AREA(
	AreaID INT NOT NULL,
	Area VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(500) NOT NULL,
	HorarioID INT NOT NULL,
	ResponsableID INT NOT NULL,
		PRIMARY KEY (AreaID)
);




CREATE TABLE HORARIO(
	HorarioID INT NOT NULL,
	Apertura DATETIME NOT NULL,
	Cierre DATETIME NOT NULL,
	PRIMARY KEY (HorarioID)
);
CREATE TABLE RESPONSABLE(
	ResponsableID INT NOT NULL,
	Responsable VARCHAR(50) NOT NULL,
	Correo VARCHAR(50) NOT NULL,
	Clave CHAR(12) NOT NULL,
	PRIMARY KEY(ResponsableID)
	);

ALTER TABLE AREA ADD FOREIGN KEY (HorarioID) REFERENCES HORARIO(HorarioID);
ALTER TABLE AREA ADD FOREIGN KEY (ResponsableID) REFERENCES RESPONSABLE(ResponsableID);




CREATE TABLE EVENTO(
	EventoID INT NOT NULL,
	Titulo VARCHAR(30) NOT NULL,
	Imagen IMAGE NOT NULL,
	Objetivo VARCHAR(100) NOT NULL,
	Inicio DATETIME NOT NULL,
	Fin DATETIME NOT NULL,
	Asistentes INT NOT NULL,
	AreaID INT NOT NULL,
		PRIMARY KEY (EventoID)
);

ALTER TABLE EVENTO ADD FOREIGN KEY (AreaID) REFERENCES AREA(AreaID)

CREATE TABLE COLECCION(
	ColeccionID INT NOT NULL,
	ColeccionName VARCHAR(50) NOT NULL,
	TipoID INT NOT NULL,
	GeneroID INT NOT NULL,
		PRIMARY KEY (ColeccionID)
);
GO

CREATE TABLE TIPO(
	TipoID INT NOT NULL,
	Tipo VARCHAR(50) NOT NULL,
		PRIMARY KEY (TipoID)
);
GO

CREATE TABLE GENERO(
	GeneroID INT NOT NULL,
	Genero VARCHAR(30) NOT NULL,
		PRIMARY KEY (GeneroID)
);
GO

CREATE TABLE EJEMPLAR(
	ID INT NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Portada IMAGE NOT NULL,
	Publicacion DATETIME NOT NULL,
	EditorialID INT NOT NULL,
	ColeccionID INT NOT NULL,
	FormatoID INT NOT NULL,
	IdiomaID INT NOT NULL,
	EtiquetaID INT NOT NULL,
	Autor VARCHAR(50) NOT NULL,
		PRIMARY KEY (ID)
);
GO

CREATE TABLE EDITORIAL(
	ID INT NOT NULL,
	Editorial VARCHAR(50) NOT NULL,
		PRIMARY KEY (ID)
);
GO


CREATE TABLE FORMATO(
	ID INT NOT NULL,
	Formato VARCHAR(30) NOT NULL,
		PRIMARY KEY (ID)	
);
GO

CREATE TABLE ETIQUETA(
ID INT NOT NULL,
Etiqueta VARCHAR(50) NOT NULL,
	PRIMARY KEY(ID)
);
GO

CREATE TABLE IDIOMA(
	ID INT NOT NULL,
	Idioma VARCHAR(30) NOT NULL,
		PRIMARY KEY (ID)	
);
GO


CREATE TABLE PRESTAMOXEJEMPLAR(
	EjemplarID INT NOT NULL,
	UsuarioID INT NOT NULL,
	Prestamo DATETIME NOT NULL,
	Devolucion DATETIME NOT NULL
);
GO

CREATE TABLE RESERVAXEJEMPLAR(
	EjemplarID INT NOT NULL,
	UsuarioID INT NOT NULL,
	RESERVA DATETIME NOT NULL,
	DEVOLUCION DATETIME NOT NULL
);
GO

-- CREACION DE FK'S

-- INGRESOXUSUARIO

ALTER TABLE INGRESOXUSUARIO ADD CONSTRAINT pk_ingresoxusuario PRIMARY KEY (AreaID, UsuarioID);
ALTER TABLE INGRESOXUSUARIO ADD CONSTRAINT fk_id_area_ingreso FOREIGN KEY (AreaID) REFERENCES AREA (AreaID);
ALTER TABLE INGRESOXUSUARIO ADD CONSTRAINT fk_id_usuario_ingreso FOREIGN KEY (UsuarioID) REFERENCES USUARIO (UsuarioID);

-- SALIDAXUSUARIO

ALTER TABLE SALIDAXUSUARIO ADD CONSTRAINT pk_salidaxusuario PRIMARY KEY (AreaID, UsuarioID);
ALTER TABLE SALIDAXUSUARIO ADD CONSTRAINT fk_id_area_salida FOREIGN KEY (AreaID) REFERENCES AREA (AreaID);
ALTER TABLE SALIDAXUSUARIO ADD CONSTRAINT fk_id_usuario_salida FOREIGN KEY (UsuarioID) REFERENCES USUARIO (UsuarioID);

-- EVENTO
ALTER TABLE EVENTO ADD CONSTRAINT fk_id_area FOREIGN KEY (AreaID) REFERENCES AREA (AreaID);



-- PRESTAMOXEJEMPLAR
ALTER TABLE PRESTAMOXEJEMPLAR ADD PRIMARY KEY (EjemplarID, UsuarioID);
ALTER TABLE PRESTAMOXEJEMPLAR ADD FOREIGN KEY (EjemplarID) REFERENCES EJEMPLAR (ID);
ALTER TABLE PRESTAMOXEJEMPLAR ADD FOREIGN KEY (UsuarioID) REFERENCES USUARIO (UsuarioID);

-- RESERVAXEJEMPLAR --

ALTER TABLE RESERVAXEJEMPLAR ADD PRIMARY KEY(EjemplarID, UsuarioID);
ALTER TABLE RESERVAXEJEMPLAR ADD FOREIGN KEY (EjemplarID) REFERENCES EJEMPLAR (ID);
ALTER TABLE RESERVAXEJEMPLAR ADD FOREIGN KEY (UsuarioID) REFERENCES USUARIO (UsuarioID);

-- EJEMPLAR

ALTER TABLE EJEMPLAR ADD FOREIGN KEY (EditorialID) REFERENCES EDITORIAL(ID);
ALTER TABLE EJEMPLAR ADD FOREIGN KEY (ColeccionID) REFERENCES COLECCION (ColeccionID);
ALTER TABLE EJEMPLAR ADD FOREIGN KEY (FormatoID) REFERENCES FORMATO (ID);
ALTER TABLE EJEMPLAR ADD FOREIGN KEY (IdiomaID) REFERENCES IDIOMA (ID);
ALTER TABLE EJEMPLAR ADD FOREIGN KEY (EtiquetaID) REFERENCES ETIQUETA(ID);

--COLECCCION 
ALTER TABLE COLECCION ADD FOREIGN KEY (TipoID) REFERENCES TIPO(TipoID);
ALTER TABLE COLECCION ADD FOREIGN KEY (GeneroID) REFERENCES GENERO(GeneroID);



--------------insertar datos ---------------------------





INSERT INTO HORARIO(HorarioID, Apertura, Cierre) VALUES
(1, CAST('8:00:00' as time(0)), CAST('17:30:00' as time(0)));
INSERT INTO HORARIO(HorarioID, Apertura, Cierre) VALUES
(2, CAST('8:00:00' as time(0)), CAST('12:00:00' as time(0)));
INSERT INTO HORARIO(HorarioID, Apertura, Cierre) VALUES
(3, CAST('12:00:00' as time(0)), CAST('17:30:00' as time(0)));
INSERT INTO HORARIO(HorarioID, Apertura, Cierre) VALUES
(4, CAST('10:00:00' as time(0)), CAST('17:30:00' as time(0)));
INSERT INTO HORARIO(HorarioID, Apertura, Cierre) VALUES
(5, CAST('8:00:00' as time(0)), CAST('20:00:00' as time(0)));


INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (1, 'Ana Mar�a Beltr�n', 'ana.marbe@binaes.es','anb2022bin25');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (2, 'Jos� Rodolfo Qui�onez', 'jose.rodqu@binaes.es','jfq2022bin24');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (3, 'Pablo Antonio L�pez', 'pablo.antlo@binaes.es','pal2022bin23');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (4, 'Dinora Esmeralda Cruz', 'dinora.esmcr@binaes.es','dec2022bin22');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (5, 'Luis Fernando Rivas', 'luis.ferri@binaes.es','lfr2022bin21');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (6, 'Marta Julia P�rez', 'marta.julpe@binaes.es','mjp2022bin20');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (7, 'Fernanda Isabel Rojas', 'fernanda.isaro@binaes.es','fir2022bin19');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (8, 'Julio Alberto Mercado', 'julio.albme@binaes.es','jam2022bin18');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (9, 'Miguel Antonio Cruz', 'miguel.antcr@binaes.es','mac2022bin17');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (10, 'Blanca Maritza Cornejo', 'blanca.marco@binaes.es','bmc2022bin16');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (11, 'Kenia Rosibel V�squez', 'kenia.rosva@binaes.es','krv2022bin15');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (12, 'Lizardo Ernesto Torres', 'lizardo.ernto@binaes.es','let2022bin14');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (13, 'Rosa Mar�a Fern�ndez', 'rosa.marfe@binaes.es','rmf2022bin13');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (14, 'Ernesto Antonio Campos', 'ernesto.antca@binaes.es','eac2022bin12');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (15, 'Jefferson Miguel Ruiz', 'jefferson.migru@binaes.es','jmr2022bin11');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (16, 'Luis Alonso Morales', 'luis.alomo@binaes.es','lam2022bin10');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (17, 'Janeth Marisela Aldana', 'janeth.maral@binaes.es','jma2022bin09');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (18, 'Pamela Soto', 'pam.sot@binaes.es','pso2022bin08');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (19, 'Kevin Alexander Turcios', 'kevin.aletu@binaes.es','kat2022bin07');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (20, 'Alexandra Sol�rzano', 'alexandra.sol@binaes.es','aso2022bin06');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (21, 'Alejandra Mart�nez', 'alejandra.mar@binaes.es','alm2022bin05');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (22, 'Marcela Ocampo', 'marcela.ocamp@binaes.es','mao2022bin04');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (23, 'Ezequiel Maldonado', 'ezequiel.mald@binaes.es','ezm2022bin03');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (24, 'Andy Garc�a', 'andy.gar@binaes.es','ang2022bin02');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (25, 'Vanessa Sara� Acevedo', 'vanessa.sar@binaes.es','vsa2022bin01');
INSERT INTO RESPONSABLE (ResponsableID, Responsable, Correo, Clave) VALUES (26, 'Lucrecia Coronado', 'vanessa.sar@binaes.es','vsa2022bin26');


INSERT INTO EDITORIAL(ID, Editorial) VALUES(1,'Planeta');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(2,'Santillana');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(3,'Alfaguara');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(4,'Lumen');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(5,'Simon and Schuster');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(6,'Grijalbo');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(7,'Alianza Editorial');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(8,'Suma de Letras');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(9,'Salamandra');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(10,'Edisal');
INSERT INTO EDITORIAL(ID, Editorial) VALUES(11,'La Ceiba');


INSERT INTO FORMATO(ID, Formato) VALUES(1, 'F�sico');
INSERT INTO FORMATO(ID, Formato) VALUES(2, 'Electr�nico');


INSERT INTO ETIQUETA(ID, Etiqueta) VALUES (1, 'ASIN');
INSERT INTO ETIQUETA(ID, Etiqueta) VALUES (2, 'ISMN');
INSERT INTO ETIQUETA(ID, Etiqueta) VALUES (3, 'ISAN');
INSERT INTO ETIQUETA(ID, Etiqueta) VALUES (4, 'ISNN');
INSERT INTO ETIQUETA(ID, Etiqueta) VALUES (5, 'IBSN');




INSERT INTO IDIOMA(ID, Idioma) VALUES(1,'Chino');
INSERT INTO IDIOMA(ID, Idioma) VALUES(2,'Espa�ol');
INSERT INTO IDIOMA(ID, Idioma) VALUES(3,'Ingl�s');
INSERT INTO IDIOMA(ID, Idioma) VALUES(4,'�rabe');
INSERT INTO IDIOMA(ID, Idioma) VALUES(5,'Hind�');
INSERT INTO IDIOMA(ID, Idioma) VALUES(6,'Bengal�');
INSERT INTO IDIOMA(ID, Idioma) VALUES(7,'Portugu�s');
INSERT INTO IDIOMA(ID, Idioma) VALUES(8,'Ruso');
INSERT INTO IDIOMA(ID, Idioma) VALUES(9,'Japon�s');
INSERT INTO IDIOMA(ID, Idioma) VALUES(10,'Alem�n');


INSERT INTO GENERO (GeneroID, Genero) VALUES (1 , 'Literatura');
INSERT INTO GENERO (GeneroID, Genero) VALUES (2 , 'Aventura');
INSERT INTO GENERO (GeneroID, Genero) VALUES (3 , 'T�tulos Infantiles');
INSERT INTO GENERO (GeneroID, Genero) VALUES (4 , 'Ciencias Naturales');
INSERT INTO GENERO (GeneroID, Genero) VALUES (5 , 'Ciencias Sociales');
INSERT INTO GENERO (GeneroID, Genero) VALUES (6 , 'Historia');
INSERT INTO GENERO (GeneroID, Genero) VALUES (7 , 'Econom�a y finanzas');
INSERT INTO GENERO (GeneroID, Genero) VALUES (8 , 'Enciclopedias');
INSERT INTO GENERO (GeneroID, Genero) VALUES (9 , 'Terror');
INSERT INTO GENERO (GeneroID, Genero) VALUES (10 , 'Salud');
INSERT INTO GENERO (GeneroID, Genero) VALUES (11, 'Espiritualidad');
INSERT INTO GENERO (GeneroID, Genero) VALUES (12, 'Trabajos de Investigaci�n');
INSERT INTO GENERO (GeneroID, Genero) VALUES (13, 'Desarrollo personal');
INSERT INTO GENERO (GeneroID, Genero) VALUES (14, 'Artistas Salvadore�os');
INSERT INTO GENERO (GeneroID, Genero) VALUES (15, 'L�rica');

INSERT INTO TIPO (TipoID, Tipo) VALUES (1, 'Monograf�as');
INSERT INTO TIPO (TipoID, Tipo) VALUES (2, 'Aprendizaje');
INSERT INTO TIPO (TipoID, Tipo) VALUES (3, 'Antiguedades');
INSERT INTO TIPO (TipoID, Tipo) VALUES (4, 'Revistas');
INSERT INTO TIPO (TipoID, Tipo) VALUES (5, 'Hemeroteca');
INSERT INTO TIPO (TipoID, Tipo) VALUES (6, 'Talento Salvadore�o');
INSERT INTO TIPO (TipoID, Tipo) VALUES (7, 'Tecnolog�a');
INSERT INTO TIPO (TipoID, Tipo) VALUES (8, 'Vanguardia');
INSERT INTO TIPO (TipoID, Tipo) VALUES (9, 'Impresas');
INSERT INTO TIPO (TipoID, Tipo) VALUES (10, 'Libros Electr�nicos');
INSERT INTO TIPO (TipoID, Tipo) VALUES (11, 'Mapas');
INSERT INTO TIPO (TipoID, Tipo) VALUES (12, 'Filmoteca');
INSERT INTO TIPO (TipoID, Tipo) VALUES (13, 'Colecci�n de Prensa');
INSERT INTO TIPO (TipoID, Tipo) VALUES (14, 'Colecci�n de Juegos');
INSERT INTO TIPO (TipoID, Tipo) VALUES (15, 'Idiomas');


INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(26, 'Sal�n L�dico 1', 'Sal�n de Juegos y Recreaci�n P01',1 ,26 );
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(1, 'Sal�n L�dico 2', 'Sal�n de Juegos y Recreaci�n P02', 2,25 );
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(2, 'Auditorium', 'Actividades diversas P01', 2,24 );
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(3, 'Sala de Proyecci�n 1', 'Presentaciones Audiovisuales P02',4 , 23);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(4, 'Sala de Proyecci�n 2', 'Presentaciones Audiovisuales P03', 4, 22);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(5, 'Sala de Proyecci�n 3', 'Presentaciones Audiovisuales P04', 4,21 );
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(6, '�rea de C�mputo 1A', 'Tecnolog�a e Informaci�n P01', 4,20 );
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(7, '�rea de C�mputo 1B', 'Tecnolog�a e Informaci�n P01',4 , 19);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(8, '�rea de C�mputo 2A', 'Tecnolog�a e Informaci�n P02', 2,18);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(9, '�rea de C�mputo 2B', 'Tecnolog�a e Informaci�n P02', 2, 17);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(10, '�rea de C�mputo 3A', 'Tecnolog�a e Informaci�n P03', 3,16);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(11, '�rea de C�mputo 3B', 'Tecnolog�a e Informaci�n P03', 3 , 15);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(12, '�rea de C�mputo 4A', 'Tecnolog�a e Informaci�n P04',1 , 14);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(13, '�rea de C�mputo 4B', 'Tecnolog�a e Informaci�n P04', 1,13);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(14, '�rea de Promoci�n de Inclusi�n 1A', 'Bienestar Social P01',1, 12);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(15, '�rea de Promoci�n de Inclusi�n 1B', 'Bienestar Social P01', 1,11 );
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(16, 'Sala de Investigaci�n 4A', 'Bibliograf�as, Referencias, Tesis P04',2 , 10);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(17, 'Sala de Investigaci�n 4B', 'Bibliograf�as, Referencias, Tesis P04', 2, 9);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(18, '�rea de Biblioteca 1A', 'Pr�stamos y Reservas de Libro P01', 4, 8);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(19, '�rea de Biblioteca 1B', 'Pr�stamos y Reservas de Libro P01', 4, 7);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(20, '�rea de Biblioteca 2A', 'Pr�stamos y Reservas de Libro P02', 5, 6);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(21, '�rea de Biblioteca 2B', 'Pr�stamos y Reservas de Libro P02', 5, 5);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(22, '�rea de Biblioteca 3A', 'Pr�stamos y Reservas de Libro P03', 3, 4);
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(23, '�rea de Biblioteca 3B', 'Pr�stamos y Reservas de Libro P03', 3,3 );
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(24, '�rea de Biblioteca 4A', 'Pr�stamos y Reservas de Libro P04', 2,2 );
INSERT INTO AREA(AreaID, Area, Descripcion, HorarioID, ResponsableID) VALUES(25, '�rea de Biblioteca 4B', 'Pr�stamos y Reservas de Libro P04', 2,1 );