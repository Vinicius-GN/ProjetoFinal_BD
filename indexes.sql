-- 1) Índice em Chave Estrangeira para Otimizar Junções
CREATE INDEX IF NOT EXISTS idx_matricula_id_aluno
ON matricula ( id_aluno ) ;

-- 2) Índice para Acelerar Buscas por Disciplina
CREATE INDEX IF NOT EXISTS idx_oferta_codigo_disciplina
ON oferta ( codigo_disciplina ) ;

-- 3) Índice em Tabela de Alto Crescimento (Mensagens)
CREATE INDEX IF NOT EXISTS idx_mensagem_id_usuario
ON mensagem ( id_usuario ) ;

-- 4) Índice para Caixa de Entrada de Mensagens
CREATE INDEX idx_destinatario_id_destinatario ON destinatario (
id_destinatario ) ;

-- 5) Índice para Listagem de Alunos por Turma
CREATE INDEX idx_matricula_id_oferta ON matricula ( id_oferta ) ;

-- 6) Índice para Disciplinas de um Professor
CREATE INDEX idx_responsavel_disciplina_id_professor
ON responsavel_disciplina ( id_professor ) ;

-- 7) Índice para Histórico de Avisos por Funcionário
CREATE INDEX idx_aviso_id_funcionario
ON aviso ( id_funcionario_administrativo ) ;

