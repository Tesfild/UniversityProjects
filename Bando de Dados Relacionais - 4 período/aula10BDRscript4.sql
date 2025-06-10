CREATE DATABASE IF NOT EXISTS eventos_universitarios;
USE eventos_universitarios;

/*
 A Univassouras quer criar um sistema para gerenciar eventos acadêmicos. O sistema precisa
armazenar:
•Professores, identificados por CPF, nome, área e departamento.
•Eventos, com código, nome do evento, tipo (palestra, oficina, seminário), e data.
•Participações, onde cada professor pode participar de vários eventos, com um papel: palestrante,
organizador ou ouvinte.
Regras:
•A participação de um professor em um evento deve ser única (professor não pode se inscrever mais
de uma vez no mesmo evento).
•O tipo do evento deve ser validado com CHECK.
•O papel na participação também deve ser validado com CHECK.
*/

-- DDL

CREATE TABLE IF NOT EXISTS  professores (
	CPF CHAR(11) PRIMARY KEY,
    nome_professor VARCHAR(100) NOT NULL,
    area VARCHAR(100) NOT NULL,
    departamento VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS eventos (
	id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nome_evento VARCHAR(100) NOT NULL,
    tipo_evento VARCHAR(100) CHECK
		(tipo_evento IN ('palestra', 'oficina', 'seminario')),
	data_evento DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS participacoes (
    cpf_professor CHAR(11),
    id_evento INT,
    papel VARCHAR(20) CHECK
		(papel IN ('palestrante', 'organizador', 'ouvinte')),
    PRIMARY KEY (cpf_professor, id_evento),
    FOREIGN KEY (cpf_professor) REFERENCES professores (CPF),
    FOREIGN KEY (id_evento) REFERENCES eventos (id_evento)
);

-- INSERTS

-- Professor
INSERT INTO professores (CPF, nome_professor, area, departamento) VALUES
('11111111111', 'Jorge Augusto', 'Literatura', 'Letras'),
('22222222222', 'Helena Matos', 'Matemática', 'Exatas'),
('33333333333', 'Caleb Souza', 'Computação', 'Tecnologia'),
('44444444444', 'Regina Célia', 'História', 'Humanas'),
('55555555555', 'Marcos André', 'Biologia', 'Biológicas');

-- Eventos
INSERT INTO eventos (nome_evento, tipo_evento, data_evento) VALUES
('Oficina de Escrita', 'oficina', '2025-07-13'),
('Seminário de Pesquisa', 'seminario', '2025-09-20'),
('Palestra de IA', 'palestra', '2025-11-12'),
('Semana das Engenharias', 'palestra', '2025-06-04'),
('Oficina de Robótica', 'oficina', '2025-02-05');

-- Participações
INSERT INTO participacoes (cpf_professor, id_evento, papel) VALUES
('11111111111', 1, 'organizador'),
('22222222222', 2, 'organizador'),
('33333333333', 3, 'palestrante'),
('33333333333', 4, 'palestrante'),
('22222222222', 5, 'ouvinte'),
('44444444444', 1, 'organizador'),
('55555555555', 2, 'ouvinte');

-- Atualizar o papel de um professor em um evento
UPDATE participacoes
SET papel = 'organizador'
WHERE cpf_professor = '55555555555' AND id_evento = 3;

-- Remover um professor que participou como ouvinte
DELETE FROM participacoes
WHERE papel = 'ouvinte' AND cpf_professor = '22222222222';
