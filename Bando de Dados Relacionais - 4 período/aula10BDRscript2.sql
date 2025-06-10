CREATE DATABASE IF NOT EXISTS papelaria_db;
USE papelaria_db;

-- DDL
/*
Uma papelaria está criando um sistema para controlar seus produtos e fornecedores.
Cada produto possui código, nome, tipo (papel, caneta, livro, etc.), preço e quantidade em
estoque. Cada fornecedor tem CNPJ, nome e e-mail. 

• O campo tipo dos produtos deve aceitar apenas valores pré-definidos (papel, caneta, livro,
outros).
• O campo quantidade_estoque não pode ser negativo.
• Cada produto está vinculado a um único fornecedor.
*/

CREATE TABLE fornecedor (
	CNPJ CHAR(14) PRIMARY KEY,
    nome_fornecedor VARCHAR(100) NOT NULL,
    email_fornecedor VARCHAR(50)
);

CREATE TABLE produto (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(150) NOT NULL,
    preco_produto DECIMAL(5,2) NOT NULL,
    tipo_produto VARCHAR(20) NOT NULL,
    quantidade_estoque INT CHECK (quantidade_estoque>=0),
    CHECK (tipo_produto IN ('papel', 'caneta', 'livro', 'outros')),
    CNPJ_fornecedor CHAR(14),
    FOREIGN KEY (CNPJ_fornecedor) REFERENCES fornecedor(CNPJ)
);


-- INSERTS
-- Insira pelo menos 5 fornecedores e 5 produtos.

INSERT INTO fornecedor (CNPJ, nome_fornecedor, email_fornecedor) VALUES 
(11111111111111, 'Claudia Valeria', 'claudia&victoria@arts.com'),
(22222222222222, 'Brum Ferragens', 'brum@ferragens.com.br'),
(33333333333333, 'Mercadão do Centro', 'centro@mercadao.com'),
(44444444444444, 'Papelaria da Cida', 'cida@papelaria.com'),
(55555555555555, 'Livraria Hyunam-Dong', 'livraria@hyunamdong.com.kr');

INSERT INTO produto (nome_produto, preco_produto, tipo_produto, quantidade_estoque, CNPJ_fornecedor) VALUES
('Chaveiro Personalizado', 20.00, 'outros', 10, '11111111111111'),
('Caneta BIC', 2.60, 'caneta', 300, '22222222222222'),
('Café Valença', 36.80, 'outros', 183, '33333333333333'),
('Caderno Inteligente', 85.90, 'papel', 0, '44444444444444'),
('O Velho e o Mar', 43.02, 'livro', 80, '55555555555555');

-- Atualize o preço de pelo menos dois produtos.

UPDATE produto
SET preco_produto = 15.85
WHERE nome_produto = 'Chaveiro Personalizado';

UPDATE PRODUTO
SET preco_produto = 43.99
WHERE nome_produto = 'O Velho e o Mar';

-- Delete um produto com estoque igual a Zero.

DELETE FROM produto
WHERE quantidade_estoque = 0;
