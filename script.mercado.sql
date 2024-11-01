create database 
use mercado
create table produtos(
id int auto_increment,
nome varchar(45) not null,
preco float not null,
id_categoria int not null,
primary key(id)
)
select * from produtos

insert into produtos
(nome,preco,id_categoria)
values
('laranja',3,1),('maca',4,2),('banana',5,3),('arroz',20,4),('feijao',21,5)

delete from produtos where id = 1

select * from produtos where produtos.preco > 10 
select nome from produtos

create table categorias (
id int auto_increment,
nome varchar(45) not null,
primary key (id)
)

insert into categorias (nome)
values ('fruta'),('cereal'),('bebida')
drop table categorias
select * from categorias 

select p.nome, c.nome as "nome_categoria", preco from produtos as p
inner join categorias as c 
where p.id_categoria = c.id

update produtos
set  id_categoria = 2
where id = 5
