-- Criar uma transaction que, quando o cliente fizer uma hospedagem
START TRANSACTION;

SELECT * FROM hospedagem;

INSERT INTO hospedagem () VALUES
	(3,5, '2024-01-01', '2024-03-01', 3, 0, 370.00);
set @hospedagem = last_insert_id();
    
-- Automaticamente adicione um café da manhã para a sua hospedagem

INSERT INTO hospedagem_servico
	values(@hospedagemID, @cafeManhaID, '2024-01-01');
    
COMMIT; 