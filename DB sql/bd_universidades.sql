
ALTER DATABASE database_name SET datestyle TO "ISO, DMY";

CREATE TABLE Asignatura (
  IdAsignatura int NOT NULL,
  IdNivelPensum int NOT NULL,
  Nombre varchar(40),
  Creditos int NOT NULL,
  AreaConocimientos varchar (40),
  HoraSemestrePresencial int NOT NULL,
  HoraSemestreTrabajoIndepen int NOT NULL
) ;


CREATE TABLE Divicion (
  IdDivicion int NOT NULL,
  IdSeccional int NOT NULL,
  NombreDivicion varchar(40) ,
  DecanoDivicion varchar(40) ,
  Direccion varchar(30) 
) ;


CREATE TABLE EstudiantePrograma (
  IdEstudiantePrograma int NOT NULL,
  IdPersona int NOT NULL,
  IdPrograma int NOT NULL,
  CodEstudiante int NOT NULL,
  IdPensum int NOT NULL
) ;

CREATE TABLE Facultad (
  IdFacultad int NOT NULL,
  IdDivicion int NOT NULL,
  NombreFacultad varchar(30),
  Decano varchar(30) ,
  Telefono varchar(30) 
) ;



CREATE TABLE Grupo (
  IdGrupo int NOT NULL,
  IdAsignatura int NOT NULL,
  CodDocente int NOT NULL
) ;




CREATE TABLE Nivel (
  IdNivelPensum int NOT NULL,
  Nivel int NOT NULL,
  IdPensum int NOT NULL
) ;



CREATE TABLE Pensum (
  IdPensum int NOT NULL,
  IdPrograma int NOT NULL,
  Activo varchar(20) ,
  Oferta varchar(20)NOT NULL
) ;




CREATE TABLE Persona (
  IdPersona int NOT NULL,
  NumDocumento int NOT NULL,
  LugarExpedicion varchar(30) ,
  FechaExpedicion varchar(30),
  Nombres varchar(40) ,
  Apellidos varchar(30) ,
  Celular int NOT NULL
) ;

CREATE TABLE Docente (

  coddocente int NOT NULL,
  IdPersona int NOT NULL,
  area varchar (30)
) ;


CREATE TABLE Programa (
  IdPrograma int NOT NULL,
  IdFacultad int NOT NULL,
  NombrePrograma varchar(40) ,
  MODALIDAD varchar(20) ,
  Activo varchar(30) NOT NULL
) ;



CREATE TABLE Seccional (
  IdSeccional int NOT NULL,
  Nombre varchar(40) ,
  CIUDAD varchar(40) ,
  Direccion varchar(40) ,
  Telefono int NOT NULL,
  RECTOR varchar(40) NOT NULL
) ;

CREATE TABLE Sede (
  IdSede int NOT NULL,
  IdSeccional int NOT NULL,
  NombreSede text ,
  Direccion int NOT NULL,
  CIUDAD varchar(30) 
) ;

ALTER TABLE Asignatura ADD PRIMARY KEY (IdAsignatura);

ALTER TABLE Divicion ADD PRIMARY KEY (IdDivicion);


ALTER TABLE EstudiantePrograma  ADD PRIMARY KEY (IdEstudiantePrograma);

ALTER TABLE Facultad  ADD PRIMARY KEY (IdFacultad);
  
ALTER TABLE Grupo  ADD PRIMARY KEY (IdGrupo);

ALTER TABLE Nivel  ADD PRIMARY KEY (IdNivelPensum);


ALTER TABLE Pensum  ADD PRIMARY KEY (IdPensum);


ALTER TABLE Persona  ADD PRIMARY KEY (IdPersona);

ALTER TABLE Programa  ADD PRIMARY KEY (IdPrograma);

ALTER TABLE Seccional  ADD PRIMARY KEY (IdSeccional);


ALTER TABLE Sede  ADD PRIMARY KEY (IdSede);

ALTER TABLE docente  ADD PRIMARY KEY (coddocente);


ALTER TABLE docente  ADD CONSTRAINT Fk_IdNivelPensum FOREIGN KEY (idpersona) REFERENCES persona (idpersona) ON UPDATE CASCADE;

ALTER TABLE Asignatura
  ADD CONSTRAINT Fk_IdNivelPensum FOREIGN KEY (IdNivelPensum) REFERENCES Nivel (IdNivelPensum) ON UPDATE CASCADE;


ALTER TABLE Divicion  ADD CONSTRAINT Fk_Divicion FOREIGN KEY (IdSeccional) REFERENCES Seccional (IdSeccional);

ALTER TABLE EstudiantePrograma
  ADD CONSTRAINT Fk_est_programa FOREIGN KEY (IdPrograma) REFERENCES programa (IdPrograma) ON UPDATE CASCADE,
  ADD CONSTRAINT Fk_estud_Pensum FOREIGN KEY (IdPensum) REFERENCES Pensum (IdPensum) ON UPDATE CASCADE;


ALTER TABLE Facultad  ADD CONSTRAINT Fk_Divicion_Facultad FOREIGN KEY (IdDivicion) REFERENCES Divicion (IdDivicion);


ALTER TABLE Grupo  ADD CONSTRAINT Fk_IdAsignatura FOREIGN KEY (IdAsignatura) REFERENCES Asignatura (IdAsignatura) ON UPDATE CASCADE;


ALTER TABLE Nivel  ADD CONSTRAINT Fk_id_pens FOREIGN KEY (IdPensum) REFERENCES Pensum (IdPensum) ON UPDATE CASCADE;

ALTER TABLE programa  ADD CONSTRAINT Fk_programa_Facultad FOREIGN KEY (IdFacultad) REFERENCES Facultad (IdFacultad);

ALTER TABLE Sede  ADD CONSTRAINT FK_Seccional FOREIGN KEY (IdSeccional) REFERENCES Seccional (IdSeccional) ON UPDATE CASCADE;
COMMIT;

ALTER TABLE grupo  ADD CONSTRAINT Fk_IdGrupoDocente FOREIGN KEY (coddocente) REFERENCES docente (coddocente) ON UPDATE CASCADE;

ALTER TABLE estudianteprograma   ADD CONSTRAINT Fk_Idestuproper FOREIGN KEY (idpersona) REFERENCES persona (idpersona) ON UPDATE CASCADE;
  
ALTER TABLE pensum   ADD CONSTRAINT Fk_Idpensumprogram FOREIGN KEY (idprograma) REFERENCES programa (idprograma) ON UPDATE CASCADE;

