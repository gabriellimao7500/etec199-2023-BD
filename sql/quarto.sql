CREATE DATABASE clinica_medica;

USE clinica_medica;

DROP DATABASE clinica_medica

GO

CREATE TABLE tbl_paciente (
    nome varchar(100) NOT NULL,
    endereco varchar(200) NOT NULL,
    telefone varchar(15) NOT NULL,
    numeroBeneficiario int NOT NULL IDENTITY(540, 5),
    doencasPrevias varchar(100) NOT NULL,
    remedioDeUsoContinuo varchar(100) NOT NULL,
    PRIMARY KEY(numeroBeneficiario)
);

INSERT INTO tbl_paciente (nome, endereco, telefone, doencasPrevias, remedioDeUsoContinuo)
VALUES
    ('Matheus Tilambucano', 'Rua das Flores, 123, São Paulo', '(11) 98765-4321', 'Canser de Próstata', 'Docetaxel'),
    ('Gabriel Qué ketchup', 'Avenida Principal, 456, Rio de Janeiro', '(21) 99999-8888', 'Artrite Reumatoide', 'Metotrexato'),
    ('Euba Tiuma', 'Praça Central, 789, Curitiba', '(41) 98765-1234', 'Diabetes Tipo 2', 'Insulina'),
    ('Thomas Turbando', 'Alameda das Árvores, 987, Belo Horizonte', '(31) 5555-5555', 'Enxaqueca', 'Sumatriptana'),
    ('Róger Guedes', 'Rua da Paz, 567, Porto Alegre', '(51) 8765-4321', 'Asma Crônica', 'Prednisona');

CREATE TABLE tbl_especialidade (
    nome varchar(100) NOT NULL,
    numeroRegistro int NOT NULL IDENTITY(5000, 1053),
    publicoAlvo varchar(100) NOT NULL,
    PRIMARY KEY(numeroRegistro)
);

INSERT INTO tbl_especialidade (nome, publicoAlvo)
VALUES
    ('Oftalmologista', 'Pessoas com problemas de visão'),
    ('Ortopedista', 'Pessoas com problemas ortopédicos'),
    ('Demartologista', 'Pessoas com Problema de pele'),
    ('Ginecologista', 'Mulheres com saúde reprodutiva'),
    ('Cardiologista', 'Pessoas com problemas cardíacos');

CREATE TABLE tbl_agendamento (
    numeroAgendamento int NOT NULL IDENTITY(52151, 1506),
    data date NOT NULL,
    hora time NOT NULL,
    queixa varchar(100) NOT NULL,
    gravidade int NOT NULL,
    PRIMARY KEY(numeroAgendamento)
);

INSERT INTO tbl_agendamento (data, hora, queixa, gravidade)
VALUES
    ('2023-09-16', '10:15', 'Tosse persistente e falta de ar', 7),
    ('2023-09-18', '09:00', 'Lesão no joelho após queda', 6),
    ('2023-09-17', '16:45', 'Dor abdominal aguda', 8),
    ('2008-02-24', '11:20', 'Dor de cabeça e vômito', 5),
    ('2023-09-15', '14:30', 'Febre alta e dor no peito', 9);

CREATE TABLE tbl_medico (
    nome varchar(100) NOT NULL,
    endereco varchar(200) NOT NULL,
    telefone varchar(18) NOT NULL,
    crm varchar(13) NOT NULL,
    numeroRegistro int NOT NULL IDENTITY(5000, 1053),
    PRIMARY KEY(crm),
    FOREIGN KEY(numeroRegistro) REFERENCES tbl_especialidade(numeroRegistro)
);

INSERT INTO tbl_medico (nome, endereco, telefone, crm)
VALUES
    ('Everson Silva', 'Avenida Central, 456', '(34) 56789-0123', 'CRM/MG 246813'),
    ('Gabriel Gueto', 'Travessa dos Sonhos, 789', '(56) 78901-2345', 'CRM/BA 753951'),
    ('Anderson Ortiz', 'Alameda dos Vales, 222', '(90) 12345-6789', 'CRM/PR 531486'),
    ('Roger Pinto', 'Rua das Flores, 123', '(12) 34567-8901', 'CRM/RJ 987654'),
    ('Matheus Anjos', 'Praça da Liberdade, 1010', '(78) 90123-4567', 'CRM/RS 864209');

CREATE TABLE tbl_consulta (
    numeroConsulta int NOT NULL IDENTITY(1515, 656),
    data date NOT NULL,
    hora time NOT NULL,
    numeroBeneficiario int,
    crm varchar(13) NOT NULL,
    numeroAgendamento int NOT NULL,
    PRIMARY KEY(numeroConsulta),
    FOREIGN KEY(numeroBeneficiario) REFERENCES tbl_paciente(numeroBeneficiario),
    FOREIGN KEY(crm) REFERENCES tbl_medico(crm),
    FOREIGN KEY(numeroAgendamento) REFERENCES tbl_agendamento(numeroAgendamento)
);

INSERT INTO tbl_consulta (data, hora, crm, numeroAgendamento, numeroBeneficiario)
VALUES
    ('2023-09-18', '09:00', 'CRM/PR 531486', 52151, 540),
    ('2023-11-25', '10:20', 'CRM/BA 753951', 53657, 545),
    ('2010-02-24', '11:20', 'CRM/RJ 987654', 55163, 550),
    ('2005-04-28', '11:30', 'CRM/MG 246813', 56669, 555),
    ('2000-11-20', '10:30', 'CRM/RS 864209', 58175, 560);

-- EXECUÇÃO DE TABELAS
SELECT * FROM tbl_paciente;
SELECT * FROM tbl_especialidade;
SELECT * FROM tbl_agendamento;
SELECT * FROM tbl_medico;
SELECT * FROM tbl_consulta;
