INSERT INTO valores do professor (id, nome, especialização)
	( 1 , ' Huguinho ' , ' Tecnologia ' ),
    ( 2 , ' Zezinho ' , ' Idiomas ' ),
    ( 3 , ' Luiziho ' , ' Cálculo ' ),
    ( 4 , ' Tico ' , ' Tecnologia ' ),
    ( 5 , ' Teco ' , ' Idiomas ' );
selecione  *  da disciplina;
INSERT INTO valores da disciplina (id, horas, nome)
	( 1 , 40 , ' Matemática "Avançada" II ' ),
    ( 2 , 50 , " Inglês Técnico " ),
    ( 3 , 45 , " Linguagem de Programação " );
-- Associação dentre professores e disciplinas
selecione *  em professor_disciplina;
INSERT INTO valores professor_disciplina
	( 1 , 1 ),
    ( 2 , 2 ),
    ( 3,3 ) , _
    ( 4 , 1 ),
    ( 5 , 2 );

- Atualização DDL
ATUALIZAÇÃO professor
SET especialização =  ' Inteligência Artificial ' 
ONDE id =  5 ;

selecione  *  da disciplina;

ATUALIZAR disciplina
SET nome =  ' Matemática Avançada ' , horas =  80
ONDE ID =  1 ;

-- Atualização de toas as horas para 40 onde Horas for maior que 40
ATUALIZAR disciplina
DEFINIR horas =  40
ONDE horas >  40 ;

-- Excluir DML
DELETE FROM disciplina WHERE id =  3 ;