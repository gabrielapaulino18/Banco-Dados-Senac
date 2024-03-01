CREATE SCHEMA IF NOT EXISTS SistemaDeLocalidades;

USE SistemaDeLocalidades;

CREATE TABLE IF NOT EXISTS Estado (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Uf VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cidade (
 Id INT AUTO_INCREMENT PRIMARY KEY,
 Nome VARCHAR(50) NOT NULL,
 Estado_ID INT,
 FOREIGN KEY (Estado_ID) REFERENCES ESTADO(Id)
);

SELECT * FROM CIDADE;
SELECT * FROM ESTADO;

INSERT INTO Estado (Nome, Uf) VALUES
	('São Paulo', 'SP'),
    ('Rio De Janeiro', 'RJ'),
    ('Bahia', 'BA');
    
INSERT INTO Cidade(Nome, Estado_ID) VALUES 
	('São Paulo', 1),
    ('Campinas', 1),
    ('Rio De Janeiro', 2),
    ('Niterói', 2),
    ('Salvador', 3),
    ('Fira de Santana', 3);
    
-- Inserção de Cidades Fictícias sem Estado    
INSERT INTO CIDADE (Nome, Estado_ID) VALUES
	('Gotham City', NULL),
	('Metropolis', NULL),
	('Wonderland', NULL),
	('Neverland', NULL);
        
-- ------------------------
-- Consultas SQL com JOINs
-- ------------------------

SELECT Cidade.ID, Cidade.Nome, Estado.Nome AS NomeEstado, Estado.Uf AS UF
FROM CIDADE
INNER JOIN ESTADO ON CIDADE.Estado_ID = ESTADO.ID;

CREATE TABLE IF NOT EXISTS Prefeito (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    DataPosse DATE NOT NULL
);

ALTER TABLE Cidade
	ADD COLUMN Prefeito_ID INT,
    ADD FOREIGN KEY (Prefeito_ID) REFERENCES PREFEITO(id);
    
INSERT INTO PREFEITO (Nome, DataPosse) VALUES
	('Maria', '2024-01-01'),
    ('Jaco', '2023-01-01'),
    ('Carlos Santos', '2021-01-01');
   
    
UPDATE Cidade 
SET Prefeito_ID = 2
WHERE ID = 5;

UPDATE Cidade 
SET Prefeito_ID = 3
WHERE ID = 4;

UPDATE Cidade 
SET Prefeito_ID = 2
WHERE ID = 3;

UPDATE Cidade 
SET Prefeito_ID = 1
WHERE ID = 2;

UPDATE Cidade 
SET Prefeito_ID = 2
WHERE ID = 1;

UPDATE Cidade 
SET Prefeito_ID = 1
WHERE ID = 6;
	
SELECT * FROM prefeito;
SELECT * FROM CIDADE;
SELECT * FROM ESTADO;
 
SELECT CIDADE.Nome AS Cidade, Prefeito.Nome AS Prefeito, Estado.uf AS UF
FROM CIDADE
LEFT JOIN  PREFEITO ON CIDADE.Prefeito_ID = PREFEITO.ID
INNER JOIN ESTADO ON Cidade.Estado_ID = ESTADO.ID;