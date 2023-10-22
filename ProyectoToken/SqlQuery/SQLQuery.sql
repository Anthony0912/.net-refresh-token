create database dbprueba
use dbprueba

CREATE TABLE Usuario(IdUsuario int primary key identity, NombreUsuario varchar(20), Clave varchar(20))

insert into Usuario(NombreUsuario,Clave) values ('Admin', '123')
select * from Usuario

create table HistorialRefreshToken (
IdHistorial int primary key identity,
IdUsuario int references Usuario(IdUsuario),
Token varchar(500),
RefreshToken varchar(200),
FechaCreacion datetime, 
FechaExpiracion datetime, 
EsActivo as (iif(FechaExpiracion < getdate(), convert(bit,0), convert(bit, 1)))--Columna calculada
);


select * from HistorialRefreshToken;