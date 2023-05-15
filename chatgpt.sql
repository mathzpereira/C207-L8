CREATE TABLE produto (
  id_produto INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  marca VARCHAR(255) NOT NULL,
  tipo VARCHAR(255) NOT NULL,
  preco DECIMAL(10, 2) NOT NULL,
  quantidade_estoque INT NOT NULL,
  PRIMARY KEY (id_produto)
);

CREATE TABLE loja (
  id_loja INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(255),
  PRIMARY KEY (id_loja)
);

CREATE TABLE cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  cpf VARCHAR(11) NOT NULL,
  nome VARCHAR(255) NOT NULL,
  cep VARCHAR(8) NOT NULL,
  email VARCHAR(255) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  telefone VARCHAR(20),
  PRIMARY KEY (id_cliente),
  UNIQUE KEY (cpf)
);

CREATE TABLE compra (
  id_compra INT NOT NULL AUTO_INCREMENT,
  valor_total DECIMAL(10, 2) NOT NULL,
  tipo_pagamento VARCHAR(255) NOT NULL,
  codigo_rastreamento VARCHAR(255) NOT NULL,
  id_cliente INT NOT NULL,
  id_correio INT NOT NULL,
  PRIMARY KEY (id_compra),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_correio) REFERENCES correio(id_correio)
);

CREATE TABLE correio (
  id_correio INT NOT NULL AUTO_INCREMENT,
  prazo_entrega INT NOT NULL,
  valor_frete DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (id_correio)
);

CREATE TABLE avaliacao (
  id_avaliacao INT NOT NULL AUTO_INCREMENT,
  nota INT NOT NULL,
  texto VARCHAR(255),
  id_cliente INT NOT NULL,
  id_produto INT NOT NULL,
  PRIMARY KEY (id_avaliacao),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE compra_produto (
  id_compra INT NOT NULL,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  PRIMARY KEY (id_compra, id_produto),
  FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE produto_avaliacao (
  id_produto INT NOT NULL,
  id_avaliacao INT NOT NULL,
  PRIMARY KEY (id_produto, id_avaliacao),
  FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
  FOREIGN KEY (id_avaliacao) REFERENCES avaliacao(id_avaliacao)
);
