create database aeroporto
use aeroporto

create table passageiro(
id int primary key auto_increment not null,
nome varchar(45),
cpf int,
id_passagem int
);
insert into passageiro(nome, cpf, id_passagem)values ('rogerio', 12345, 1),('vitor', 6789, 2),('luan', 0189, 3);
delete from passageiro where id = 6;
select * from passageiro;

create table avioes(
id int primary key auto_increment not null,
nome_aviao varchar(45),
portal varchar(45),
horario_chegada datetime,
horario_partida datetime,
destino varchar(45)
);
insert into avioes(nome_aviao,portal,horario_chegada,horario_partida,destino) values
('gol','e15','2024-01-01 6:00:00','2024-01-01 09:00:00','sao paulo'),('azul','b15','2024-02-02 7:00:00','2024-02-02 10:00:00','rio de janeiro'),('latam','b15','2024-03-03 11:00:00','2024-03-03 13:00:00','amazonas');
delete from avioes where id = 2;
select * from avioes;

create table passagem (
id int primary key auto_increment not null,
nome_aviao varchar(45),
nome_passageiro varchar(45),
portal varchar(45),
destino varchar(45)
);
alter table passagem add column id_passagem int after destino;

insert into passagem(nome_aviao,nome_passageiro,portal,destino,id_passagem)values('gol','rogerio','e15','sao paulo',1),('azul','vitor','b15','rio de janeiro',2),('latam','luan','b15','amazonas',3);

select * from passagem;

select passagem.nome_passageiro, avioes.nome_aviao as "aviao", avioes.destino, id_passagem from passagem
inner join avioes;
