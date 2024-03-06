-- SELECT TUDO DA TABELA X
SELECT * FROM PEDIDO;

-- SELECT COM CONTAGEM TOTAL DE REGISTROS
SELECT COUNT(*) AS Total_Pedidos
FROM pedido;

-- SELECT QUANTOS PEDIDOS CADA CLIENTE FEZ
SELECT ClienteID, COUNT(*)
FROM pedido
GROUP BY ClienteID;

-- SLECIONAR O TOTAL DE ITENS 'POR(GROUP BY)' PEDIDO
SELECT pedidoId, COUNT(*) AS ProdutoPorPedido
FROM itenspedido
GROUP BY pedidoId;

SELECT * FROM itenspedido;

-- SELECIONAR PRODUTOS MAIS VENDIDOS
SELECT produtoId, SUM(quantidade) AS MaisVendidos
FROM itenspedido
GROUP BY produtoId
ORDER BY MaisVendidos DESC;

-- LISTE OS CLIENTES INFORMANDO:
-- TOTAL GASTO, MEDIA DE PRODUTOS, DATA DO PRIMEIRO E ÚLTIMO PEDIDO

SELECT
	pedido.clienteId,
    COUNT(*) AS NumPedidos,
    SUM(produto.preco * itenspedido.quantidade) AS TotalGasto,
    AVG(itenspedido.quantidade) AS MediaProdutosPorPedido,
    MIN(pedido.dataPedido) AS PrimeiroPedido,
    MAX(pedido.dataPedido) AS UltimoPedido
    FROM pedido
    JOIN itenspedido ON pedido.id = itenspedido.pedidoId
    JOIN produto ON itenspedido.produtoId = produto.id
    GROUP BY pedido.clienteId;