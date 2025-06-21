-- Conteúdo de: test_oferta_index.sql

-- Garante que o índice não existe antes do primeiro teste
DROP INDEX IF EXISTS idx_oferta_codigo_disciplina;
ANALYZE oferta;

-- TESTE SEM O ÍNDICE (Esta é a Consulta 2)
EXPLAIN ANALYZE
SELECT u.id, u.nome || ' ' || u.sobrenome AS aluno, o.ano, o.semestre
FROM usuario u
JOIN matricula m   ON u.id = m.id_aluno
JOIN oferta o      ON m.id_oferta = o.id
WHERE o.codigo_disciplina = 'D01'
  AND o.ano = 2024
  AND o.semestre = 1;


-- Cria o índice que queremos testar
CREATE INDEX idx_oferta_codigo_disciplina ON oferta(codigo_disciplina);
ANALYZE oferta;

-- TESTE COM O ÍNDICE (Executa a mesma Consulta 2 novamente)
EXPLAIN ANALYZE
SELECT u.id, u.nome || ' ' || u.sobrenome AS aluno, o.ano, o.semestre
FROM usuario u
JOIN matricula m   ON u.id = m.id_aluno
JOIN oferta o      ON m.id_oferta = o.id
WHERE o.codigo_disciplina = 'D01'
  AND o.ano = 2024
  AND o.semestre = 1;