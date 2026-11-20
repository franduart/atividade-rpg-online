#  Banco de Dados – RPG Online

##  Descrição
Este projeto foi desenvolvido como atividade acadêmica com o objetivo de implementar a estrutura de um banco de dados para um jogo de RPG online, utilizando SQL Server e linguagem SQL (DDL).

##  Tecnologias utilizadas
- SQL Server 2025
- SQL Server Management Studio (SSMS)
- Linguagem SQL (DDL)

##  Estrutura do banco de dados

O banco de dados se chama `RPGOnline` e possui cinco tabelas:

- **Usuarios:** armazena os dados dos usuários.
- **Personagens:** armazena os personagens cadastrados pelos usuários.
- **Classes:** armazena as classes disponíveis no jogo.
- **Habilidades:** armazena as habilidades do jogo.
- **Classes_Habilidades:** relaciona as classes com suas respectivas habilidades.

##  Relacionamentos

- Usuarios 1:N Personagens
- Classes 1:N Personagens
- Classes N:N Habilidades (resolvido pela tabela Classes_Habilidades).

##  Integridade dos dados

Foram utilizadas:
- Chaves primárias (PK).
- Chaves estrangeiras (FK).
- Chave primária composta na tabela Classes_Habilidades.
- Restrições NOT NULL.

##  Como executar

1. Instale o SQL Server e o SQL Server Management Studio (SSMS).
2. Conecte-se ao servidor.
3. Abra o arquivo `atividade_rpg_online.sql`.
4. Execute o script no SSMS.
5. Confira a criação do banco de dados e das tabelas.

##  Arquivo principal

`atividade_rpg_online.sql`

## 🎓 Finalidade

Atividade acadêmica da disciplina de banco de dados da instituição de ensino SENAI, desenvolvida para praticar modelagem entidade-relacionamento, criação de tabelas, definição de campos, chaves e relacionamentos utilizando SQL.

