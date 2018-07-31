create database Notas

/*creacion de la tabla estudiante*/
create table estudiante(
	idAlumnos numeric(9) primary key,
	NomEst varchar(30),
	ApelEst varchar(30),
	GradoEst varchar(3),
	SeccionEst varchar(5),
	DireccionEst varchar(30),
	TelefonoEst varchar(10),
	EmailEst varchar(30),
	PasswordEst varchar(30),
)
/*ingresar registros*/
insert into estudiante values(201520957,'Dennis','Nuñez','30A','tarde','Forestal','0939443183','alexs82@gmail.com','12345')
insert into estudiante values(201520123,'Luis','Perez','30A','tarde','Marin','0939412383','luis82@gmail.com','1115')
insert into estudiante values(201520222,'Carlos','Lopez','30A','tarde','Ferroviaria','0939443234','Carl82@gmail.com','12225')

select * from estudiante
/*creacion de la tabla profesor*/
create table profesor(
	idProfesor numeric(10) primary key,
	NomProfesor varchar(30),
	ApellProfesor varchar(30),
	DireccionProfesor varchar(30),
	TelefonoProfesor numeric(10),
	EmailProfesor varchar(30),
	PasswordProfesor varchar(10),
)
insert into profesor values(1712120797,'Juan','Martinez','Floresta','0962546789','JMARTIN98@gmail.com','hola')
insert into profesor values(1712120777,'Alberto','Ponce','Av.America','0962544444','Ponce8@gmail.com','contraseña')

/*creacion de la tabla curso*/
create table curso(
	idCUrso numeric(3) primary key,
	NombreCurso varchar(30),
)
/**/

/*ingresar fk de la tabla profesor en la tabla curso*/
alter table curso add idProfesorFk numeric(10) foreign key references profesor(idProfesor)

/*creacion de la tabla notas*/
create table notas(
	idNota numeric(2) primary key,
	UnidadNotas numeric(3),
	PromedioNotas numeric(2),	
)

/*ingresar fk de las tablas curso, alumno en la tabla notas*/
alter table notas add idCUrsoFK numeric(3) foreign key references curso(idCUrso)
alter table notas add idAlumnosFK numeric(9) foreign key references estudiante(idAlumnos)

select * from estudiante
select * from curso
select * from profesor
select * from notas