SET enable_indexscan = off;
SET enable_bitmapscan = off;

ANALYZE oferta;

EXPLAIN (ANALYZE, BUFFERS, TIMING)
SELECT u.id, u.nome || ' ' || u.sobrenome AS aluno, o.ano, o.semestre
FROM usuario u
JOIN matricula m   ON u.id = m.id_aluno
JOIN oferta o      ON m.id_oferta = o.id
WHERE o.codigo_disciplina = 'D01'
  AND o.ano = 2024
  AND o.semestre = 1;


-- teste com indice

RESET enable_indexscan;
RESET enable_bitmapscan;

DROP INDEX IF EXISTS idx_matricula_id_oferta; -- pode atrabalhar os resultados do indice que estamos querendo demonstrar.

ANALYZE oferta;

EXPLAIN (ANALYZE, BUFFERS, TIMING)
SELECT u.id, u.nome || ' ' || u.sobrenome AS aluno, o.ano, o.semestre
FROM usuario u
JOIN matricula m   ON u.id = m.id_aluno
JOIN oferta o      ON m.id_oferta = o.id
WHERE o.codigo_disciplina = 'D01'
  AND o.ano = 2024
  AND o.semestre = 1;