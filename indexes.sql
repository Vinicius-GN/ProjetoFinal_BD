
-- sugestoes (incompleto):
CREATE INDEX IF NOT EXISTS  idx_usuario_nome_sobrenome_telefone ON usuario(nome, sobrenome, numero_telefone);

-- encontrar quais os acessos criticos (principalmente nos joins) que usam fk mais frequentemente

-- mensagens, pois a base pode ter muitas mensagens gravadas (teoricamente armazena todo o historico)
CREATE INDEX IF NOT EXISTS  idx_mensagem_id_usuario ON mensagem(id_usuario);

-- avisos (mesma razao das mensagens)
CREATE INDEX IF NOT EXISTS  idx_aviso_id_funcionario_administrativo ON aviso(id_funcionario_administrativo);

CREATE INDEX IF NOT EXISTS  idx_matricula_id_aluno ON matricula(id_aluno);

CREATE INDEX IF NOT EXISTS idx_matricula_id_oferta ON matricula(id_oferta);