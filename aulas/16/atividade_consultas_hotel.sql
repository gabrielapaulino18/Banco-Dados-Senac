# Consultas sem JOINS
-- Consulte todos os clientes de São Paulo (SP)

SELECT * FROM cliente
WHERE estadoCliente = 'SP';

-- Selecionar hospedagens com mais de 3 pessoas e desconto igual a 0

SELECT * FROM Hospedagem
WHERE qtdPessoas >= 3 AND desconto = 0;

-- Selecionar telefones de clientes com ID 1 ou 2, limitando a 2 resultados

SELECT * FROM telefone
WHERE codCliente IN (1, 2)
LIMIT 2;

-- Selecionar chalés com capacidades entre 4 e 6, ordenaos por valor em alta estação

SELECT * FROM chale
WHERE capacidade BETWEEN 4 AND 6 
ORDER BY valorAltaEstacao;

-- Selecione todos os itens que contenham "de" na descrição, pulando os 2 primeiros resultados

SELECT * FROM item
WHERE descricaoItem LIKE '%de%' 
LIMIT 13 OFFSET 2;




# Consultas com JOINS
-- Selecioar detalhes da hospedagem, incluindo informações do cliente

SELECT * FROM hospedagem
JOIN Cliente ON Hospedagem.codCliente = Cliente.codCliente;

-- Selecionar chalés com os itens associados

SELECT * FROM chale
JOIN Chale_Item ON Chale.codChale = Chale_Item.codChale;

-- Selecionar serviços utilizados em uma hospedagem

SELECT * FROM servico
INNER JOIN Servico ON Hospedagem_Servico.codServico = Servico.codServico;

-- Consultar os clientes com seus telefones
-- Selecionar chalés ocupados em uma data específica