/*
	Projeto integrado de gestao de projetos e de dados (02/2021)
	Aluno: Luis Carlos Firmino Pinheiro - RGM 1623684143
*/

-- PostgreSQL
CREATE TABLE IF NOT EXISTS Aluno(
	ID_rgm SERIAL PRIMARY KEY,		-- RGM gerado sequencialmente
	nome VARCHAR(40) NOT NULL,
	mae_aluno VARCHAR(40),
	pai_aluno VARCHAR(40),
	data_nascimento DATE NOT NULL,
	sexo_aluno CHAR(1)
	CONSTRAINT chk CHECK (sexo_aluno IN ('M', 'F'))
);

CREATE TABLE IF NOT EXISTS Classe(
	ID_classe SERIAL PRIMARY KEY,	-- Codigo da classe gerado sequencialmente
	ano_letivo INT NOT NULL,
	serie INT NOT NULL,
	turma VARCHAR(2) NOT NULL,
	escola INT NOT NULL,
	grau INT NOT NULL,
	periodo INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Matricula(
	FK_ID_RGM INT REFERENCES Aluno(ID_rgm) NOT NULL,
	FK_ID_CLASSE INT REFERENCES Classe(ID_classe) NOT NULL,
	data_matricula DATE NOT NULL,
	PRIMARY KEY(FK_ID_RGM, FK_ID_CLASSE)
);