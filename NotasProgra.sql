create database NotasProgra

use NotasProgra
/*creacion de la tabla estudiante*/

create table estudiante(
	idAlumnos numeric(9) primary key,
	NomEst varchar(30),
	PasswordEst varchar(30),
)

/*ingresar registros*/
insert into estudiante values(201520957,'Dennis','12345')
insert into estudiante values(201520123,'Luis','1115')
insert into estudiante values(201520222,'Carlos','12225')



/*creacion de la tabla profesor*/
create table profesor(
idProfesor numeric(10) primary key,
NomProfesor varchar(30),
PasswordProfesor varchar(10),
)

insert into profesor values(1712120797,'Juan','hola')
insert into profesor values(1712120777,'Edison','contraseña')

/*creacion de la tabla curso*/
create table curso(
idCUrso numeric(3) primary key,
NombreCurso varchar(30),
)


/**/

/*ingresar fk de la tabla profesor en la tabla curso*/
alter table curso add idProfesorFk numeric(10) foreign key references profesor(idProfesor)

insert into curso values(001,'Matematicas',1712120797)
insert into curso values(002,'Fisica',1712120777)
insert into curso values(003,'Ingles',1712120777)
insert into curso values(004,'Literatura',1712120797)
insert into curso values(005,'Informatica',1712120777)


/*creacion de la tabla notas*/
create table notas(
	idNota numeric(2) primary key,
	UnidadNotas numeric(3),
	PromedioNotas numeric(2),	
)

/*ingresar fk de las tablas curso, alumno en la tabla notas*/
alter table notas add idCUrsoFK numeric(3) foreign key references curso(idCUrso)
alter table notas add idAlumnosFK numeric(9) foreign key references estudiante(idAlumnos)

insert into notas values(1,5,10,001,201520957)
insert into notas values(2,9,18,002,201520222)
insert into notas values(3,5,10,003,201520123)
insert into notas values(4,9,18,005,201520222)
insert into notas values(5,5,10,004,201520957)
insert into notas values(6,9,18,002,201520123)
insert into notas values(7,5,10,001,201520957)
insert into notas values(8,9,18,003,201520222)
insert into notas values(9,5,10,005,201520123)
insert into notas values(10,9,18,005,201520222)


select * from estudiante
select * from curso
select * from profesor
select * from notas

/*permiti al usuario profesor consultar las calificaciones para cada materia*/

select NombreCurso,PromedioNotas from notas, curso where notas.idCUrsoFK = curso.idCUrso

/*permitir revisar las calificaciones por curso*/

select curso.NombreCurso,notas.PromedioNotas from curso inner join notas on curso.idCUrso = notas.idCUrsoFK

/*permitir al usuario estudiante verificar sus notas e imprimir sus notas de toas las materias*/

select idAlumnos,NombreCurso,PromedioNotas,NomEst  from notas,estudiante,curso where notas.idAlumnosFK = estudiante.idAlumnos
																	   
																	   and curso.idCUrso = notas.idCUrsoFK 

