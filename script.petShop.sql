create database petshop
use petshop

create table clientes (
	id int primary key auto_increment unique,
    nome varchar(50),
    dt_nascimento date,
    cpf varchar(14) unique ,
    logradouro varchar(50),
    bairro varchar(25),
    numero varchar(4),
    telefone varchar(14)
)

create table animais (
	id int primary key auto_increment,
    nome varchar(50),
    idade int ,
    raca varchar(30),
    tipo_especie int ,
    id_cliente int
)

create table especies (
	id int primary key auto_increment,
    especie varchar(45)
)

alter table clientes add column id_animal int;
drop table clientes;
alter table clientes add column complemento varchar(15) after numero
alter table animais drop column id_cliente;
alter table animais add column id_cliente int;

select * from animais;
select * from clientes;
select * from especies;

insert into clientes(nome, dt_nascimento,cpf,logradouro,bairro,numero,telefone)
values('rogerio','2008-11-27','12345','R. dolor de andrade','sao francisco','515','67 981999724');
insert into clientes(nome, dt_nascimento,cpf,logradouro,bairro,numero,telefone)
values('marcos','2009-08-27','67890','R. joao pessoa','sao francisco','1043','67 999754123');
insert into clientes(nome, dt_nascimento,cpf,logradouro,bairro,numero,telefone)
values('giovana','2002-03-12','654732','R. padre joao cripa','sao francisco','467','67 981765348');
insert into clientes(nome, dt_nascimento,cpf,logradouro,bairro,numero,telefone)
values('vitor','2000-07-15','1034562','R. rui barbosa','sao francisco','515','67 348999724');
insert into clientes(nome, dt_nascimento,cpf,logradouro,bairro,numero,telefone)
values('tomas','2008-09-30','6754432','R. rachid neder','sao francisco','874','67 981932154');
update  clientes set complemento = 'a' where id = 1;

insert into animais(nome,idade,raca,tipo_especie,id_cliente)values('max','4','doberman','1','2'),('pinke','7','perse','2','3'),('mel','2','alpes','3','4'),
('alberto','5','pitbul','1','5'),('nike','4','shitsu','1','6');
update animais set id_cliente = 6 where id = 6;

insert into especies (especie)values('cachorro');
insert into especies (especie)values('gato');
insert into especies (especie)values('coelho');
insert into especies (especie)values('peixe');
insert into especies (especie)values('passaro');

select * from especies;


select c.nome as cliente, c.logradouro, c.bairro, a.nome as animal,  e.especie from clientes as c
inner join animais as a
on c.id = a.id_cliente
inner join especies as e
on  e.id = a.tipo_especie

create table servicos (
	id int primary key auto_increment unique,
    descricao varchar(40),
    valor float
)
insert into servicos(descricao,valor)values('banho',60);
insert into servicos(descricao,valor)values('tosa',60);
insert into servicos(descricao,valor)values('banho/tosa',110);
insert into servicos(descricao,valor)values('vacinação',80);
insert into servicos(descricao,valor)values('spar',90);

select * from servicos;

create table atendimento (
	id int primary key auto_increment unique,
    dt_atendimento date,
    id_servico int,
    id_animal int
);

insert into atendimento(dt_atendimento,id_servico,id_animal)values('2024-10-10',1,1);
insert into atendimento(dt_atendimento,id_servico,id_animal)values('2024-10-10',2,2);
insert into atendimento(dt_atendimento,id_servico,id_animal)values('2024-10-10',3,3);
insert into atendimento(dt_atendimento,id_servico,id_animal)values('2024-10-10',4,4);
insert into atendimento(dt_atendimento,id_servico,id_animal)values('2024-10-10',5,5);

select * from atendimento;

select an.nome, e.especie, a.dt_atendimento, s.descricao,s.valor, c.nome as dono, p.nome as veterinario from atendimento as a
inner join servicos as s
on s.id = a.id_servico
inner join animais as an
on an.id = a.id_animal
inner join clientes as c
on an.id_cliente = c.id
inner join especies as e
on e.id = a.id_animal
inner join profissionais as p 
on p.id = a.id_profissional;

select * from profissionais;

create table profissionais (
	id int primary key auto_increment unique,
    nome varchar (50),
    telefone varchar(15),
    crmv varchar(9) unique
);

update atendimento set id_profissional = 6 where id = 6;

insert into profissionais(nome,telefone,crmv)values('Carlos','67992115450','000000002'),('thalita','67982136750','000000003'),('manoel','67989653450','000000004');
select * from profissionais;
select * from atendimento;
alter table atendimento add column id_profissional int;


