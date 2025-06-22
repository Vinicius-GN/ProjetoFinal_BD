-- esse código visa gerar as queries para consultas de dados do trabalho final

-- 1) Obter id do usuário "Ana Silva" com telefone "11987654321"
SELECT
  id
FROM usuario
WHERE nome = 'Ana'
  AND sobrenome = 'Silva'
  AND numero_telefone = '11987654321';

-- 2) Alunos matriculados em “Algoritmos e Programação” (D01) no período 2024/1
SELECT
  u.id,
  u.nome || ' ' || u.sobrenome AS aluno,
  o.ano,
  o.semestre
FROM usuario u
JOIN matricula m   ON u.id = m.id_aluno
JOIN oferta o      ON m.id_oferta = o.id
WHERE o.codigo_disciplina = 'D01'
  AND o.ano = 2024
  AND o.semestre = 1;

-- 3) Média das notas do aluno 21 (Arthur Duarte), mostrando também disciplina e unidade
SELECT
  u.id AS aluno_id,
  u.nome || ' ' || u.sobrenome AS aluno,
  d.codigo AS disciplina_codigo,
  d.nome AS disciplina,
  ue.cidade || ' – ' || ue.estado AS unidade,
  ROUND(AVG(n.valor)::numeric, 2) AS media_notas
FROM usuario u
JOIN unidade_escola ue 
  ON u.id_unidade_escola = ue.id
JOIN matricula m 
  ON m.id_aluno = u.id
JOIN nota n 
  ON n.id_matricula = m.id
JOIN oferta o 
  ON o.id = m.id_oferta
JOIN disciplina d 
  ON d.codigo = o.codigo_disciplina
WHERE u.id = 21
GROUP BY
  u.id,
  u.nome,
  u.sobrenome,
  d.codigo,
  d.nome,
  ue.cidade,
  ue.estado;

-- 4) Professores do departamento DA1 com código e nome do departamento e suas disciplinas
SELECT
  da.codigo AS departamento_codigo,
  da.nome AS departamento_nome,
  p.id AS professor_id,
  p.nome || ' ' || p.sobrenome AS professor,
  d.codigo AS disciplina_codigo,
  d.nome AS disciplina
FROM departamento_academico da
-- apenas o depto DA1
JOIN curso c 
  ON c.codigo_departamento_academico = da.codigo
JOIN disciplina_curso dc 
  ON dc.codigo_curso = c.codigo
JOIN disciplina d 
  ON d.codigo = dc.codigo_disciplina
JOIN responsavel_disciplina rd 
  ON rd.codigo_disciplina = d.codigo
JOIN usuario p 
  ON p.id = rd.id_professor
WHERE da.codigo = 'DA1';

-- 5) Cursos sem matrícula no período (2025/2)
WITH ultimo AS (
  SELECT 2025 AS ano, 2 AS semestre
)
SELECT
    c.codigo AS curso_codigo,
    c.nome AS curso_nome,
    da.codigo AS departamento_codigo
FROM curso c
JOIN departamento_academico da
  ON c.codigo_departamento_academico = da.codigo
JOIN unidade_escola ue
  ON c.id_unidade_escola = ue.id
WHERE NOT EXISTS (
  SELECT 1
  FROM disciplina_curso dc
  JOIN oferta o
    ON dc.codigo_disciplina = o.codigo_disciplina
  JOIN matricula m
    ON m.id_oferta = o.id
  JOIN ultimo u
    ON o.ano      = u.ano
   AND o.semestre = u.semestre
  WHERE dc.codigo_curso = c.codigo
)
ORDER BY c.codigo;

-- 6) Mensagens enviadas por alunos de “Algoritmos e Programação” (D01)
SELECT
  msg.id,
  msg.texto_mensagem,
  msg.dia_criacao || '/' || msg.mes_criacao || '/' || msg.ano_criacao AS data,
  msg.hora_criacao,
  msg.id_usuario AS aluno_id
FROM mensagem msg
WHERE msg.id_usuario IN (
  SELECT m.id_aluno
  FROM matricula m
  JOIN oferta o
    ON m.id_oferta = o.id
  WHERE o.codigo_disciplina = 'D01'
);

-- 7) Avisos emitidos entre ’2024-01-01 00:00’ e ’2024-12-31 23:59’
SELECT *
FROM aviso
WHERE to_timestamp(
        ano_criacao  || '-' ||
        mes_criacao  || '-' ||
        dia_criacao  || ' ' ||
        hora_criacao,
        'YYYY-MM-DD HH24:MI'
      )
      BETWEEN '2024-01-01 00:00'
          AND '2024-12-31 23:59'
;

-- 8) Total de taxas pagas pelo aluno 21 no semestre 2024/1, exibindo também o nome do aluno
SELECT
  u.id AS aluno_id,
  u.nome || ' ' || u.sobrenome AS aluno,
  SUM(t.valor) AS total_taxas
FROM taxa t
JOIN matricula m
  ON t.id_matricula = m.id
JOIN oferta o
  ON m.id_oferta = o.id
JOIN usuario u
  ON u.id = m.id_aluno
WHERE m.id_aluno = 21
  AND o.ano         = 2024
  AND o.semestre    = 1
  AND m.status     <> 'pendente'
GROUP BY u.id, u.nome, u.sobrenome;

