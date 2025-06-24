SET enable_indexscan = off;
SET enable_bitmapscan = off;

ANALYZE matricula;

EXPLAIN (ANALYZE, BUFFERS, TIMING)
SELECT
  u.id AS aluno_id,
  d.codigo AS disciplina_codigo,
  ROUND(AVG(n.valor)::numeric, 2) AS media_notas
FROM usuario u
JOIN matricula m ON m.id_aluno = u.id
JOIN nota n ON n.id_matricula = m.id
JOIN oferta o ON o.id = m.id_oferta
JOIN disciplina d ON d.codigo = o.codigo_disciplina
WHERE u.id = 21
GROUP BY u.id, d.codigo;

--agora com index

RESET enable_indexscan;
RESET enable_bitmapscan;

ANALYZE matricula;

EXPLAIN (ANALYZE, BUFFERS, TIMING)
SELECT
  u.id AS aluno_id,
  d.codigo AS disciplina_codigo,
  ROUND(AVG(n.valor)::numeric, 2) AS media_notas
FROM usuario u
JOIN matricula m ON m.id_aluno = u.id
JOIN nota n ON n.id_matricula = m.id
JOIN oferta o ON o.id = m.id_oferta
JOIN disciplina d ON d.codigo = o.codigo_disciplina
WHERE u.id = 21
GROUP BY u.id, d.codigo;