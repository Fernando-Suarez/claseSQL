-- Práctica SQL: on delete - on update

-- Desarrolla un ejemplo similar, partiendo de dos tablas: Países y Localidades
-- Luego:
-- Crea registros para, al menos, 4 países.
-- Relaciona al menos 2 localidades por cada país.
-- Crea las tablas utilizando la CONSTRAINT (SET NULL y CASCADE).
-- Ejecuta una consulta de eliminación por cada CONSTRAINT.

create table Paises (
paisID int primary key auto_increment,
nombre_pais varchar(40) not null
);

create table Localidades (
localidadID int primary key auto_increment,
nombre_localidad varchar(40) not null,
paisID int,
FOREIGN KEY (paisID) REFERENCES Paises(paisID) on delete cascade
-- FOREIGN KEY (paisID) REFERENCES Paises(paisID) on delete set null
-- FOREIGN KEY (paisID) REFERENCES Paises(paisID) on delete restrict  -- tiempo de ejecucion despues de ejecutar el delete
-- FOREIGN KEY (paisID) REFERENCES Paises(paisID) on delete no action -- tiempo de ejecucion antes de ejecutar el delete
);

alter table Localidades add constraint FK_Localidades_Paises
FOREIGN KEY (paisID) REFERENCES Paises(paisID) on delete cascade;

drop table paises;


insert into Paises(
nombre_pais
) value (
"Argentina"),("Brasil"),("Uruguay"),("Peru")
;

insert into Localidades(
nombre_localidad, paisID)
 value (
"San Luis", 1),("Cordoba",1),("Rio de Janeiro",2),("Bombinhas",2),("Montevideo",3),("Punta del Este",3),("Lima",4), ("Cusco",4)
;

delete from paises where paisID = 2;