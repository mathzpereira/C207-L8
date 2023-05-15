CREATE DATABASE IF NOT EXISTS EX1;

USE EX1;

CREATE TABLE Departamento
(
    DNome VARCHAR(15),
    DNumero INT,
    DataInicio DATE,
    SSN_Empregado INT NOT NULL,
    PRIMARY KEY(DNumero),
    CONSTRAINT fk1 FOREIGN KEY (SSN_Empregado) REFERENCES Empregado(SSN) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Empregado
(
  PNome VARCHAR(15) NOT NULL,
  MInicial CHAR,
  UNome VARCHAR(15) NOT NULL,
  SSN BIGINT NOT NULL,
  DataNasc DATE,
  Endereco VARCHAR(80),
  Sexo BIT,
  Salario DECIMAL(10,2),
  SSN_Supervisor BIGINT,
  DNumero_Departamento INT NOT NULL,
  
  PRIMARY KEY (SSN),
  CONSTRAINT fk1 FOREIGN KEY (SSN_Supervisor) REFERENCES Empregado (SSN) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk2 FOREIGN KEY (DNumero_Departamento) REFERENCES Departamento (DNumero) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Projeto
(
	Pnome VARCHAR(15) NOT NULL,
    PNumero INT PRIMARY KEY NOT NULL,
    PLocalizacao VARCHAR(45),
    DNumero_Departamento INT NOT NULL,
    CONSTRAINT fk1 FOREIGN KEY (DNumero_Departamento) REFERENCES Departamento (DNumero) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Dependente
(
	SSN_Empregado INT NOT NULL,
    Nome_Dependente VARCHAR(45) NOT NULL,
    Sexo BIT,
    DataNasc DATE,
    Parentesco VARCHAR(45) NOT NULL,
    PRIMARY KEY (SSN_Empregado, Nome_Dependente),
    CONSTRAINT fk1 FOREIGN KEY (SSN_Empregado) REFERENCES Empregado (SSN) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Depto_Localizacoes
(
	LNumero INT PRIMARY KEY NOT NULL,
    DLocalizacao VARCHAR(45),
    DNumero_Departamento INT NOT NULL,
    CONSTRAINT fk1 FOREIGN KEY (DNumero_Departamento) REFERENCES Departamento(DNumero) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Trabalha_Em
(
	SSN_Empregado INT NOT NULL,
    PNumero_Projeto INT NOT NULL,
    Horas INT,
    PRIMARY KEY (SSN_Empregado, PNumero_Projeto),
    CONSTRAINT fk1 FOREIGN KEY (SSN_Empregado) REFERENCES Empregado(SSN) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk1 FOREIGN KEY (PNumero_Projeto) REFERENCES Projeto(PNumero) ON DELETE SET NULL ON UPDATE CASCADE
);
