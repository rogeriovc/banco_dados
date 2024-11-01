create database loja_online;
use loja_online;

create table clientes (
	id int auto_increment primary key not null,
	nome varchar(45) not null,
	email varchar(45) not null,
	endereco varchar(45) not null
);
insert into clientes(nome,email,endereco)values('rogerio','rogervclaporta@gmail.com',' rua dolor de andrade,515'),('vitor','vitorgalvao@gmail.com',' rua takeshi higushi,219'),
('ariel','arielleza@gmail.com',' rua joao pessoa, 1004');
select * from clientes;


create table produtos (
	id int auto_increment primary key not null,
	nome varchar(45) not null,
	descricao varchar(45) not null,
	preco float  not null,
    quantidade_estoque int not null
);
insert into produtos(nome,descricao,preco,quantidade_estoque)values('Adidas Ultraboost 5','corrida/caminhada','999.9','25'),('Mizuno Wave 13','esportivo','1.349','66'),
('Olimpykus Marte','casual','189.9','15');
select * from produtos; 
delete from produtos where id = 9;

create table pedidos (
	id int auto_increment primary key not null,
	id_cliente int not null,
	data_pedido date not null,
	o_status varchar (45)  not null
);
insert into pedidos(id_cliente,data_pedido,o_status)values('1','2024-10-04','em andamento'),('2','2024-08-07','concluido'),('3','2024-10-03','concluido');
select * from pedidos; 

create table itens_pedido (
	id int auto_increment primary key not null,
	id_pedido int not null,
	id_produto int not null,
	quantidade int  not null,
    preco_unitario float not null
);
insert into itens_pedido(id_pedido,id_produto,quantidade,preco_unitario)values('5','10','1','999.9'),('10','15','1','1.349'),('20','30','1','1.349');
select * from itens_pedido;


select clientes.nome, clientes.endereco, produtos.nome , pedidos.id_cliente "id Cliente" from clientes
inner join pedidos on clientes.id = pedidos.id_cliente
inner join itens_pedido on itens_pedido.id_pedido  = pedidos.id
inner join produtos on itens_pedido.id_produto = produtos.id
where clientes.id = 1;

select clientes.nome, clientes.endereco, produtos.nome , pedidos.id_cliente  from clientes
inner join pedidos;

select * from clientes; 
select * from produtos; 
select * from pedidos; 
select * from itens_pedido; 

describe clientes;
describe produtos;
describe pedidos;
describe itens_pedido;







