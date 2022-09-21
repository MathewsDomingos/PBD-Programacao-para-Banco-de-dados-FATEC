CREATE DATABASE CONSTRUTORA;
GO
USE CONSTRUTORA;
GO
CREATE TABLE FUNCIONARIO(
	CODIGO INT NOT NULL IDENTITY(1,1),
	NOME VARCHAR(50) NOT NULL,
	DATA_NASCIMENTO DATE NOT NULL,
	CPF CHAR(11) NOT NULL,
	EMAIL VARCHAR(50) NULL,
	SEXO CHAR(1) NOT NULL,
	SALARIO MONEY NOT NULL,
	CIDADE VARCHAR(50) NOT NULL,
	UF CHAR(2) NOT NULL,
	DATA_HORA_CADASTRO DATETIME NULL,
	ATIVO BIT NULL,
	CONSTRAINT PK_FUNCIONARIO PRIMARY KEY(CODIGO)
);
GO
CREATE TABLE DEPENDENTE(
	NOME VARCHAR(50) NOT NULL,
	DATA_NASCIMENTO DATE NOT NULL,
	EMAIL VARCHAR(50) NULL,
	PARENTESCO VARCHAR(20) NOT NULL,
	COD_FUNCIONARIO INT NOT NULL,
	CONSTRAINT FK_DEPENDENTE_FUNCIONARIO FOREIGN KEY(COD_FUNCIONARIO) 
		REFERENCES FUNCIONARIO(CODIGO)
);
GO
CREATE TABLE PROJETO(
	CODIGO INT NOT NULL IDENTITY(1,1),
	NOME VARCHAR(50) NOT NULL,
	DATA_INICIO DATE NOT NULL,
	DATA_TERMINO DATE NULL,
	VALOR MONEY NULL,
	COD_FUNC_GER INT NOT NULL,
	CONSTRAINT PK_PROJETO PRIMARY KEY(CODIGO),
	CONSTRAINT FK_PROJETO_FUNCIONARIO FOREIGN KEY(COD_FUNC_GER)
		REFERENCES FUNCIONARIO(CODIGO)
);
GO
CREATE TABLE FUNCIONARIO_PROJETO(
	CODIGO INT NOT NULL IDENTITY(1,1),
	COD_FUNCIONARIO INT NOT NULL,
	COD_PROJETO INT NOT NULL,
	DATA_ENTRADA DATE NOT NULL,
	DATA_SAIDA DATE NULL,
	NUM_HORAS_TRAB FLOAT NOT NULL,
	CONSTRAINT PK_FUNCIONARIO_PROJETO PRIMARY KEY(CODIGO),
	CONSTRAINT FK_FUNCIONARIO_PROJETO_FUNCIONARIO FOREIGN KEY(COD_FUNCIONARIO)
		REFERENCES FUNCIONARIO(CODIGO),
	CONSTRAINT FK_FUNCIONARIO_PROJETO_PROJETO FOREIGN KEY(COD_PROJETO)
		REFERENCES PROJETO(CODIGO)
);