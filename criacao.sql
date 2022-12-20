CREATE DATABASE banco_trabalho02;
GO

USE banco_trabalho02;
GO

CREATE TABLE Pais (
	sigla CHAR(2) PRIMARY KEY,
	nome VARCHAR(60) NOT NULL,
);

CREATE TABLE Cliente (
	nif CHAR(9) PRIMARY KEY,
	pnome VARCHAR(40) NOT NULL,
	unome VARCHAR(40) NOT NULL,
	siglaPais CHAR(2) FOREIGN KEY REFERENCES Pais(sigla),
);

CREATE TABLE Banco (
	idBanco INT IDENTITY PRIMARY KEY,
	designacao VARCHAR(40) NOT NULL,
	siglaPais CHAR(2) FOREIGN KEY REFERENCES Pais(sigla),
);

CREATE TABLE Conta (
	nib CHAR(21) PRIMARY KEY,
	saldo MONEY NOT NULL,
	dataAbertura DATE NOT NULL,
	dataFecho DATE,
	idBancoConta INT FOREIGN KEY REFERENCES Banco(idBanco),
);

CREATE TABLE TipoMovimento (
	codigo INT IDENTITY PRIMARY KEY,
	descricao VARCHAR(250) NOT NULL,
);

CREATE TABLE Titular (
	nifCliente CHAR(9) FOREIGN KEY REFERENCES Cliente(nif),
	nibConta CHAR(21) FOREIGN KEY REFERENCES Conta(nib),
	ordem INT NOT NULL,
	PRIMARY KEY (nifCliente, nibConta),
);

CREATE TABLE Movimento (
	nibContaOrigem CHAR(21) FOREIGN KEY REFERENCES Conta(nib),
	nibContaDestino CHAR(21) FOREIGN KEY REFERENCES Conta(nib),
	codigoTipoMovimento INT FOREIGN KEY REFERENCES TipoMovimento(codigo),
	dataHora DATETIME NOT NULL,
	quantia MONEY NOT NULL,
	PRIMARY KEY(nibContaOrigem, nibContaDestino, codigoTipoMovimento, dataHora),
);
