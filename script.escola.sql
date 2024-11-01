use escola;

INSERT INTO `escola`.`alunos`
(
`nome`,
`id_turma`,
`nota`)
VALUES
('ana', 1, 0),('marcos', 1, 2),('leandro', 3, 0),('maria eduarda', 2, 0);



select * from `escola`.`alunos`;
delete from `escola`.`alunos` where `escola`.`alunos`.`idalunos` = 11;

INSERT INTO `escola`.`turma`
(`id`,
`nome`)
VALUES
('1','engenharia'),('2','direito'),('3','medicina');



select`escola`.`alunos`.`id_turma`,`escola`.`alunos`.`nome`,`escola`.`turma`.`nome` as "turma",`escola`.`alunos`.`nota`,`escola`.`professores`.`nome`as "professor",`escola`.`turma`.`nome`
from `escola`.`alunos`
inner join `escola`.`turma`on `escola`.`turma`.`id`=`escola`.`alunos`.`id_turma`
inner join `escola`.`professores` on `escola`.`professores`.`id_turma` = `escola`.`turma`.`id`
where `escola`.`alunos`.`nome`= 'ana' or `escola`.`turma`.`nome`= 'engenharia';

select * from `escola`.`turma`;

select * from `escola`.`alunos` where `escola`.`alunos`.`idalunos` = 1; 

select * from `escola`.`alunos`where `escola`.`alunos`.`nota` > 1;

select * from alunos;
select * from professores;
select * from turma;


insert into `escola`.`professores`(`nome`, `id_turma`) values ('thiago',1),('rafael',2),('guilherme',3);
select * from `escola`.`professores`;
delete from `escola`.`professores` where `escola`.`professores`.`id` = 4;

select  a.idalunos, a.nome, a.nota, t.nome as disciplina, p.nome as professor, pe.periodo from alunos as a
inner join turma as t on t.id = a.id_turma
inner join professores as p on p.id_turma = a.id_turma
inner join periodos as pe on pe.id = a.id_periodo;

create table periodos (
	id int primary key auto_increment not null,
    periodo varchar(20) not null
);

insert into periodos (periodo) values ('matutino'),('vespertino'),('noturno'),('integral');
select * from periodos;


alter table alunos
add column id_periodo int not null 
after `nota`;

update alunos set id_periodo= 1 where (idalunos >=0 ) and (idalunos <= 1);
update alunos set id_periodo= 2 where (idalunos>= 5);
update alunos set id_periodo= 3 where (idalunos >= 10);
update alunos set id_periodo= 4 where (idalunos >= 15);

select * from alunos

