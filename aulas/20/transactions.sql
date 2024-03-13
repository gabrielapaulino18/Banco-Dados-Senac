USE COMPRAS;

SELECT * FROM pedido;

-- 0 
START TRANSACTION;

-- 1 inserindo um novo pedido
INSERT INTO pedido (clienteId, DataPedido) VALUES (1, '2024-03-12');
SET @novoPedidoID = last_insert_id();

-- 2 Inserindo os itens do pedido
INSERT INTO itenspedido (pedidoId, produtoId, quantidade)
	VALUES(@novoPedidoID, 4, 6);

-- 3 Atualizando a quantidade do produto no estoque
UPDATE produto SET quantidade = quantidade - 6 WHERE ID = 4;

-- Desfazendo a transação
COMMIT;

SELECT * FROM PEDIDO;