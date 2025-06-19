-- 1) Obter id do usuário "Ana Silva" com telefone "11987654321"
SELECT id
  FROM usuario
 WHERE nome            = 'Ana'
   AND sobrenome       = 'Silva'
   AND numero_telefone = '11987654321'
;
-- → deve retornar: 1


-- 2) Alunos matriculados em “Algoritmos e Programação” (D01) no período 2024/1
SELECT u.id,
       u.nome || ' ' || u.sobrenome AS aluno,
       o.ano,
       o.semestre
  FROM usuario u
  JOIN matricula m   ON u.id = m.id_aluno
  JOIN oferta o      ON m.id_oferta = o.id
 WHERE o.codigo_disciplina = 'D01'
   AND o.ano              = 2024
   AND o.semestre         = 1
;
-- → deve listar, por exemplo, (21, "Arthur Duarte", 2024, 1), (24, "Daniela Alves", 2024,1) etc.


-- 3)-- Média das notas do aluno 21 (Arthur Duarte), mostrando também disciplina e unidade
SELECT 
  u.id                                AS aluno_id,
  u.nome || ' ' || u.sobrenome        AS aluno,
  d.codigo                            AS disciplina_codigo,
  d.nome                              AS disciplina,
  ue.cidade || ' – ' || ue.estado     AS unidade,
  ROUND(AVG(n.valor)::numeric,2)      AS media_notas
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
  u.id, u.nome, u.sobrenome, 
  d.codigo, d.nome, 
  ue.cidade, ue.estado
;

--4) Professores do departamento DA1 com código e nome do departamento e suas disciplinas
SELECT 
  da.codigo            AS departamento_codigo,
  da.nome              AS departamento_nome,
  p.id                 AS professor_id,
  p.nome || ' ' || p.sobrenome AS professor,
  d.codigo             AS disciplina_codigo,
  d.nome               AS disciplina
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
WHERE da.codigo = 'DA1'
;

-- 5) Cursos sem matrícula no último período (2025/2)
WITH ultimo AS (
  SELECT 2025 AS ano, 2 AS semestre
)
SELECT c.codigo, c.nome
  FROM curso c
 WHERE NOT EXISTS (
   SELECT 1
     FROM disciplina_curso dc
     JOIN oferta o ON dc.codigo_disciplina = o.codigo_disciplina
     JOIN matricula m ON m.id_oferta = o.id
     JOIN ultimo u ON o.ano = u.ano AND o.semestre = u.semestre
    WHERE dc.codigo_curso = c.codigo
 )
;
-- → aqueles cursos que, em 2025/2, não tiveram nenhuma matrícula.


-- 6) Mensagens enviadas por alunos de “Algoritmos e Programação” (D01)
SELECT msg.id,
       msg.texto_mensagem,
       msg.dia_criacao || '/' || msg.mes_criacao || '/' || msg.ano_criacao AS data,
       msg.hora_criacao,
       msg.id_usuario AS aluno_id
  FROM mensagem msg
 WHERE msg.id_usuario IN (
   SELECT m.id_aluno
     FROM matricula m
     JOIN oferta o ON m.id_oferta = o.id
    WHERE o.codigo_disciplina = 'D01'
 )
;
-- → texto e data/hora de todas as mensagens desses alunos.


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
       BETWEEN '2024-01-01 00:00' AND '2024-12-31 23:59'
;
-- → lista os 12 meses de avisos desse intervalo.


-- 8) Total de taxas pagas pelo aluno 21 no semestre 2024/1, exibindo também o nome do aluno
SELECT 
  u.id                                  AS aluno_id,
  u.nome || ' ' || u.sobrenome          AS aluno,
  SUM(t.valor)                          AS total_taxas
FROM taxa t
JOIN matricula m ON t.id_matricula = m.id
JOIN oferta o    ON m.id_oferta    = o.id
JOIN usuario u   ON u.id           = m.id_aluno
WHERE m.id_aluno    = 21
  AND o.ano         = 2024
  AND o.semestre    = 1
  AND m.status     <> 'pendente'
