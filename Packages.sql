Pacote PKG_ALUNO
1. Procedure de exclusão de aluno:
Parâmetro: p_id_aluno IN NUMBER
Operação:
Remover matrículas relacionadas (DELETE FROM Matricula WHERE id_aluno = p_id_aluno;).
Remover o aluno (DELETE FROM Aluno WHERE id_aluno = p_id_aluno;).

2. Cursor de listagem de alunos maiores de 18 anos:
CURSOR c_alunos_maiores_18 IS
SELECT nome, data_nascimento 
FROM Aluno 
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) > 18;

3. Cursor com filtro por curso:
CURSOR c_alunos_por_curso(p_id_curso NUMBER) IS
SELECT nome 
FROM Aluno a 
JOIN Matricula m ON a.id_aluno = m.id_aluno
WHERE m.id_curso = p_id_curso;


Pacote PKG_DISCIPLINA
1. Procedure de cadastro de disciplina:
Parâmetros: p_nome IN VARCHAR2, p_descricao IN VARCHAR2, p_carga_horaria IN NUMBER
Operação:
sql
Copiar código
INSERT INTO Disciplina (nome, descricao, carga_horaria)
VALUES (p_nome, p_descricao, p_carga_horaria);

2. Cursor para total de alunos por disciplina:
CURSOR c_total_alunos_disciplina IS
SELECT d.nome, COUNT(m.id_aluno) AS total_alunos
FROM Disciplina d
JOIN Matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY d.nome
HAVING COUNT(m.id_aluno) > 10;

3. Cursor com média de idade por disciplina:
CURSOR c_media_idade(p_id_disciplina NUMBER) IS
SELECT AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, a.data_nascimento) / 12)) AS media_idade
FROM Aluno a
JOIN Matricula m ON a.id_aluno = m.id_aluno
WHERE m.id_disciplina = p_id_disciplina;

4. Procedure para listar alunos de uma disciplina:
Parâmetro: p_id_disciplina IN NUMBER
PROCEDURE listar_alunos(p_id_disciplina IN NUMBER) IS
BEGIN
  FOR r IN (SELECT a.nome 
            FROM Aluno a 
            JOIN Matricula m ON a.id_aluno = m.id_aluno
            WHERE m.id_disciplina = p_id_disciplina) LOOP
    DBMS_OUTPUT.PUT_LINE(r.nome);
  END LOOP;
END;


Pacote PKG_PROFESSOR
1. Cursor para total de turmas por professor:
CURSOR c_turmas_por_professor IS
SELECT p.nome, COUNT(t.id_turma) AS total_turmas
FROM Professor p
JOIN Turma t ON p.id_professor = t.id_professor
GROUP BY p.nome
HAVING COUNT(t.id_turma) > 1;

2. Function para total de turmas de um professor:
FUNCTION total_turmas(p_id_professor NUMBER) RETURN NUMBER IS
  v_total NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_total
  FROM Turma 
  WHERE id_professor = p_id_professor;
  RETURN v_total;
END;

3. Function para professor de uma disciplina:
FUNCTION professor_disciplina(p_id_disciplina NUMBER) RETURN VARCHAR2 IS
  v_nome VARCHAR2(100);
BEGIN
  SELECT p.nome INTO v_nome
  FROM Professor p
  JOIN Disciplina d ON p.id_professor = d.id_professor
  WHERE d.id_disciplina = p_id_disciplina;
  RETURN v_nome;
END;