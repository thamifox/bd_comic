drop database if exists bd_comics;
create database bd_comics;
use bd_comics;

create table comic (
ISBN int not null,
autor varchar (30) not null,
titulo varchar (25) not null,
precio int not null,
primary key (ISBN)
);

create table editorial (
id_editorial int not null,
nombre varchar (30) not null,
pais varchar (25) not null,
telefono int not null,
primary key (id_editorial)
);

create table pertenecen (
ISBN int not null,
id_editorial int not null,
primary key (ISBN, id_editorial)
);

create table genero (
id_genero int not null,
tipo varchar (30) not null,
ISBN int not null,
primary key (id_genero)
);

create table personajes (
id_personaje int not null,
nombre varchar (25) not null,
faccion varchar (30),
edad int,
primary key (id_personaje)
);

create table tienen (
ISBN int not null,
id_personaje int not null,
primary key (ISBN, id_personaje)
);

create table volumenes (
n_volumen int not null,
autor varchar (30) not null,
fecha_de_publicacion date not null,
ISBN int not null,
primary key (n_volumen)
);

create table numero (
id_numero int not null,
titulo varchar (30) not null,
fecha_de_lanzamiento date,
n_volumen int not null,
primary key (id_numero)
);

create table capitulos (
id_capitulo int not null,
nombre varchar (25) not null,
n_capitulo int not null,
id_numero int not null,
primary key (id_capitulo)
);

alter table pertenecen
add constraint fk_ISBN foreign key (ISBN) references comic (ISBN),
add constraint fk_id_editorial foreign key (id_editorial) references editorial (id_editorial);

alter table genero
add constraint fk_ISBN2 foreign key (ISBN) references comic (ISBN);

alter table tienen
add constraint fk_ISBN3 foreign key (ISBN) references comic (ISBN),
add constraint fk_id_personaje foreign key (id_personaje) references personajes (id_personaje);

alter table volumenes
add constraint fk_ISBN4 foreign key (ISBN) references comic (ISBN);

alter table numero
add constraint fk_n_volumen foreign key (n_volumen) references volumenes (n_volumen);

alter table capitulos
add constraint fk_id_numero foreign key (id_numero) references numero (id_numero);

-- Datos

-- Tabla Comic

insert into comic VALUES ('4545','Antonio Escotado','El paraiso oscuro','20');
insert into comic VALUES ('6443','Bob Kayne','Batman','15');
insert into comic VALUES ('8927','Ana Rosa Quintana','El Jardin','20');
insert into comic VALUES ('9175','El Cigala','Flamenco Heroes','20');
insert into comic VALUES ('3582','Mbappe','Gnomos al poder','18');
insert into comic VALUES ('6196','Salazar','Trofeos y Pericias','16');
insert into comic VALUES ('9178','Pablo Iglesias','Las Casas Vivas','16');
insert into comic VALUES ('4167','Pepe Viyuela','Sillas Bailantes','12');
insert into comic VALUES ('6831','El Canelita','Niñas Danzantes','16');
insert into comic VALUES ('8153','Pedro Sanchez','Y el caso de la luz','12');

-- Tabla Editorial

insert into editorial VALUES ('5642','Casa Terradellas','España','745765782');
insert into editorial VALUES ('5831','Torreon','Mozambique','82345983');
insert into editorial VALUES ('2507','Valsequillo Comics','España','628092637');
insert into editorial VALUES ('5195','Legacy Comics S.L.','Israel','528616851');
insert into editorial VALUES ('3036','Comic Intercasa','España','520718945');

-- Tabla Genero

insert into genero VALUES ('7820','Accion','6443');
insert into genero VALUES ('4317','Aventura','9175');
insert into genero VALUES ('5164','Misterio','4545');
insert into genero VALUES ('3531','Alegria','8927');
insert into genero VALUES ('4318','Aventura','3582');
insert into genero VALUES ('8715','Magia','3582');
insert into genero VALUES ('6026','Drama','9178');
insert into genero VALUES ('7295','Comedia','4167');
insert into genero VALUES ('5626','Romance','6831');
insert into genero VALUES ('6027','Drama','8153');

-- Tabla personajes

