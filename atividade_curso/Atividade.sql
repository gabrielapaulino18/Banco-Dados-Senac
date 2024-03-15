################## DDL
-- 1. Crie uma tabela chamada Fornecedor para armazenar informações sobre os fornecedores do sistema.
-- id, nome, endereço, telefone, email e uma observação (text)
CREATE TABLE IF NOT EXISTS Fornecedor (
	Id INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereço VARCHAR(100) NOT NULL, 
    Telefone VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Observacao TEXT
);

-- 2. Adicione uma coluna chamada CNPJ à tabela Fornecedor para armazenar os números de CNPJ dos fornecedores.
ALTER TABLE Fornecedor
	ADD COLUMN CNPJ VARCHAR(30);

-- 3. Adicione uma chave estrangeira à tabela Fornecedor para relacioná-la à tabela Categoria, representando a categoria do fornecedor.
ALTER TABLE Fornecedor
	ADD COLUMN CategoriaID INT,
    ADD FOREIGN KEY (CategoriaId) REFERENCES Categoria(Id);

-- 4. Modifique o tipo da coluna Telefone na tabela Fornecedor para armazenar números de telefone com no máximo 15 caracteres.
ALTER TABLE Fornecedor
	CHANGE Telefone Telefone VARCHAR(15) NOT NULL;

-- 5. Remova a coluna Observacao da tabela Fornecedor, pois não é mais necessária.
ALTER TABLE Fornecedor
	DROP COLUMN Observacao;

-- 6. Remova a tabela Fornecedor do banco de dados, se existir.
DROP TABLE IF EXISTS Fornecedor;

#################### DML
-- 0. Crie ao menos 5 registros para cada tabela, ignorando o gerneciamento de usuários. Um dos clientes deverá ter o seu nome

-- Inserção de registros na tabela Cliente
INSERT INTO Cliente (Nome, Email, Telefone) VALUES 
    ('Gabriela Paulino', 'gabriela@example.com', '123456789'),
    ('Maria Santos', 'maria@example.com', '987654321'),
    ('José Oliveira', 'jose@example.com', '555555555'),
    ('Ana Pereira', 'ana@example.com', '999999999'),
    ('Carlos Souza', 'carlos@example.com', '777777777');

-- Inserção de registros na tabela Categoria
INSERT INTO Categoria (Nome, Descricao) VALUES 
    ('Eletrônicos', 'Produtos eletrônicos em geral'),
    ('Roupas', 'Vestuário e acessórios'),
    ('Alimentos', 'Produtos alimentícios'),
    ('Móveis', 'Móveis para casa'),
    ('Livros', 'Livros de diversas categorias');

-- Inserção de registros na tabela FormaPagamento
INSERT INTO FormaPagamento (Nome, Descricao) VALUES 
    ('Cartão de Crédito', 'Pagamento através de cartão de crédito'),
    ('Dinheiro', 'Pagamento em espécie'),
    ('Transferência Bancária', 'Pagamento via transferência bancária'),
    ('Pix', 'Pagamento instantâneo via Pix'),
    ('Boleto', 'Pagamento através de boleto bancário');

-- Inserção de registros na tabela Produto
INSERT INTO Produto (Nome, Descricao, Preco, CategoriaID) VALUES 
    ('Smartphone', 'Celular inteligente', 1500.00, 1),
    ('Camiseta', 'Camiseta de algodão', 25.00, 2),
    ('Arroz', 'Arroz branco tipo 1', 5.50, 3),
    ('Sofá', 'Sofá de três lugares', 800.00, 4),
    ('Harry Potter e a Pedra Filosofal', 'Livro de fantasia', 30.00, 5);

-- Inserção de registros na tabela Pedido    
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamento, Status, UsuarioAtualizacao)VALUES 
    (4, '2024-03-14 13:00:00', 1, 'Entregue', 1),
    (5, '2024-03-14 14:30:00', 3, 'Cancelado', 1),
    (1, '2024-03-14 15:45:00', 2, 'Em andamento', 1),
    (2, '2024-03-14 16:00:00', 4, 'Pendente', 1),
    (3, '2024-03-14 17:15:00', 5, 'Concluído', 1);

-- Inserção de registros na tabela ItemPedido    
INSERT INTO ItemPedido (PedidoID, ProdutoID, Quantidade, UsuarioAtualizacao)VALUES 
    (4, 2, 1, 1),
    (5, 3, 2, 1),
    (1, 4, 3, 1),
    (2, 5, 1, 1),
    (3, 1, 2, 1); 

-- Inserção de registros na tabela GrupoUsuário
INSERT INTO GrupoUsuario (Nome, Descricao) VALUES 
    ('Administradores', 'Grupo de usuários com permissões de administração'),
    ('Usuários Comuns', 'Grupo de usuários comuns');

-- Inserção de registros na tabela Permissao    
INSERT INTO Permissao (Nome, Descricao) VALUES 
    ('Leitura', 'Permissão para leitura'),
    ('Escrita', 'Permissão para escrita'),
    ('Exclusão', 'Permissão para exclusão'),
    ('Administração', 'Permissão para administração');    

