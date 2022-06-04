DROP DATABASE IF EXISTS gestion_proyectos;

CREATE DATABASE gestion_proyectos;

USE gestion_proyectos;

CREATE TABLE Empleados(
    cod_empleado INTEGER,
    titulacion VARCHAR(20),
    años_experiencia INTEGER,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    PRIMARY KEY (cod_empleado)
);

CREATE TABLE Jefes(
    cod_jefe INTEGER,
    PRIMARY KEY (cod_jefe),
    FOREIGN KEY (cod_jefe) REFERENCES Empleados(cod_empleado)
);

-- CREATE TABLE Informaticos(
--     cod_informatico INTEGER,
--     PRIMARY KEY (cod_informatico),
--     FOREIGN KEY (cod_informatico) REFERENCES Empleados(cod_empleado)
-- );

-- CREATE TABLE Analistas(
--     cod_analista INTEGER,
--     PRIMARY KEY (cod_analista),
--     FOREIGN KEY (cod_analista) REFERENCES Informaticos(cod_informatico)
-- );

-- CREATE TABLE Programadores(
--     cod_programador INTEGER,
--     PRIMARY KEY (cod_programador),
--     FOREIGN KEY (cod_programador) REFERENCES Informaticos(cod_informatico)
-- );

CREATE TABLE Proyectos(
    cod_proyecto INTEGER,
    nombre VARCHAR(40),
    fecha_inicio DATE,
    fecha_fin DATE,
    presupuesto FLOAT,
    descripcion VARCHAR(255),
    horas_estimadas TIME,
    horas_dedicadas TIME,
    coste_participacion FLOAT,
    cod_jefe INTEGER,
    PRIMARY KEY (cod_proyecto),
    FOREIGN KEY (cod_jefe) REFERENCES Jefes(cod_jefe)
);

-- CREATE TABLE Asignados(
--     cod_proyecto INTEGER,
--     cod_empleado INTEGER,
--     PRIMARY KEY (cod_proyecto, cod_empleado),
--     FOREIGN KEY (cod_proyecto) REFERENCES Proyectos(cod_proyecto),
--     FOREIGN KEY (cod_empleado) REFERENCES Empleados(cod_empleado)
-- );

-- CREATE TABLE Participan(
--     cod_proyecto INTEGER,
--     cod_informatico INTEGER,
--     costo_por_hora FLOAT,
--     horas_totales TIME,
--     PRIMARY KEY (cod_proyecto, cod_informatico),
--     FOREIGN KEY (cod_proyecto) REFERENCES Proyectos(cod_proyecto),
--     FOREIGN KEY (cod_informatico) REFERENCES Informaticos(cod_informatico)
-- );

-- CREATE TABLE Gastos(
--     cod_proyecto INTEGER,
--     cod_gasto INTEGER,
--     tipo VARCHAR(40),
--     descripcion VARCHAR(255),
--     importe FLOAT,
--     fecha DATE,
--     PRIMARY KEY (cod_proyecto, cod_gasto),
--     FOREIGN KEY (cod_proyecto) REFERENCES Proyectos(cod_proyecto)
-- );