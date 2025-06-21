-- Garante que o índice não existe antes do primeiro teste
DROP INDEX IF EXISTS idx_matricula_id_aluno;

ANALYZE matricula;

-- Consulta 3 sendo usada aqui
EXPLAIN ANALYZE
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

CREATE INDEX idx_matricula_id_aluno ON matricula(id_aluno);

ANALYZE matricula;

EXPLAIN ANALYZE
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