-- Generado por Oracle SQL Developer Data Modeler 17.4.0.355.2121
--   en:        2019-10-30 13:40:20 CET
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE cita (
    paciente_dni           VARCHAR(50) NOT NULL,
    paciente_nss           VARCHAR(100) NOT NULL,
    medico_num_colegiado   INTEGER NOT NULL,
    num_expediente         INTEGER NOT NULL,
    fecha                  DATE,
    hora                   time
)
    ON "default" ;

ALTER TABLE cita ADD constraint cita_pk PRIMARY KEY CLUSTERED (Paciente_DNI, Paciente_NSS, Medico_num_colegiado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

CREATE TABLE hospital (
    id_hospital     INTEGER NOT NULL,
    nombre          VARCHAR(100) NOT NULL,
    direccion       VARCHAR(200),
    localidad       VARCHAR(100),
    provincia       VARCHAR(100),
    codigo_postal   INTEGER,
    telefono        INTEGER,
    email           VARCHAR(100)
)
    ON "default" ;

ALTER TABLE Hospital ADD constraint hospital_pk PRIMARY KEY CLUSTERED (id_hospital, nombre)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

CREATE TABLE involucra (
    tratamiento_id   INTEGER NOT NULL,
    medicamento_id   INTEGER NOT NULL,
    cantidad         FLOAT,
    frecuencia       VARCHAR(100)
)
    ON "default" ;

ALTER TABLE involucra ADD constraint involucra_pk PRIMARY KEY CLUSTERED (Tratamiento_id, Medicamento_id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

CREATE TABLE medicamento (
    id             INTEGER NOT NULL,
    nombre         VARCHAR(100),
    composicion    VARCHAR(200),
    farmaceutica   VARCHAR(100)
)
    ON "default" ;

ALTER TABLE Medicamento ADD constraint medicamento_pk PRIMARY KEY CLUSTERED (id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

CREATE TABLE medico (
    num_colegiado   INTEGER NOT NULL,
    nombre          VARCHAR(100),
    apellidos       VARCHAR(100),
    especialidad    VARCHAR(100),
    telefono        INTEGER,
    email           VARCHAR(100)
)
    ON "default" ;

ALTER TABLE Medico ADD constraint medico_pk PRIMARY KEY CLUSTERED (num_colegiado)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

CREATE TABLE paciente (
    dni                VARCHAR(50) NOT NULL,
    nss                VARCHAR(100) NOT NULL,
    nombre             VARCHAR(50),
    apellido           VARCHAR(50),
    direccion          VARCHAR(100),
    codigo_postal      INTEGER,
    telefono           INTEGER,
    fecha_nacimiento   DATE,
    localidad          VARCHAR(100),
    provincia          VARCHAR(100)
)
    ON "default" ;

ALTER TABLE Paciente ADD constraint paciente_pk PRIMARY KEY CLUSTERED (DNI, NSS)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

CREATE TABLE pertenece (
    paciente_dni           VARCHAR(50) NOT NULL,
    paciente_nss           VARCHAR(100) NOT NULL,
    hospital_id_hospital   INTEGER NOT NULL,
    hospital_nombre        VARCHAR(100) NOT NULL
)
    ON "default" ;

ALTER TABLE pertenece ADD constraint pertenece_pk PRIMARY KEY CLUSTERED (Paciente_DNI, Paciente_NSS, Hospital_id_hospital, Hospital_nombre)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

CREATE TABLE recibe (
    tratamiento_id   INTEGER NOT NULL,
    paciente_dni     VARCHAR(50) NOT NULL,
    paciente_nss     VARCHAR(100) NOT NULL,
    duracion         time,
    fecha_inicio     DATE
)
    ON "default" ;

ALTER TABLE recibe ADD constraint recibe_pk PRIMARY KEY CLUSTERED (Tratamiento_id, Paciente_DNI, Paciente_NSS)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

CREATE TABLE trabaja (
    medico_num_colegiado   INTEGER NOT NULL,
    hospital_id_hospital   INTEGER NOT NULL,
    hospital_nombre        VARCHAR(100) NOT NULL,
    cargo                  VARCHAR(100)
)
    ON "default" ;

ALTER TABLE trabaja ADD constraint trabaja_pk PRIMARY KEY CLUSTERED (Medico_num_colegiado, Hospital_id_hospital, Hospital_nombre)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

CREATE TABLE tratamiento (
    id       INTEGER NOT NULL,
    nombre   VARCHAR(100),
    tipo     VARCHAR(100)
)
    ON "default" ;

ALTER TABLE Tratamiento ADD constraint tratamiento_pk PRIMARY KEY CLUSTERED (id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
     ON "default" ;

ALTER TABLE cita
    ADD CONSTRAINT cita_medico_fk FOREIGN KEY ( medico_num_colegiado )
        REFERENCES medico ( num_colegiado )
ON DELETE NO ACTION 
    ON UPDATE no action ;

ALTER TABLE cita
    ADD CONSTRAINT cita_paciente_fk FOREIGN KEY ( paciente_dni,
    paciente_nss )
        REFERENCES paciente ( dni,
        nss )
ON DELETE NO ACTION 
    ON UPDATE no action ;

ALTER TABLE involucra
    ADD CONSTRAINT involucra_medicamento_fk FOREIGN KEY ( medicamento_id )
        REFERENCES medicamento ( id )
ON DELETE NO ACTION 
    ON UPDATE no action ;

ALTER TABLE involucra
    ADD CONSTRAINT involucra_tratamiento_fk FOREIGN KEY ( tratamiento_id )
        REFERENCES tratamiento ( id )
ON DELETE NO ACTION 
    ON UPDATE no action ;

ALTER TABLE pertenece
    ADD CONSTRAINT pertenece_hospital_fk FOREIGN KEY ( hospital_id_hospital,
    hospital_nombre )
        REFERENCES hospital ( id_hospital,
        nombre )
ON DELETE NO ACTION 
    ON UPDATE no action ;

ALTER TABLE pertenece
    ADD CONSTRAINT pertenece_paciente_fk FOREIGN KEY ( paciente_dni,
    paciente_nss )
        REFERENCES paciente ( dni,
        nss )
ON DELETE NO ACTION 
    ON UPDATE no action ;

ALTER TABLE recibe
    ADD CONSTRAINT recibe_paciente_fk FOREIGN KEY ( paciente_dni,
    paciente_nss )
        REFERENCES paciente ( dni,
        nss )
ON DELETE NO ACTION 
    ON UPDATE no action ;

ALTER TABLE recibe
    ADD CONSTRAINT recibe_tratamiento_fk FOREIGN KEY ( tratamiento_id )
        REFERENCES tratamiento ( id )
ON DELETE NO ACTION 
    ON UPDATE no action ;

ALTER TABLE trabaja
    ADD CONSTRAINT trabaja_hospital_fk FOREIGN KEY ( hospital_id_hospital,
    hospital_nombre )
        REFERENCES hospital ( id_hospital,
        nombre )
ON DELETE NO ACTION 
    ON UPDATE no action ;

ALTER TABLE trabaja
    ADD CONSTRAINT trabaja_medico_fk FOREIGN KEY ( medico_num_colegiado )
        REFERENCES medico ( num_colegiado )
ON DELETE NO ACTION 
    ON UPDATE no action ;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             20
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
