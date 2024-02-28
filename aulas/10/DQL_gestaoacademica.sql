SELECT * FROM Aluno;

-- SELECT
-- FROM
-- WHERE
-- ORDER BY

SELECT nome, cpf
FROM aluno;

SELECT *
FROM  aluno
WHERE matricula > 3
ORDER BY nome;

-- Operadores Matemáticos e Lógicos:
SELECT * FROM disciplina;

SELECT nome, horas
FROM disciplina
WHERE horas >= 40 AND horas <= 50;

-- Aliases para Melhor Legibilidade
SELECT nome AS nome_disciplina, horas AS carga_horario
FROM disciplina;


SELECT id, nome AS nome_professor
FROM professor 
WHERE id > 2 AND id < 6
ORDER BY nome;

-- Exemplo: Contar quantas disciplinas exisem
SELECT COUNT(*) AS QuantidadesDeDisciplinas
FROM disciplina
WHERE horas > 50;

-- Me informe quantas matrículas foram feitas no curso de ID 2
SELECT COUNT(*) AS QuantidadeDeMatriculas
FROM matricula
WHERE curso_id = 2;

-- Exemplo: Selecionar professor com especialização que envolva Tecnologia
SELECT *
FROM professor
WHERE especializacao LIKE '%Tecnologia%';

SELECT *
FROM curso
WHERE nome LIKE '%medicina' OR nome LIKE 'd%';

-- Utilizando o DISTINCT para obter Valores Distintos
SELECT DISTINCT especializacao FROM professor;