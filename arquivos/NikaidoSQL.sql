create table if not exists USUARIO(
	id_user integer not null primary key,
	email varchar(80) not null,
	senha varchar(30) not null
);
create table if not exists MESA(
	id_mesa integer not null primary key,
	link varchar(6) not null,
	nome varchar(30) not null,
	mestre integer,
	foreign key(mestre) references USUARIO(id_user)
);
create table if not exists JOGO(
	id_jogo integer not null primary key,
	jogo_mestre integer,
	mesa integer,
	foreign key(mesa) references MESA(id_mesa)
);
create table if not exists PERSONAGEM(
	id_perso integer not null primary key,
	nome varchar(30),
	usuario integer,
	jogo integer,
	foreign key(jogo) references JOGO(id_jogo)
);
create table if not exists ATRIBUTO(
	id_atributo integer not null primary key,
	tipo varchar(30)
);
create table if not exists Perso_Atr(
	id_combi integer not null primary key,
	id_per integer not null,
	id_atr integer not null,
	dice integer,
	multiplier integer,
	foreign key(id_per) references PERSONAGEM(id_perso),
	foreign key(id_atr) references ATRIBUTO(id_atributo)
);
create table if not exists ITENS(
	id_item integer not null primary key,
	nome varchar(30),
	dano integer,
	descricao varchar(50),
	efeito varchar(20),
	tipo varchar(20)
);
create table if not exists Itens_Perso(
	id_equip integer not null primary key,
	item integer,
	perso integer,
	foreign key(item) references ITENS(id_item),
	foreign key(perso) references PERSONAGEM(id_perso)
);

insert into USUARIO(id_user,email,senha)
	values
		(1001,'joazinho.monge@hotmail.com','1234'),
		(1002,'bruno.almago@gmail.com','magia'),
		(1003,'ricardinhoplayer123@hotmail.com','ricardinho123'),
		(1004,'joanabr@gmail.com','quadrado');
insert into MESA(id_mesa,link,nome,mestre)
	values
		(456,'gfhdfh','Covil dos Lobos',1001),
		(654,'rfaerg','Guardiões de Thanatos',1003),
		(353,'fgjhda','Taverna dos Pecadores',1004),
		(247,'tsarty','Guerreiros de Canaban',1002),
		(846,'sdrotl','Defensores do MST',1001);
insert into JOGO(id_jogo,jogo_mestre,mesa)
	values
		(111,1004,353),
		(222,1001,846),
		(333,1003,654),
		(444,1002,247);
/*Linhas dado e multiplicador são preenchidas após rolagem do dado(físico/função)*/
insert into ATRIBUTO(id_atributo,tipo)
	values
		(10,'Força'),
		(20,'Destreza'),
		(30,'Constituição'),
		(40,'Inteligência'),
		(50,'Carisma'),
		(60,'Sabedoria');
/*Linhas atr_personagem e inv_personagem são preenchidos após rolagem do dado
 * e ao decorrer da campanha, respectivamente*/
insert into PERSONAGEM(id_perso,nome,usuario,jogo)
	values
		(1010,'Thanos',1002,111),
		(2010,'Legolas',1003,333),
		(1020,'Valzer',1002,333),
		(3010,'Eldon',1001,111);
/*Linha efeito = null quer dizer que o item não possui nenhum efeito extra*/
insert into ITENS(id_item,nome,dano,descricao,efeito,tipo)
	values
		(1100,'Pedra',1,'Comum',null,'Impactante'),
		(1200,'Faca cega',3,'Comum',null,'Cortante'),
		(3100,'Lança dos deuses',67,'Lendário','Força dos Deuses','Perfurante'),
		(2100,'Espada',5,'Raro','Sangramento','Cortante'),
		(2200,'Machadão',7,'Raro','Força+1','Cortante');
insert into perso_atr(id_combi,id_per,id_atr,dice,multiplier)
	values 
		(101010,1010,10,15,2),
		(202010,2010,20,16,3),
		(301010,1010,30,14,2),
		(403010,3010,40,16,3),
		(501020,1020,50,11,0),
		(601020,1020,60,11,0);
insert into itens_perso(id_equip,item,perso)
	values
		(20102100,2100,2010),
		(30103100,3100,3010),
		(10101100,1100,1010),
		(10102200,2200,1010);

select * from USUARIO;
select * from MESA;
select * from JOGO;
select * from ATRIBUTO;
select * from PERSONAGEM;
select * from ITENS;

drop table if exists USUARIO cascade;
drop table if exists MESA cascade;
drop table if exists JOGO cascade;
drop table if exists ATRIBUTO cascade;
drop table if exists PERSONAGEM cascade;
drop table if exists INVENTARIO cascade;