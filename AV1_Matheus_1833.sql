drop database if exists av1;
create database av1;
use av1;

#COMANDO PARA DESATIVAR O SAFE MODE
set SQL_SAFE_UPDATES = 0;

create table if not exists aluno(
  matricula varchar(15) not null primary key,
  nome varchar(45),
  idade int,
  curso varchar(45),
  periodo int
  );
  
# QUESTÃO 1 - a) É um dado único, ou seja, ele nunca irá se repetir, representando cada registro de maneira única.

# QUESTÃO 2

#a)
INSERT INTO aluno VALUES ('1234','Camila','22','GEC','2');
INSERT INTO aluno VALUES ('4567','Marcelo','25','GEB','3');
INSERT INTO aluno VALUES ('9876','Felipe','19','GES','2');
INSERT INTO aluno VALUES ('1594','Mariana','20','GEC','4');
INSERT INTO aluno VALUES ('8462','Flávio','26','GEA','6');
INSERT INTO aluno VALUES ('4866','Maria','18','GEC','3');

#b)

UPDATE aluno SET periodo = '4' WHERE nome = 'Marcelo';

#c)

SELECT * FROM aluno WHERE curso = 'GEC';

#d)

DELETE FROM aluno WHERE nome = 'Mariana';

#e)

SELECT curso FROM aluno WHERE periodo = '2';

#f)

SELECT nome, idade, curso FROM aluno WHERE periodo = '3'; 

#g)

SELECT * FROM aluno LIMIT 3;

#h)

SELECT nome FROM aluno WHERE nome LIKE 'M_____%';

#i)

SELECT COUNT(nome) FROM aluno WHERE idade > 21;
  

