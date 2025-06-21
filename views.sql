-- 1) Detalhes dos Alunos e suas Unidades
CREATE OR REPLACE VIEW vw_detalhes_alunos AS
SELECT
u.id AS aluno_id ,
u.nome || ' ' || u.sobrenome AS nome_completo,
u.email,
u.numero_telefone,
ue.cidade AS unidade_cidade,
ue.predio_bloco
FROM usuario u
JOIN unidade_escola ue ON u.id_unidade_escola = ue.id
JOIN vinculo_usuario vu ON u.id = vu.id_usuario
WHERE vu.vinculo = 'aluno';

--2) Professores e suas Disciplinas
CREATE OR REPLACE VIEW vw_professor_disciplinas AS
SELECT
p.id AS professor_id ,
p.nome || ' ' || p.sobrenome AS nome_professor ,
p.titulacao ,
d.codigo AS disciplina_codigo ,
d.nome AS disciplina_nome ,
d.n_aulas_semanais
FROM usuario p
JOIN responsavel_disciplina rd ON p.id = rd.id_professor
JOIN disciplina d ON rd.codigo_disciplina = d.codigo
WHERE p.id IN ( SELECT id_usuario FROM vinculo_usuario WHERE vinculo= 'professor') ;

-- 3) Histórico Acadêmico Detalhado do Aluno
CREATE OR REPLACE VIEW vw_historico_academico_aluno AS
SELECT
u.id AS aluno_id ,
u.nome || ' ' || u.sobrenome AS aluno_nome,
d.nome AS disciplina_nome,
o.ano ,
o.semestre ,
m.status AS status_matricula,
n.motivo AS motivo_nota,
n.valor AS valor_nota
FROM usuario u
JOIN matricula m ON u.id = m.id_aluno
JOIN nota n ON m.id = n.id_matricula
JOIN oferta o ON m.id_oferta = o.id
JOIN disciplina d ON o.codigo_disciplina = d.codigo
WHERE u.id IN ( SELECT id_usuario FROM vinculo_usuario WHERE vinculo = 'aluno' ) ;

-- 4) Resumo Financeiro por Aluno e Semestre
CREATE OR REPLACE VIEW vw_taxas_por_aluno_semestre AS
SELECT
u.id AS aluno_id ,
u.nome || ' ' || u.sobrenome AS aluno_nome ,
o.ano ,
o.semestre ,
SUM ( t.valor ) AS total_taxas_pagas
FROM usuario u
JOIN matricula m ON u.id = m.id_aluno
JOIN oferta o ON m.id_oferta = o.id
JOIN taxa t ON m.id = t.id_matricula
WHERE m.status <>  'pendente'
GROUP BY u.id , u.nome , u.sobrenome , o.ano , o.semestre ;

-- 5) Média de Avaliação dos Professores
CREATE OR REPLACE VIEW vw_media_avaliacao_professor AS
SELECT
ap.id_professor ,
p.nome || ' ' || p.sobrenome AS professor_nome,
p.titulacao ,
d.codigo AS disciplina_codigo ,
d.nome AS disciplina_nome ,
ROUND ( AVG ( ap.didatica_nota ) :: numeric , 2) AS media_didatica ,
COUNT (*) AS quantidade_avaliacoes
FROM avaliacao_professor ap
JOIN usuario p ON ap.id_professor = p.id
JOIN disciplina d ON ap.nome_disciplina = d.codigo
GROUP BY ap.id_professor , p.nome , p.sobrenome , p.titulacao , d.codigo , d.nome ;

-- 6) Catálogo de Cursos com Detalhes Agregados
CREATE OR REPLACE VIEW vw_detalhes_curso_completo AS
SELECT
c.codigo AS curso_codigo ,
c.nome AS curso_nome ,
da.nome AS departamento ,
ue.cidade AS unidade ,
string_agg ( DISTINCT r.descricao , '; ') AS regras ,
string_agg ( DISTINCT i.descricao , '; ') AS infraestrutura
FROM curso c
JOIN departamento_academico da ON c.codigo_departamento_academico = da.codigo
JOIN unidade_escola ue ON c.id_unidade_escola = ue.id
LEFT JOIN regra_curso rc ON c.codigo = rc.codigo_curso
LEFT JOIN regra r ON rc.id_regra = r.id
LEFT JOIN infraestrutura_curso ic ON c.codigo = ic.codigo_curso
LEFT JOIN infraestrutura i ON ic.id_infraestrutura = i.id
GROUP BY c.codigo , c.nome , da.nome , ue.cidade ;