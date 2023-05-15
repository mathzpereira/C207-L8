DROP DATABASE IF EXISTS banco;
CREATE DATABASE banco;

USE banco;

CREATE TABLE cliente(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    CPF VARCHAR(11),
    endereco VARCHAR(45)
);

SELECT * FROM cliente;

INSERT INTO cliente(nome,CPF,endereco) VALUES ('Mathz', '12345678910', 'Rua 1');
INSERT INTO cliente(nome,CPF,endereco) VALUES ('Hulk', '99999999999', 'Rua 2');

ALTER TABLE cliente ADD ano_nasc INT NOT NULL;
UPDATE cliente SET ano_nasc = '2003' WHERE ID = 1;
UPDATE cliente SET ano_nasc = '1986' WHERE ID = 2;

DELETE FROM cliente WHERE ID = 1;
