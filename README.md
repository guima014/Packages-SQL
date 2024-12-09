# Packages-SQL
Este projeto implementa um sistema de gestão acadêmica utilizando PL/SQL no Oracle Database. Ele abrange as entidades Aluno, Disciplina e Professor, aplicando conceitos de procedures, functions e cursores.

Estrutura do Projeto: Entidades e Funcionalidades Implementadas
1. Pacote PKG_ALUNO
Procedure de exclusão de aluno: Remove um aluno e suas matrículas.
Cursor de alunos maiores de 18 anos: Lista alunos com mais de 18 anos.
Cursor de alunos por curso: Filtra alunos matriculados em um curso específico.

2. Pacote PKG_DISCIPLINA
Procedure de cadastro de disciplina: Cadastra uma nova disciplina.
Cursor para total de alunos por disciplina: Lista disciplinas com mais de 10 alunos.
Cursor para média de idade por disciplina: Calcula a média de idade dos alunos de uma disciplina.
Procedure para listar alunos de uma disciplina: Exibe os alunos matriculados em uma disciplina específica.

3. Pacote PKG_PROFESSOR
Cursor para total de turmas por professor: Lista professores com mais de uma turma.
Function para total de turmas de um professor: Retorna o total de turmas de um professor específico.
Function para professor de uma disciplina: Retorna o nome do professor responsável por uma disciplina.

Como Executar o Projeto
Requisitos
- Oracle Database instalado.
- Ferramenta de gerenciamento como SQL Developer ou SQL*Plus.

Passos para Execução
Clonar o Repositório:
git clone https://github.com/guima014/Packages-SQL.git
cd Packages-SQL

Executar o Script:
- Abra o Oracle SQL Developer.
- Conecte-se ao seu banco de dados Oracle.
- Execute o arquivo script.sql para criar as tabelas e pacotes.

Licença
Este projeto está licenciado sob a MIT License.
