create database loja_calcados
use loja_calcados

create table produto (
	id int primary key auto_increment,
    nome varchar(100),
    preco decimal (10,2),
    estoque int
);
insert into produto(nome,preco,estoque)
values('tenis Nike','320.9',25),
('tenis olimpykus ','234.9',50),
('camisa basic','39.9',28),
('tenis misium','445.9',80);
insert into produto(nome,preco,estoque)values('tenis adidas',125.9,40);
insert into produto(nome,preco,estoque)values('sapato democrata',187.9,80);

select * from produto;

/*1.consulta mostrando todos os produtos,quantidade e estoque de cada um*/
select produto.nome, produto.estoque from produto;

/* 4.atualização do preco do tenis nike para 349.9*/
update produto
set preco = '349.9'
where id = 1;

/*5.inserindo um novo produto na tabela a bola de futebol adidas*/
insert into produto(nome,preco,estoque)values('bola de futebol adidas',34.9,50);

 create table cliente (
	id int primary key auto_increment,
    nome varchar(100),
    email varchar(100),
    cidade varchar (100)
 );
insert into cliente(nome,email,cidade)
values('Rogerio','rogervclaporta@gmail.com','Campo Grande'),
('vitor','vitorgbeirog@gmail.com','Campo Grande'),
('ariel','arielleza@gmail.com','Campo Grande'),
('luan','luanmendes@gmail.com','Campo Grande');
insert into cliente(nome,email,cidade)values('roberto','robertobarr@gmail.com','sao paulo');
insert into cliente(nome,email,cidade)values('joao silva','joaosilva@gmail.com','curitiba');

select * from cliente;

/* 2.listando nome e email de clientes que moram em sao paulo */
select nome,email from cliente where cidade = 'sao paulo';

/*3.recuperar vendas do cliente joao silva mostrando data da venda,, o produto e o valor*/
select  v.data_venda, p.nome,  v.valor_total from venda as v
inner join produto as p
on p.id = v.id_produto
inner join cliente as c
where c.nome = 'joao silva';

 create table venda (
	id int primary key auto_increment,
    data_venda date,
    id_cliente int,
    id_produto int,
    quantidade int,
    valor_total decimal(10,2)
 );
 
insert into venda(data_venda,id_cliente,id_produto,quantidade,valor_total)
values('2024-08-15',1,1,2,641.8),
('2024-10-27',2,2,1,234.9),
('2024-09-30',3,3,2,79.8),
('2024-10-18',4,4,1,445.9);
insert into venda(data_venda,id_cliente,id_produto,quantidade,valor_total)values('2024-10-01',5,5,1,300.0);
insert into venda(data_venda,id_cliente,id_produto,quantidade,valor_total)values('2024-10-21',6,6,1,187.9);

select * from venda;

/*6.consulta que retornou o total de venda e o valor do dia 01-10-2024*/
select sum(valor_total) from venda where data_venda = '2024-10-01';

/*7.listar o nome de cada cliente e o valor da compra*/
select c.nome, v.valor_total from cliente as c
inner join venda as v
where v.id_cliente = c.id;


/*9.consulta retornando produto mais vendido(em quantidade)*/
select max(quantidade)  from venda;

/* 10.*/
insert into venda(data_venda,id_cliente,id_produto,quantidade,valor_total)values('2024-10-21',3,5,2,1.00);

/* 11'.*/
select p.*
from produto as p
left join venda as v on p.id = v.id_produto
where v.id_produto is null;

/*12.*/
select v.data_venda, c.nome as cliente, v.valor_total from venda as v
join cliente c on v.id_cliente = c.id;

/*13.*/
select SUM(estoque) from produto;

/*14.*/
select v.data_venda, sum(valor_total) as total, c.nome from venda as v
inner join cliente as c
on c.id = v.id_cliente
group by c.nome
order by total desc
limit  1 ;

/*15*/
UPDATE cliente
SET cidade = 'rio de janeiro'
WHERE id = 2;
