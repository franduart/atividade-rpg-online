/*
    ATIVIDADE: Banco de Dados - Jogo RPG Online
    SGBD: Microsoft SQL Server

    Estrutura conforme o diagrama fornecido:
    - USUARIOS 1:N PERSONAGENS
    - CLASSES 1:N PERSONAGENS
    - CLASSES 1:N CLASSES_HABILIDADES
    - HABILIDADES 1:N CLASSES_HABILIDADES

    A tabela CLASSES_HABILIDADES resolve o relacionamento N:N
    entre CLASSES e HABILIDADES.
*/

-- 1. Criar o banco de dados
IF DB_ID(N'RPGOnline') IS NULL
BEGIN
    CREATE DATABASE RPGOnline;
END;
GO

-- 2. Selecionar o banco de dados
USE RPGOnline;
GO

-- 3. Tabela USUARIOS
CREATE TABLE Usuarios (
    UsuarioId INT IDENTITY(1,1) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Senha NVARCHAR(255) NOT NULL,

    CONSTRAINT PK_Usuarios PRIMARY KEY (UsuarioId)
);
GO

-- 4. Tabela CLASSES
CREATE TABLE Classes (
    ClasseId INT IDENTITY(1,1) NOT NULL,
    Nome NVARCHAR(100) NOT NULL,
    Descricao NVARCHAR(MAX) NULL,

    CONSTRAINT PK_Classes PRIMARY KEY (ClasseId)
);
GO

-- 5. Tabela HABILIDADES
CREATE TABLE Habilidades (
    HabilidadeId INT IDENTITY(1,1) NOT NULL,
    Nome NVARCHAR(100) NOT NULL,

    CONSTRAINT PK_Habilidades PRIMARY KEY (HabilidadeId)
);
GO

-- 6. Tabela PERSONAGENS
-- Cada personagem pertence a um usuario e a uma classe.
CREATE TABLE Personagens (
    PersonagemId INT IDENTITY(1,1) NOT NULL,
    NomePersonagem NVARCHAR(100) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,

    CONSTRAINT PK_Personagens PRIMARY KEY (PersonagemId),

    CONSTRAINT FK_Personagens_Usuarios
        FOREIGN KEY (UsuarioId)
        REFERENCES Usuarios (UsuarioId),

    CONSTRAINT FK_Personagens_Classes
        FOREIGN KEY (ClasseId)
        REFERENCES Classes (ClasseId)
);
GO

-- 7. Tabela CLASSES_HABILIDADES
-- Tabela associativa do relacionamento N:N entre classes e habilidades.
CREATE TABLE Classes_Habilidades (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,

    CONSTRAINT PK_Classes_Habilidades
        PRIMARY KEY (ClasseId, HabilidadeId),

    CONSTRAINT FK_Classes_Habilidades_Classes
        FOREIGN KEY (ClasseId)
        REFERENCES Classes (ClasseId),

    CONSTRAINT FK_Classes_Habilidades_Habilidades
        FOREIGN KEY (HabilidadeId)
        REFERENCES Habilidades (HabilidadeId)
);
GO

-- 8. Conferir as tabelas criadas
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO
