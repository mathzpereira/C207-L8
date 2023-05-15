DROP DATABASE C207;

CREATE DATABASE IF NOT EXISTS C207;
USE C207;

CREATE TABLE IF NOT EXISTS Agente(
	idAgente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(45),
    nascimento DATE,
    habilidade VARCHAR(45),
    sexo VARCHAR(45),
    email VARCHAR(45)
    );
    
CREATE TABLE IF NOT EXISTS vilao(
	idvilao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    num_crimes INT NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS missao(
	idmissao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data DATE NOT NULL,
    nome VARCHAR(45) NOT NULL,
    local VARCHAR(45),
    duracao INT,
    vilao_idvilao INT,
    CONSTRAINT fk_vilao FOREIGN KEY (vilao_idvilao) REFERENCES vilao(idvilao)
    );
    
CREATE TABLE IF NOT EXISTS Agente_has_missao(
	Agente_idAgente INT,
    missao_idMissao INT,
    PRIMARY KEY (Agente_idAgente, missao_idMissao),
	CONSTRAINT fk_Agente FOREIGN KEY (Agente_idAgente) REFERENCES Agente(idAgente),
    CONSTRAINT fk_missao FOREIGN KEY (missao_idMissao) REFERENCES missao(idmissao)
    );
    
INSERT INTO Agente VALUES
(1, "Abel", "Rua A", "2000-12-15", "Táticas", "Masculino", "abel@gmail.com"),
(2, "Beto", "Rua B", "2000-11-05", "Banco de Dados", "Masculino", "beto@gmail.com"),
(3, "Carol", "Rua C", "1985-01-05", "Direito", "Feminino", "carol@gmail.com"),
(4, "David", "Rua D", "2003-07-25", "RH", "Masculino", "david@gmail.com"),
(5, "Ester", "Rua E", "2002-12-05", "Beleza", "Feminino", "ester@gmail.com");

INSERT INTO vilao VALUES
(default, "Pablo", 2),
(default, "Tyrone", 3),
(default, "Uniqua", 10),
(default, "Tasha", 5),
(default, "Austin", 1);

INSERT INTO missao VALUES
(default, "2023-05-08", "Missão 1", "Local 1", 10, 1),
(default, "2023-05-08", "Missão 2", "Local 2", 10, 2),
(default, "2023-05-08", "Missão 3", "Local 3", 10, 3),
(default, "2023-05-08", "Missão 4", "Local 4", 10, 4),
(default, "2023-05-08", "Missão 5", "Local 5", 10, 5);

INSERT INTO Agente_has_Missao VALUES
(1,1), (2,2), (3,3), (4,4), (5,5);

SELECT Agente.nome, Agente.email, missao.nome, missao.data FROM Agente_has_missao
INNER JOIN Agente ON Agente.idAgente = Agente_has_missao.Agente_idAgente
INNER JOIN missao ON missao.idmissao = Agente_has_missao.missao_idMissao;

SELECT missao.nome, missao.data, missao.duracao, vilao.nome FROM missao INNER JOIN vilao ON vilao.idvilao = missao.vilao_idvilao;

SELECT Agente.nome, missao.nome, vilao.nome FROM Agente_has_missao
INNER JOIN Agente ON Agente.idAgente = Agente_has_missao.Agente_idAgente
INNER JOIN missao ON missao.idmissao = Agente_has_missao.missao_idMissao
INNER JOIN vilao ON vilao.idvilao = missao.vilao_idvilao;

 