SELECT * FROM produto;

-- 1. Atualizar o nome de um cliente:
UPDATE Cliente 
SET Nome = 'Guilherme Siqueira' 
WHERE Id = 3;

-- 2. Deletar um produto:
INSERT INTO produto (Nome, Descricao, Preco, UsuarioAtualizacao) VALUES
	('Bola', 'Bola futsal uso em quadra', 250.00, 1);

DELETE FROM Produto WHERE Id = 6;

-- 3. Alterar a categoria de um produto:
UPDATE Produto 
SET CategoriaID = 2 
WHERE Id = 1;

-- 4. Inserir um novo cliente:
INSERT INTO Cliente (Nome, Email, Telefone) VALUES 
	('Camila Andrade', 'camila@example.com', '1122334455');

-- 5. Inserir um novo pedido:
INSERT INTO Pedido (ClienteID, DataPedido, FormaPagamento, Status, UsuarioAtualizacao) VALUES 
	(6, '2024-03-15 19:15:00', 2, 'Pendente', 1);

-- 6. Atualizar o preço de um produto:
UPDATE Produto 
SET Preco = 1600.00 
WHERE Nome = 'Smartphone';

SELECT * FROM pedido;

############## DQL - Sem Joins
-- 1. Selecione todos os registros da tabela Produto:
SELECT * FROM produto;

-- 2. Selecione apenas o nome e o preço dos produtos da tabela Produto:
SELECT nome, preco FROM produto;

-- 3. Selecione os produtos da tabela Produto ordenados por preço, do mais barato para o mais caro:
SELECT * FROM produto
ORDER BY preco;

-- 4. Selecione os produtos da tabela Produto ordenados por preço, do mais caro para o mais barato:
SELECT * FROM produto
ORDER BY preco DESC;

-- 5. Selecione os nomes distintos das categorias da tabela Categoria:
SELECT DISTINCT Nome FROM Categoria;

-- 6. Selecione os produtos da tabela Produto cujo preço esteja entre $10 e $50:
SELECT * FROM Produto 
WHERE Preco 
BETWEEN 10 AND 50;

-- 7. Selecione os produtos da tabela Produto, mostrando o nome como "Nome do Produto" e o preço como "Preço Unitário":
SELECT Nome AS 'Nome do Produto', Preco AS 'Preço Unitário' FROM Produto;

-- 8. Selecione os produtos da tabela Produto, adicionando uma coluna calculada "Preço Total" multiplicando a quantidade pelo preço:
-- Não consegui desenvolver essa

-- 9. Selecione os produtos da tabela Produto, mostrando apenas os 10 primeiros registros:
SELECT * FROM Produto 
LIMIT 10;

-- 10. Selecione os produtos da tabela Produto, pulando os primeiros 5 registros e mostrando os 10 seguintes:
SELECT * FROM produto
LIMIT 10 OFFSET 5;

############# DQL - Joins
-- 1. Selecione o nome do produto e sua categoria:
SELECT Produto.Nome AS NomeDoProduto, Categoria.Nome AS Categoria
FROM Produto
LEFT JOIN Categoria ON Produto.CategoriaID = Categoria.Id;

-- 2. Selecione o nome do cliente e o nome do produto que ele comprou:
SELECT Cliente.Nome AS NomeCliente, Produto.Nome AS NomeDoProduto
FROM cliente
JOIN Pedido ON Cliente.Id = Pedido.ClienteID
JOIN ItemPedido ON Pedido.Id = ItemPedido.PedidoID
JOIN Produto ON ItemPedido.ProdutoID = Produto.Id;

-- 3. Selecione todos os produtos, mesmo aqueles que não têm uma categoria associada:


-- 4. Selecione todos os clientes, mesmo aqueles que não fizeram nenhum pedido:


-- 5. Selecione todas as categorias, mesmo aquelas que não têm produtos associados:


-- 6. Selecione todos os produtos, mesmo aqueles que não foram pedidos:



############### DQL com joins e demais filtros
-- 1. Selecione o nome da categoria e o número de produtos nessa categoria, apenas para categorias com mais de 5 produtos:


-- 2. Selecione o nome do cliente e o total de pedidos feitos por cada cliente:


-- 3. Selecione o nome do produto, o nome da categoria e a quantidade total de vendas para cada produto:


-- 4. Selecione o nome da categoria, o número total de produtos nessa categoria e o número de pedidos para cada categoria:


-- 5. Selecione o nome do cliente, o número total de pedidos feitos por esse cliente e a média de produtos por pedido, apenas para clientes que tenham feito mais de 3 pedidos:


##### Crie uma View qualquer para qualquer um dos joins desenvolvidos

##### Crie uma transaction que cadastra um cliente e faça uma venda
-- Início da transação

-- Inserir um novo cliente


-- Inserir um novo pedido para o cliente


-- Inserir itens no pedido


-- Commit da transação (confirmação das alterações)