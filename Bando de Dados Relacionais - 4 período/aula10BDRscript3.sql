CREATE DATABASE IF NOT EXISTS biblioteca_escolar;
USE biblioteca_escolar;

/*
A biblioteca de uma escola precisa organizar seus dados. Os livros têm título, autor, ano
de publicação e código ISBN. A biblioteca também registra os empréstimos de livros, que
incluem a data de retirada, a data de devolução prevista e o nome do aluno.
•Os livros não podem ter anos de publicação menores que 1900.
•Cada empréstimo deve estar relacionado a um único livro.
•Nenhum campo em emprestimos pode ficar vazio.
*/

-- DDL

CREATE TABLE IF NOT EXISTS livros (
	ISBN INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    ano_publicacao INT CHECK (ano_publicacao >= 1900)
);

CREATE TABLE IF NOT EXISTS emprestimos (
	id_emprestimos INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    data_retirada DATE NOT NULL,
    data_devolucao_prevista DATE NOT NULL,
    isbn_livro INT,
    FOREIGN KEY (isbn_livro) REFERENCES livros (ISBN)
);

-- INSERTS

INSERT INTO livros (titulo, autor, ano_publicacao) VALUES
('SQL Guia Prático', 'Alice Zhao', '2022'),
('Entendendo Algoritmos', 'Aditya Y. Bhargava', '2021'),
('Novembro de 63', 'Stephen King', '2011'),
('Ainda Estou Aqui', 'Marcelo Rubens Paiva', '2015'),
('Código Limpo', 'Robert C. Martin', '2009');

INSERT INTO emprestimos (nome_aluno, data_retirada, data_devolucao_prevista, isbn_livro) VALUES
('Pedro Antonio', '2025-03-14', '2025-04-01', 1),
('Gabriel Guedes', '2025-05-10', '2025-05-29', 2),
('Amanda Silva', '2025-08-08', '2025-08-15', 3),
('Joana Lima', '2021-12-02', '2021-12-25', 4),
('Vincente Gomes', '2025-01-26', '2025-02-04', 5);

-- Atualize a data de devolução prevista de um empréstimo.

UPDATE emprestimos
SET data_devolucao_prevista = '2025-04-10'
WHERE id_emprestimos = 1;

-- Delete um empréstimo realizado antes de 2022

DELETE FROM emprestimos 
WHERE data_retirada < '2022-01-01';


