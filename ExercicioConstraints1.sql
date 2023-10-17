CREATE DATABASE livraria

USE livraria

CREATE TABLE livro(
codigo					INT				NOT NULL	IDENTITY(100001,100),
nome					VARCHAR(200)	NOT NULL,
lingua					VARCHAR(10)		NOT NULL	DEFAULT('PT-BR'),
ano						INT				NOT NULL	CHECK(ano >= 1990)
PRIMARY KEY (codigo)
)

CREATE TABLE autor(
ID_autor				INT				NOT NULL	IDENTITY(2351,1),
nome					VARCHAR(100)	NOT NULL	UNIQUE,
data_nasc				DATE			NOT NULL,
pais_nasc				VARCHAR(50)		NOT NULL	CHECK(UPPER(pais_nasc) = 'BRASIL' OR UPPER(pais_nasc) = 'ESTADOS UNIDOS' OR 
														  UPPER(pais_nasc) = 'INGLATERRA' OR UPPER(pais_nasc) = 'ALEMANHA'),
biografia				VARCHAR(255)	NOT NULL
PRIMARY KEY (ID_autor)
)

CREATE TABLE editora(
ID_editora				INT				NOT NULL	IDENTITY(491, 16),
nome					VARCHAR(70)		NOT NULL	UNIQUE,
telefone				CHAR(10)		NOT NULL	CHECK(LEN(telefone) = 10),
logradouro_endereco		VARCHAR(200)	NOT NULL,
numero_endereco			INT				NOT NULL	CHECK(numero_endereco >= 0),
CEP_endereco			CHAR(8)			NOT NULL	CHECK(LEN(CEP_endereco) = 8),
complemento_endereco	VARCHAR(255)	NOT NULL
PRIMARY KEY (ID_editora)
)

CREATE TABLE edicao(
ISBN					CHAR(13)		NOT NULL	CHECK(LEN(ISBN) = 13),
preco					DECIMAL(4,2)	NOT NULL	CHECK(preco >= 0),
ano						INT				NOT NULL	CHECK(ano >= 1993),
numero_paginas			INT				NOT NULL	CHECK(numero_paginas >= 15),
qtd_estoque				INT				NOT NULL
PRIMARY KEY (ISBN)
)

CREATE TABLE livro_autor(
livrocodigo				INT				NOT NULL,
autorID_autor			INT				NOT NULL
PRIMARY KEY (livrocodigo, autorID_autor)
FOREIGN KEY (livrocodigo) REFERENCES livro(codigo),
FOREIGN KEY (autorID_autor) REFERENCES autor(ID_autor)
)

CREATE TABLE editora_edicao_livro(
editoraID_editora		INT				NOT NULL,
edicaoISBN				CHAR(13)		NOT NULL,
livrocodigo				INT				NOT NULL
PRIMARY KEY (editoraID_editora, edicaoISBN, livrocodigo)
FOREIGN KEY (editoraID_editora) REFERENCES editora(ID_editora),
FOREIGN KEY (edicaoISBN) REFERENCES edicao(ISBN),
FOREIGN KEY (livrocodigo) REFERENCES livro(codigo)
)