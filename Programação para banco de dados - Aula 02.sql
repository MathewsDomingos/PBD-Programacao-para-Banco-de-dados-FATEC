
-- CRIANDO BANCO DE DADOS
CREATE DATABASE MATEUSDOMINGOS_LIVRARIA;
GO -- (GO) EXECUTA AS DEMAIS LINHAS APENS QUANDO AS LINHAS DE CIMA FOREM EXECUTADAS

-- SELECIONA O BANCO
USE MATEUSDOMINGOS_LIVRARIA;
GO

-- CRIA AS TABELAS
CREATE TABLE EDITORA(
	CODIGO INT NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	CONSTRAINT PK_EDITORA PRIMARY KEY(CODIGO)
);

GO
CREATE TABLE ASSUNTO(
	SIGLA CHAR(3) NOT NULL,
	DESCRICAO VARCHAR(50) NOT NULL,
	CONSTRAINT PK_ASSUNTO PRIMARY KEY(SIGLA)
);

GO
CREATE TABLE AUTOR(
	MATRICULA INT NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	DATA_NASCIMENTO DATE NULL,
	NACIONALIDDE VARCHAR(50) NULL,
	CONSTRAINT PK_AUTOR PRIMARY KEY(MATRICULA)
)

GO
CREATE TABLE LIVRO(
	CODIGO INT NOT NULL,
	TITULO VARCHAR(50) NOT NULL,
	DATA_LANCAMENTO DATE NULL,
	VALOR MONEY NULL,
	COD_EDITORA INT NOT NULL,
	SIGLA_ASSUNTO CHAR(3) NOT NULL,
	DATA_HORA_CADASTRO DATETIME NOT NULL DEFAULT GETDATE(),
	ATIVO BIT NOT NULL DEFAULT 1,
	CONSTRAINT PK_LIVRO PRIMARY KEY(CODIGO),
	CONSTRAINT FK_LIVRO_EDITORA FOREIGN KEY(COD_EDITORA) REFERENCES EDITORA(CODIGO),
	CONSTRAINT FK_LIVRO_ASSUNTO FOREIGN KEY(SIGLA_ASSUNTO) REFERENCES ASSUNTO(SIGLA)
);

GO
CREATE TABLE AUTORIA(
	COD_LIVRO INT NOT NULL,
	MAT_AUTOR INT NOT NULL, 
	CONSTRAINT FK_AUTORIA PRIMARY KEY(COD_LIVRO,MAT_AUTOR), --CHAVE PRIM�RIA CONPOSTA
	CONSTRAINT FK_AUTORIA_LIVRO FOREIGN KEY(MAT_AUTOR) REFERENCES AUTOR(MATRICULA)
);