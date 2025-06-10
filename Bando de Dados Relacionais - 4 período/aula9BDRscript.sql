CREATE DATABASE IF NOT EXISTS Biblioteca_Nova_Esperanca;
USE Biblioteca_Nova_Esperanca;

-- DDL

CREATE TABLE livros (
	ISBN CHAR(5) PRIMARY KEY,
    autor VARCHAR(50) NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    editora VARCHAR(50) NOT NULL,
    ano_publicacao INT NOT NULL
);

CREATE TABLE alunos (
	Matricula CHAR(9) PRIMARY KEY,
    nome VARCHAR(50),
    curso VARCHAR(50),
    data_nascimento DATE
);

CREATE TABLE exemplar (
	Id_exemplar VARCHAR(2) PRIMARY KEY,
    estado_conservacao VARCHAR(15),
    ISBN_livro CHAR (5),
    FOREIGN KEY (ISBN_livro) REFERENCES livros(ISBN)
);

ALTER TABLE exemplar
MODIFY estado_conservacao ENUM('bom', 'novo', 'ruim');

CREATE TABLE emprestimo (
	Id_emprestimo CHAR(5) PRIMARY KEY,
    data_retirada DATETIME,
    data_devolucao DATETIME,
    Matricula_aluno CHAR(9),
    FOREIGN KEY (Matricula_aluno) REFERENCES alunos(Matricula),
    Id_exemplar VARCHAR(2),
    FOREIGN KEY (Id_exemplar) REFERENCES exemplar(Id_exemplar)
);

SHOW TABLES;
SHOW COLUMNS FROM exemplar;