GROUP BY u.id, u.nome, u.sobrenome
;
-- → soma de todos os valores da coluna valor para esse filtro.

-- 9) Disciplinas cujos professores têm média de didática > 8.0
SELECT DISTINCT ap.nome_disciplina
  FROM avaliacao_professor ap
 GROUP BY ap.nome_disciplina
HAVING AVG(ap.didatica_nota) > 8.0
;
-- → ex.: 'Banco de Dados', 'Nutrição e Dietética', etc., conforme as notas.


-- 10) Desconto total do aluno 21 (exclui pendentes)
SELECT SUM(d.valor) AS total_descontos
  FROM desconto d
  JOIN matricula m ON d.id_matricula = m.id
 WHERE m.id_aluno = 21
   AND m.status   <> 'pendente'
;
-- → soma de todos os descontos para Arthur Duarte.


-- 11) Pré-requisitos de disciplinas dadas por Elisa Santos (id_professor = 5)
SELECT DISTINCT pdc.codigo_disciplina_prerequisito
  FROM responsavel_disciplina rd
  JOIN disciplina_curso dc               ON rd.codigo_disciplina = dc.codigo_disciplina
  JOIN prerequisito_disciplina_curso pdc ON dc.codigo_curso      = pdc.codigo_curso
 WHERE rd.id_professor = 5
;
-- → códigos das disciplinas pré-requisito para o curso de Informática.


-- 12) Regras do curso C01 (Ciência da Computação)
SELECT r.id, r.descricao
  FROM regra r
  JOIN regra_curso rc ON r.id = rc.id_regra
 WHERE rc.codigo_curso = 'C01'
;
-- → as 2 regras vinculadas ao C01.


-- 13) Infraestruturas do curso C01
SELECT i.id, i.descricao
  FROM infraestrutura i
  JOIN infraestrutura_curso ic ON i.id = ic.id_infraestrutura
 WHERE ic.codigo_curso = 'C01'
;
-- → por ex. 'Laboratório de Informática', 'Biblioteca'.


-- 14) Carga horária semanal total de C01 em 2024/1
SELECT SUM(d.n_aulas_semanais) AS carga_total
  FROM disciplina_curso dc
  JOIN disciplina d   ON dc.codigo_disciplina = d.codigo
  JOIN oferta o       ON d.codigo = o.codigo_disciplina
 WHERE dc.codigo_curso = 'C01'
   AND o.ano          = 2024
   AND o.semestre     = 2
;
-- → soma dos valores em n_aulas_semanais para essas disciplinas.


-- 15) Alunos que concluíram “Algoritmos e Programação” (D01) e o período
SELECT u.id AS aluno_id,
       u.nome || ' ' || u.sobrenome AS aluno,
       o.ano,
       o.semestre
  FROM matricula m
  JOIN usuario u ON m.id_aluno = u.id
  JOIN oferta o  ON m.id_oferta = o.id
 WHERE o.codigo_disciplina = 'D01'
   AND m.status           = 'concluido'
;
-- → lista de Arthur, Daniela… cada um com 2024/1 ou 2025/2.


-- 16) Cursos da unidade de Arthur Duarte (id_aluno = 21)
SELECT c.codigo, c.nome
  FROM curso c
 WHERE c.id_unidade_escola = (
   SELECT id_unidade_escola
     FROM usuario
    WHERE id = 21
 )
;
-- → todos os cursos associados à unidade 1 (São Paulo).


-- 17) Disciplinas dadas *só* por chefes de departamento
SELECT DISTINCT d.codigo, d.nome
  FROM disciplina d
  JOIN responsavel_disciplina rd ON d.codigo = rd.codigo_disciplina
 WHERE rd.id_professor IN (
   SELECT id_professor_chefe
     FROM departamento_academico
 )
;
-- → as D01–D20 que ficaram atribuídas apenas a professores-chefe.

