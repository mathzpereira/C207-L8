CREATE DATABASE IF NOT EXISTS aula02PT2;

USE aula02PT2;

CREATE TABLE IF NOT EXISTS Cliente(
	cpf VARCHAR(11) NOT NULL PRIMARY KEY,
    nome VARCHAR(45),
    idade int,
    cidade VARCHAR(45),
    totalCompra FLOAT
);

INSERT INTO Cliente() VALUES ('12379843256', 'João Lucas', 24, 'Pouso Alegre', 145);
INSERT INTO Cliente() VALUES ('76125894362', 'Jonathan', 28, 'Pouso Alegre', 130.2);
INSERT INTO Cliente() VALUES ('98989892123', 'Robson', 49, 'Santa Rita do Sapucaí', 29.43);

SELECT nome, cidade, totalCompra FROM Cliente WHERE totalCompra >= 10 AND cidade != 'Pouso Alegre';

SELECT * FROM Cliente WHERE nome LIKE 'R%';

SELECT nome, cidade FROM Cliente LIMIT 2;

SELECT DISTINCT cidade FROM Cliente;