CREATE TABLE IF NOT EXISTS Matricula (
    Aluno_ID INT,
    Curso_ID INT,
    Data_Matricula DATE,
    PRIMARY KEY(Aluno_ID, Curso_ID),
    FOREIGN KEY (Aluno_ID) REFERENCES Aluno(Matricula),
    FOREIGN KEY (Curso_ID) REFERENCES Curso(id)
);

CREATE TABLE IF NOT EXISTS Professor_Disciplina (
    Professor_ID INT,
    Disciplina_ID INT,
    PRIMARY KEY(Professor_ID, Disciplina_ID),
    FOREIGN KEY (Professor_ID) REFERENCES Professor(id),
    FOREIGN KEY (Disciplina_ID) REFERENCES Disciplina(id)
);


CREATE TABLE IF NOT EXISTS Disciplina_Curso (
    Disciplina_ID INT,
    Curso_ID INT,
    PRIMARY KEY(Disciplina_ID, Curso_ID),
    FOREIGN KEY (Disciplina_ID) REFERENCES Disciplina(id),
    FOREIGN key (Curso_ID) REFERENCES Curso(id)
);