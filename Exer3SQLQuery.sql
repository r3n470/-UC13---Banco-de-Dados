--DDL *********************************************

CREATE DATABASE RpgDB
USE RpgDB
CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY, 
	Email VARCHAR(100) UNIQUE NOT NULL, 
	Senha VARCHAR(50) NOT NULL,	
)

CREATE TABLE Classes (
	IdClasse INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) UNIQUE NOT NULL,
	Descricao VARCHAR (255)
)

CREATE TABLE Personagens (
	IdPersonagem INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) UNIQUE NOT NULL,
	IdUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios (IdUsuario),
	IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse)
)


CREATE TABLE Habilidade (
	IdHabilidade INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (100) UNIQUE NOT NULL,
	Descricao VARCHAR (255)
)


CREATE TABLE ClassesHabilidade(
	IdClasse INT FOREIGN KEY REFERENCES Classes (IdClasse),
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidade (IdHabilidade)
)


--DML *********************************************
INSERT INTO Usuarios (Senha, Email) VALUES (12345678, 'email@email.com') -- aqui foi colocado informa�oes entre paresentes pois a ordem dos VALUES est�o alteradas em rela��o ao que foi informado
INSERT INTO Classes VALUES ('B�rbaro', 'Descri��o da classe B�rbaro')
INSERT INTO Habilidade VALUES ('Lan�a Mortal','Descri��o da Lan�a Mortal'), ('Escudo Supremo', 'Descri��o do Escudo Supremo')
INSERT INTO Personagens VALUES ('DeuBug', 1, 1)
INSERT INTO ClassesHabilidade VALUES (1, 1), (1, 2)

INSERT INTO Usuarios VALUES ('email2@email.com', 12345678,) -- aqui a ordem dos VALUES foi colocado corretamente, n�o precisando especificar entre parenteses
INSERT INTO Classes VALUES ('Monge', 'Descri��o da classe Monge')
INSERT INTO Habilidade VALUES ('Recuperar Vida','Descri��o de Recuperar Vida')
INSERT INTO Personagens VALUES ('BitBug', 2, 2)
INSERT INTO ClassesHabilidade VALUES (2, 2), (2, 3)

--add usuario para testar del
INSERT INTO Usuarios (Senha, Email) VALUES (13345678, 'emailDELETE@email.com') -- aqui foi colocado informa�oes entre paresentes pois a ordem dos VALUES est�o alteradas em rela��o ao que foi informado
INSERT INTO Classes VALUES ('Terr�vel', 'Descri��o da classe Terr�vel')
INSERT INTO Habilidade VALUES ('Lan�a Mortal','Descri��o da Lan�a Mortal'), ('Escudo Supremo', 'Descri��o do Escudo Supremo')
INSERT INTO Personagens VALUES ('Terrible', 1, 1)
INSERT INTO ClassesHabilidade VALUES (1, 1), (1, 2)




UPDATE Usuarios 
SET Senha = 87654321 
WHERE IdUsuario = 1

ALTER TABLE Usuarios  
ADD Nomes VARCHAR (20) NULL;--para adicionar coluna


ALTER TABLE Usuarios 
DROP COLUMN Nomes; --para excluir coluna

UPDATE Usuarios  -- PARA ADD USUARIO NA NOVA COLUNA NOMES
SET Nomes = 'Aphonso'
WHERE IdUsuario = 1

UPDATE Usuarios  -- PARA ADD USUARIO NA NOVA COLUNA NOMES
SET Nomes = 'Danox'
WHERE IdUsuario = 2


--EXCLUINDO USUARIO
DELETE FROM Usuarios
WHERE IdUsuario = 4

--EXCLUINDO CLASSE

DELETE FROM Classes
WHERE IdClasse = 3

--DQL *********************************************
SELECT * FROM Usuarios
SELECT Senha, Email FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidade
SELECT * FROM Personagens
SELECT * FROM ClassesHabilidade


--jun��o selecionando tudo
SELECT * FROM Personagens
INNER JOIN Classes    -- para relacionar conte�do de duas tabelas
ON Personagens.IdClasse = Classes.IdClasse

SELECT Personagens.Nome, Classes.Nome 'Classe', Classes.Descricao FROM Personagens
INNER JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse


-- SIMPLIFICANDO OS COMANDOS COM "ABREVIA��ES ATRAV�S DO "AS"
SELECT P.Nome, C.Nome 'Classe', C.Descricao FROM Personagens AS P
INNER JOIN Classes C
ON P.IdClasse = C.IdClasse

