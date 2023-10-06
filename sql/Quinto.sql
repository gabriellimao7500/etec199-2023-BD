CREATE DATABASE db_dados

DROP DATABASE db_dados


USE db_dados
GO

CREATE TABLE dados_tbl(
	nome VARCHAR(100) NOT NULL,
	cargo VARCHAR(100),
	nascimento DATE NOT NULL,
	taxa_presenca FLOAT NOT NULL,
	salario_base FLOAT NOT NULL,
	avaliacao FLOAT NOT NULL
)

INSERT INTO dados_tbl 
VALUES
    ('João Maria de Jesus', 'Administrativo', '1978-07-23', 80.2, 10600, 8.7),
    ('Felipe dos Santos', 'Técnico', '1988-11-02', 90, 18200, 5.6),
    ('Maria José Silva', 'Técnico', '1990-12-23', 87.3, 15000, 4.5),
    ('José Silva', 'Administrativo', '1978-12-23', 60, 16200, 9.3),
    ('Mário Antunes', 'RH', '1977-02-11', 54.2, 8000, 7.2),
    ('Paulo Roberto Silva', 'RH', '1976-10-13', 87.2333, 8900, 9.9),
    ('Teresa Jardim', 'RH', '1980-01-13', 100, 4000, 7.7),
    ('Roberto Carlos Alves', 'RH', '1983-12-10', 23.64, 4000, 7.7),
    ('Paulo Jardim', 'RH', '1945-06-28', 34.89, 30500, 10),
    ('Maria Eduarda Carvalho da Rosa', 'Administrativo', '1970-08-30', 90.78, 9000, 6.6),
    ('Pedro Henrique Teixeira', 'Técnico', '1978-12-23', 100, 7400, 7.2);


	SELECT * FROM dados_tbl

	SELECT nome AS 'Nome', SUBSTRING(CAST(taxa_presenca AS VARCHAR(10)), 1, 10) + '%' AS 'Taxa de Presença', 'R$' + SUBSTRING(CAST(salario_base AS VARCHAR(6)), 1, 6) AS 'Salario Base' FROM dados_tbl
	ORDER BY taxa_presenca DESC;
	
	
	CREATE TABLE tbl_departamento (
	
	nome		varchar(100) NOT NULL,
	numero		int NOT NULL identity (1,1),
	rg_gerente	int NOT NULL,

	PRIMARY KEY (numero)
	)

	DROP TABLE tbl_departamento

	INSERT INTO tbl_departamento 
	VALUES 
	('Cotabilidade', '101010'),
	('Engenharia mecânica', '303030'),
	('Engenharia civil', '202020');

	SELECT * FROM tbl_departamento;

	CREATE TABLE tbl_empregado (
	nome varchar(150) NOT NULL,
	rg int NOT NULL,
	cpf int NOT NULL,
	departamento int NOT NULL,
	rg_supervisor int,
	salario varchar(9) NOT NULL,
	PRIMARY KEY(rg),
	FOREIGN KEY(departamento) REFERENCES tbl_departamento(numero)
)
DROP TABLE tbl_empregado

INSERT INTO tbl_empregado 
VALUES
	('João Luiz', 10101010, 11111111, 1, NULL, '3.000,00'),
	('Fernando', 20202020, 22222222, 2, 10101010, '2.500,00'),
	('Ricardo', 30303030, 33333333, 2, 10101010, '2.300,00'),
	('Jorge', 40404040, 44444444, 2, 20202020, '4.200,00'),
	('Renato', 50505050, 55555555, 3, 20202020, '1.300,00');
 
SELECT * FROM tbl_empregado

SELECT nome AS 'Nome', 
	   SUBSTRING(CAST(rg AS VARCHAR(8)), 1, 2) + '.' + SUBSTRING(CAST(rg AS VARCHAR(8)), 3, 3) + '.' + SUBSTRING(CAST(rg AS VARCHAR(8)),7,2) + '-' + SUBSTRING(CAST(rg AS VARCHAR(8)),8,1) AS 'RG',
	   SUBSTRING(CAST(cpf AS VARCHAR(11)), 1, 3) + '.' +SUBSTRING(CAST(cpf AS VARCHAR(11)),3,3) + '.' + SUBSTRING(CAST(cpf AS VARCHAR(11)),6,3) + '' + SUBSTRING(CAST(cpf AS VARCHAR(11)),9,2) +'/SP' AS 'CPF' 
FROM tbl_empregado ORDER BY CPF

