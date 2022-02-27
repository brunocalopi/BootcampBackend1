drop schema if exists Educacion;
create schema Educacion;

create table Educacion.Cursos(
	Nombre_Curso varchar(20) primary key,
    Descripcion_Curso varchar(100) not null,
    Precio_Curso int not null
);
insert into educacion.cursos value(
	'Religión','La religión es importante',200
);
insert into educacion.cursos value(
	'Literatura','La literatura es interesante',300
);
insert into educacion.cursos value(
	'Matemática','La matemática es útil',500
);


create table Educacion.Profesores(
	Nombre_Profesor varchar(40) primary key,
    Descripcion_Profesor varchar(100) not null,
    Foto_Profesor blob
);
insert into educacion.profesores value(
	'Pedro Rotta','Profesor con muchos conocimientos',''
);
insert into educacion.profesores value(
	'Julio Jiménez','Profesor nuevo',''
);


create table Educacion.Alumnos(
	DNI char(8) primary key,
    Nombre_Alumno varchar(30) not null,
    Celular char(9) not null,
    Email varchar(45) not null
);
insert into educacion.alumnos value(
	'74159607','Bruno Calopiña','986220580','brunocalopi@gmail.com'
);
insert into educacion.alumnos value(
	'72000001','Juan Rodriguez','999999991','juan.rodriguez@gmail.com'
);




create table Educacion.Profesores_Cursos(
	Nombre_Profesor varchar(30) not null,
    Curso varchar(15) not null,
    foreign key (Nombre_Profesor) references educacion.Profesores(Nombre_Profesor) on delete cascade,
    foreign key (Curso) references educacion.Cursos(Nombre_Curso) on delete cascade
);
insert into educacion.profesores_cursos value(
	'Pedro Rotta','Matemática'
);
insert into educacion.profesores_cursos value(
	'Pedro Rotta','Matemática'
);
insert into educacion.profesores_cursos value(
	'Julio Jiménez','Literatura'
);
insert into educacion.profesores_cursos value(
	'Julio Jiménez','Literatura'
);
insert into educacion.profesores_cursos value(
	'Pedro Rotta','Religión'
);




create table educacion.alumnos_Cursos(
	DNI char(8) not null,
    Curso varchar(15) not null,
    foreign key (DNI) references educacion.Alumnos(DNI) on delete cascade,
    foreign key (Curso) references educacion.Cursos(Nombre_Curso) on delete cascade
);
insert into educacion.alumnos_cursos value(
	'74159607','Literatura'
);
insert into educacion.alumnos_cursos value(
	'74159607','Matemática'
);
insert into educacion.alumnos_cursos value(
	'74159607','Religión'
);
insert into educacion.alumnos_cursos value(
	'72000001','Matemática'
);
insert into educacion.alumnos_cursos value(
	'72000001','Literatura'
);


select * from educacion.cursos;
select * from educacion.profesores;
select * from educacion.alumnos;
select * from educacion.profesores_cursos;
select * from educacion.alumnos_cursos;


-- 1
select * from educacion.alumnos_cursos where Curso = "Religión";

-- 2
select count(Nombre_Profesor) as conteo_profesores, 
educacion.profesores_cursos.Curso,
educacion.cursos.Descripcion_Curso,
educacion.cursos.Precio_Curso
from educacion.profesores_cursos
JOIN educacion.cursos
on educacion.profesores_cursos.Curso = educacion.cursos.Nombre_Curso
group by Curso
having conteo_profesores>1;

-- 3
select count(Curso) as conteo_cursos,
educacion.alumnos_cursos.DNI,
educacion.alumnos.Nombre_Alumno,
educacion.alumnos.Celular,
educacion.alumnos.Email
from educacion.alumnos_cursos
JOIN educacion.alumnos
on educacion.alumnos_cursos.DNI = educacion.alumnos.DNI
group by DNI
having conteo_cursos>1;

-- 4
select
educacion.alumnos_cursos.curso,
educacion.alumnos_cursos.DNI,
educacion.alumnos.Nombre_Alumno,
educacion.alumnos.Celular,
educacion.alumnos.Email
from educacion.alumnos_cursos
JOIN educacion.alumnos
on educacion.alumnos_cursos.DNI = educacion.alumnos.DNI
where Curso in ('Literatura','Religión');