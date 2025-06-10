CREATE DATABASE IF NOT EXISTS clinica_db;
USE clinica_db;

-- DDL
/*
Uma clínica médica deseja informatizar o cadastro de seus pacientes e os atendimentos
realizados. Cada paciente tem CPF, nome completo, data de nascimento e plano de saúde (que
pode ser nulo). Os atendimentos são registrados com data, tipo de atendimento (consulta,
exame, retorno), e o nome do médico responsável.

• Cada paciente pode ter vários atendimentos.
• O campo plano_saude deve ter um valor padrão "Particular".
• O campo tipo_atendimento deve aceitar apenas os valores: consulta, exame, retorno.
*/

CREATE TABLE paciente (
	CPF CHAR(11) PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    plano_saude VARCHAR(50) DEFAULT 'Particular'
);

CREATE TABLE atendimento (
	Id_Atendimento INT AUTO_INCREMENT PRIMARY KEY,
	data_atendimento DATE NOT NULL,
    medico_responsavel VARCHAR(100) NOT NULL,
    tipo_atendimento VARCHAR(20) NOT NULL,
    CHECK (tipo_atendimento IN('consulta', 'exame', 'retorno')),
    cpf_paciente CHAR(11),
    FOREIGN KEY (cpf_paciente) REFERENCES paciente(CPF)
);

-- INSERTS
-- Insira no mínimo 5 pacientes e 5 atendimentos (com pelo menos 2 pacientes com mais de 1 atendimento).

INSERT INTO paciente (CPF, nome_completo, data_nascimento, plano_saude) VALUES
(11111111111, 'João Pereira', '1999-07-22', 'Particular'),
(22222222222, 'Maria Gabriela', '1987-11-24', 'Unimed'),
(33333333333, 'Carla Dias', '2004-11-12', NULL),
(44444444444, 'Roberto Carlos', '1952-08-05', 'Amil'),
(55555555555, 'Pedro Antonio', '2018-03-10', NULL);

INSERT INTO atendimento (cpf_paciente, data_atendimento, tipo_atendimento, medico_responsavel) VALUES
(11111111111, '2025-01-10', 'consulta', 'Dra. Bianca'),
(11111111111, '2025-02-20', 'retorno', 'Dra. Bianca'),
(22222222222, '2025-02-06', 'exame', 'Dr. Carlos'),
(33333333333, '2025-03-12', 'consulta', 'Dr. Nero'),
(33333333333, '2025-04-29', 'retorno', 'Dr. Nero');

-- Altere o nome de um paciente via UPDATE

UPDATE paciente
SET nome_completo = 'Joana Silveira'
WHERE CPF = '11111111111';

-- Remova um atendimento via DELETE

DELETE FROM atendimento
WHERE Id_Atendimento = 2;