-- 9) Detalhamento das disciplinas e professores com média de didática > 8.0
SELECT
  ap.nome_disciplina AS disciplina_codigo,
  d.nome AS disciplina_nome,
  ap.id_professor AS professor_id,
  p.nome || ' ' || p.sobrenome AS professor,
  ROUND(AVG(ap.didatica_nota)::numeric, 2) AS media_didatica,
  COUNT(*) AS quantidade_avaliacoes
FROM avaliacao_professor ap
JOIN disciplina d
  ON d.codigo = ap.nome_disciplina
JOIN usuario p
  ON p.id     = ap.id_professor
GROUP BY
  ap.nome_disciplina,
  d.nome,
  ap.id_professor,
  p.nome,
  p.sobrenome
HAVING AVG(ap.didatica_nota) > 8.0
ORDER BY media_didatica DESC;

-- 10) Desconto total do aluno 21 (exclui pendentes)
SELECT
  u.id AS aluno_id,
  u.nome || ' ' || u.sobrenome AS aluno,
  m.id AS matricula_id,
  d.motivo AS desconto_motivo,
  d.valor AS desconto_valor
FROM desconto d
JOIN matricula m
  ON d.id_matricula = m.id
JOIN usuario u
  ON m.id_aluno = u.id
WHERE u.id = 21
  AND m.status <> 'pendente'
ORDER BY m.id, d.motivo;

-- 11) Detalhamento dos pré-requisitos para cada curso em que Elisa Santos (id=5) leciona
SELECT
  rd.codigo_disciplina AS disciplina_codigo,
  d1.nome AS disciplina_nome,
  dc.codigo_curso AS curso_codigo,
  c.nome AS curso_nome,
  pdc.codigo_disciplina_prerequisito AS prereq_codigo,
  d2.nome AS prereq_nome
FROM responsavel_disciplina rd
-- disciplina que Elisa leciona
JOIN disciplina d1
  ON d1.codigo = rd.codigo_disciplina
-- quais cursos incluem essas disciplinas
JOIN disciplina_curso dc
  ON dc.codigo_disciplina = rd.codigo_disciplina
JOIN curso c
  ON c.codigo = dc.codigo_curso
-- pré-requisitos desses cursos
JOIN prerequisito_disciplina_curso pdc
  ON pdc.codigo_curso = dc.codigo_curso
JOIN disciplina d2
  ON d2.codigo = pdc.codigo_disciplina_prerequisito
WHERE rd.id_professor = 5
ORDER BY dc.codigo_curso, rd.codigo_disciplina;

-- 12) Detalhamento das regras do curso C01 (Ciência da Computação)
SELECT
  c.codigo AS curso_codigo,
  c.nome AS curso_nome,
  da.codigo AS departamento_codigo,
  da.nome AS departamento_nome,
  r.id AS regra_id,
  r.descricao AS regra_descricao
FROM regra_curso rc
JOIN regra r
  ON r.id = rc.id_regra
JOIN curso c
  ON c.codigo = rc.codigo_curso
JOIN departamento_academico da
  ON da.codigo = c.codigo_departamento_academico
WHERE rc.codigo_curso = 'C01'
ORDER BY r.id;

-- 13) Detalhamento das infraestruturas do curso C01, com unidade
SELECT
  c.codigo AS curso_codigo,
  c.nome AS curso_nome,
  i.id AS infraestrutura_id,
  i.descricao AS infraestrutura_descricao,
  ue.cidade || ' – ' || ue.estado AS unidade
FROM infraestrutura_curso ic
JOIN infraestrutura i
  ON i.id = ic.id_infraestrutura
JOIN curso c
  ON c.codigo = ic.codigo_curso
JOIN unidade_escola ue
  ON ue.id = c.id_unidade_escola
WHERE ic.codigo_curso = 'C01'
ORDER BY i.id;

-- 14) Carga semanal (numero de aulas) total de C01 em 2025/2
SELECT 
  codigo_curso, 
  SUM(n_aulas_semanais) AS carga_semanal 
FROM disciplina_curso dc 
JOIN disciplina d 
  ON dc.codigo_disciplina = d.codigo
JOIN oferta o 
  ON d.codigo = o.codigo_disciplina 
WHERE ano = 2025 
  AND semestre = 2
  AND codigo_curso = 'C01'
GROUP BY codigo_curso;

-- 15) Alunos que concluíram “Algoritmos e Programação” (D01) e o período
SELECT
  u.id AS aluno_id,
  u.nome || ' ' || u.sobrenome AS aluno,
  o.ano,
  o.semestre
FROM matricula m
JOIN usuario u
  ON m.id_aluno = u.id
JOIN oferta o
  ON m.id_oferta = o.id
WHERE o.codigo_disciplina = 'D01'
  AND m.status = 'concluido';

-- 16) Cursos da unidade de Arthur Duarte (id_aluno = 21)
SELECT
  c.codigo,
  c.nome
FROM curso c
WHERE c.id_unidade_escola = (
  SELECT id_unidade_escola
  FROM usuario
  WHERE id = 21
);

-- 17) Disciplinas dadas só por chefes de departamento
SELECT DISTINCT
  d.codigo,
  d.nome
FROM disciplina d
JOIN responsavel_disciplina rd
  ON d.codigo = rd.codigo_disciplina
WHERE rd.id_professor IN (
  SELECT id_professor_chefe
  FROM departamento_academico
);
