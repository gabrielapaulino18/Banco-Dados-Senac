DROP SCHEMA gestaoacademica;

-- 1. Selecionar todos os alunos

SELECT * FROM aluno;


-- 2. Selecionar apenas os nomes e CPFs dos alunos

SELECT Nome, Cpf FROM aluno;


-- 3. Selecionar alunos matriculados após uma data específica

SELECT Curso_id, DataMatricula
FROM Matricula
WHERE DataMatricula > '2024-01-15';


-- 4. Contar quantas disciplinas existem com carga horária maior que X

SELECT COUNT(*)
FROM disciplina
WHERE horas >= 40 AND horas <= 60;


-- 5. Contar quantas matrículas existem para cada curso

SELECT Curso.Nome AS Nome, Curso_id, COUNT(*) AS TotalMatricula
FROM matricula
JOIN curso ON Curso_ID = curso.id
GROUP BY Nome;
-- Tive dificuldade nessa e na 6 para conseguir concluir o código, dei uma pesquisada e achei o comando GROUP BY que me ajudou a concluir no código

-- 6. Contar quantas disciplinas cada professor leciona

SELECT Professor_ID, Professor.Nome AS Professor, COUNT(*) AS TotalDisciplina
FROM Professores_Disciplinas
JOIN Professor ON Professor_ID =Professor.id
GROUP BY Nome;


-- 7. Combinar nome do aluno e dados da matrícula

SELECT Aluno.Nome AS Aluno, Matricula.DataMatricula
FROM MATRICULA 
INNER JOIN ALUNO ON Aluno_ID = Aluno.Matricula;


-- 8. Combinar nome do curso e nome do aluno

SELECT Curso.Nome AS Curso, Aluno.Nome AS Nome
FROM Matricula
RIGHT JOIN Curso ON Curso_ID = Curso.Id
INNER JOIN aluno ON Aluno_ID = Aluno.Matricula;


-- 9. Contar quantos alunos se matricularam em cada curso

SELECT Aluno.Nome AS Aluno, Curso.Nome AS Curso, COUNT(*) AS TotalAlunos
FROM Matricula 
RIGHT JOIN ALUNO ON Aluno_ID = Aluno.id
INNER JOIN CURSO ON Matricula.Curso_ID = Curso.Id
GROUP BY Curso;