insert into personajes VALUES ('5824','Bruce Wayne','Independiente','36');
insert into personajes VALUES ('4257','Sergio Canelita','Buena Gente','42');
insert into personajes VALUES ('5274','Knekro','Malvado','82');
insert into personajes VALUES ('7168','Xokas','Independiente','32');
insert into personajes VALUES ('5246','Albert Rivera','Malvado','43');
insert into personajes VALUES ('6174','Mario Cigala','Bueno','57');
insert into personajes VALUES ('5174','El Sevilla','Independiente','78');
insert into personajes VALUES ('8175','Terrance','Malvado','64');
insert into personajes VALUES ('9361','Acaimo','Bueno','25');
insert into personajes VALUES ('0852','Maria','independiente','28');
insert into personajes VALUES ('0232','Talia','Malvado','42');

-- Tabla volumenes

insert into volumenes VALUES ('2','Antonio Escotado','2006-09-16','4545');
insert into volumenes VALUES ('4','Bob Kayne','1980-06-25','6443');
insert into volumenes VALUES ('3','Ana Rosa Quintana','2011-10-08','8927');
insert into volumenes VALUES ('6','El Cigala','2018-11-18','9175');
insert into volumenes VALUES ('17','Mbappe','2021-12-12','3582');
insert into volumenes VALUES ('1','Salazar','2005-03-22','6196');
insert into volumenes VALUES ('8','Pablo Iglesias','2009-06-22','9178');
insert into volumenes VALUES ('7','Pepe Viyuela','2003-04-14','4167');
insert into volumenes VALUES ('12','El Canelita','2000-02-25','6831');
insert into volumenes VALUES ('18','Pedro Sanchez','2018-05-18','8153');

-- Tabla numero
insert into numero VALUES ('1','El paraiso oscuro','2022-02-15','2');
insert into numero VALUES ('2','Batman','2022-03-20','4');
insert into numero VALUES ('3','El Jardin','2022-03-28','3');
insert into numero VALUES ('4','Flamenco Heroes','2022-05-18','6');
insert into numero VALUES ('5','Gnomos al poder','2022-08-23','17');
insert into numero VALUES ('6','Trofeos y Pericias','2022-09-16','1');
insert into numero VALUES ('7','Las Casas Vivas','2021-11-12','8');
insert into numero VALUES ('8','Sillas Bailantes','2021-10-20','7');
insert into numero VALUES ('9','Niñas Danzantes','2021-09-12','12');
insert into numero VALUES ('10','Y el caso de la luz','2021-03-22','18');

-- Tabla capitulos

insert into capitulos VALUES ('1','Sin Salida','1','1');
insert into capitulos VALUES ('2','El caso de la gata','2','2');
insert into capitulos VALUES ('3','Amapolas perdidas','3','3');
insert into capitulos VALUES ('4','El cigala y su destino','4','4');
insert into capitulos VALUES ('5','El gnomo mbappe','5','5');
insert into capitulos VALUES ('6','El Trofeo de la paciencia','6','6');
insert into capitulos VALUES ('7','La Gran Casa','7','7');
insert into capitulos VALUES ('8','Tu sonrrisa','8','8');
insert into capitulos VALUES ('9','Niña Bonita','9','9');
insert into capitulos VALUES ('10','La Subida','10','10');

-- Tabla Muchos a muchos

insert into pertenecen VALUES ('4545','5642');
insert into pertenecen VALUES ('6443','5642');
insert into pertenecen VALUES ('8927','5642');
insert into pertenecen VALUES ('9175','5642');
insert into pertenecen VALUES ('3582','5831');
insert into pertenecen VALUES ('6196','5831');
insert into pertenecen VALUES ('9178','2507');
insert into pertenecen VALUES ('4167','2507');
insert into pertenecen VALUES ('6831','5195');
insert into pertenecen VALUES ('8153','3036');

insert into tienen VALUES ('4545','9361');
insert into tienen VALUES ('6443','5824');
insert into tienen VALUES ('8927','5274');
insert into tienen VALUES ('9175','6174');
insert into tienen VALUES ('3582','0852');
insert into tienen VALUES ('6196','0232');
insert into tienen VALUES ('9178','5246');
insert into tienen VALUES ('4167','7168');
insert into tienen VALUES ('6831','4257');
insert into tienen VALUES ('8153','5174');

