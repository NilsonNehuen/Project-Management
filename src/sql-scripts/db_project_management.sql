DROP DATABASE IF EXISTS gestion_proyectos;

CREATE DATABASE gestion_proyectos;

USE gestion_proyectos;

CREATE TABLE Empleados(
    cod_empleado INTEGER,
    titulacion VARCHAR(20),
    años_experiencia INTEGER,
    nombre VARCHAR(40),
    direccion VARCHAR(30),
    PRIMARY KEY (cod_empleado)
);

CREATE TABLE Jefes(
    cod_jefe INTEGER,
    PRIMARY KEY (cod_jefe),
    FOREIGN KEY (cod_jefe) REFERENCES Empleados(cod_empleado) ON DELETE CASCADE
);

CREATE TABLE Informaticos(
    cod_informatico INTEGER,
    PRIMARY KEY (cod_informatico),
    FOREIGN KEY (cod_informatico) REFERENCES Empleados(cod_empleado) ON DELETE CASCADE
);

CREATE TABLE Analistas(
    cod_analista INTEGER,
    PRIMARY KEY (cod_analista),
    FOREIGN KEY (cod_analista) REFERENCES Informaticos(cod_informatico) ON DELETE CASCADE
);

CREATE TABLE Programadores(
    cod_programador INTEGER,
    PRIMARY KEY (cod_programador),
    FOREIGN KEY (cod_programador) REFERENCES Informaticos(cod_informatico) ON DELETE CASCADE
);

CREATE TABLE Proyectos(
    cod_proyecto INTEGER,
    nombre VARCHAR(40),
    fecha_inicio DATE,
    fecha_fin DATE,
    presupuesto FLOAT,
    descripcion VARCHAR(40),
    horas_estimadas TIME,
    horas_dedicadas TIME,
    coste_participacion FLOAT,
    cod_jefe INTEGER,
    PRIMARY KEY (cod_proyecto),
    FOREIGN KEY (cod_jefe) REFERENCES Jefes(cod_jefe) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE Asignados(
    cod_proyecto INTEGER,
    cod_empleado INTEGER,
    PRIMARY KEY (cod_proyecto, cod_empleado),
    FOREIGN KEY (cod_proyecto) REFERENCES Proyectos(cod_proyecto) ON DELETE NO ACTION,
    FOREIGN KEY (cod_empleado) REFERENCES Empleados(cod_empleado) ON DELETE NO ACTION
);


CREATE TABLE Gastos(
    cod_proyecto INTEGER,
    cod_gasto INTEGER,
    tipo VARCHAR(40),
    descripcion VARCHAR(40),
    importe FLOAT,
    fecha DATE,
    PRIMARY KEY (cod_proyecto, cod_gasto),
    FOREIGN KEY (cod_proyecto) REFERENCES Proyectos(cod_proyecto) ON DELETE CASCADE
);

CREATE TABLE Participan(
    cod_proyecto INTEGER,
    cod_informatico INTEGER,
    costo_por_hora FLOAT,
    horas_totales TIME,
    PRIMARY KEY (cod_proyecto, cod_informatico),
    FOREIGN KEY (cod_proyecto) REFERENCES Proyectos(cod_proyecto),
    FOREIGN KEY (cod_informatico) REFERENCES Informaticos(cod_informatico)
);

CREATE TABLE Recursos(
    cod_recurso INTEGER,
    nombre VARCHAR(30),
    tipo VARCHAR(10),
    descripcion VARCHAR(40),
    PRIMARY KEY (cod_recurso),
);

CREATE TABLE Fases_comp(
    num_sec INTEGER,
    cod_proyecto INTEGER,
    nombre VARCHAR(30),
    estado VARCHAR(10),
    fecha_inicio DATE,
    fecha_fin DATE,
    PRIMARY KEY (num_sec, cod_proyecto),
    FOREIGN KEY (cod_proyecto) REFERENCES Proyectos(cod_proyectos) ON DELETE NO ACTION

);

CREATE TABLE Corresponde(
    num_sec INTEGER,
    cod_recurso INTEGER,
    cod_proyecto INTEGER,
    tiempo_utilizado TIME,
    PRIMARY KEY (num_sec, cod_recurso, cod_proyecto),
    FOREGIN KEY (cod_recurso) REFERENCES Recursos(cod_recurso)
    FOREGIN KEY (num_sec) REFERENCES Fases_comp(num_sec)
    FOREGIN KEY (cod_proyecto) REFERENCES Fases_comp(cod_proyecto)
);

CREATE TABLE Productos(
    cod_producto INTEGER,
    nombre VARCHAR(30),
    descripcion VARCHAR(40),
    estado ENUM('Malo', 'Bueno'),
    cod_analista INTEGER,
    PRIMARY KEY (cod_producto),
    FOREIGN KEY (cod_analista) REFERENCES Analistas(cod_analista)
);

CREATE TABLE Software(
    tipo VARCHAR(40),
    cod_software INTEGER,
    PRIMARY KEY (cod_software),
    FOREIGN KEY (cod_sofware) REFERENCES Productos(cod_producto)
);


CREATE TABLE Prototipos(
    cod_prototipo INTEGER,
    version_prot VARCHAR(10),
    ubicacion VARCHAR(20),
    PRIMARY KEY (cod_prototipo),
    FOREIGN KEY (cod_prototipo) REFERENCES Productos(cod_producto)
);

CREATE TABLE Involucrados(
    cod_informatico INTEGER,
    cod_fase INTEGER,
    cod_producto INTEGER,
    horas_dedicadas TIME,
    PRIMARY KEY (cod_fase, cod_informatico, cod_producto),
    FOREIGN KEY (cod_fase) REFERENCES Fases_comp(cod_fase),
    FOREIGN KEY (cod_producto) REFERENCES Fases_comp(cod_producto),
    FOREIGN KEY (cod_informatico) REFERENCES Informaticos(cod_informatico)
);

CREATE TABLE Se_crean(
    num_sec INTEGER,
    cod_proyecto INTEGER,
    cod_producto INTEGER,
    PRIMARY KEY (num_sec, cod_proyecto, cod_producto),
    FOREIGN KEY (num_sec) REFERENCES Fases_comp(num_sec),
    FOREIGN KEY (cod_proyecto) REFERENCES Fases_comp(cod_proyecto),
    FOREIGN KEY (cod_producto) REFERENCES Productos(cod_producto)
);