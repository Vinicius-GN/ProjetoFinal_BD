DROP INDEX IF EXISTS idx_mensagem_id_usuario;

ANALYZE mensagem;

EXPLAIN ANALYZE
SELECT id, texto_mensagem FROM mensagem WHERE id_usuario = 42;


CREATE INDEX idx_mensagem_id_usuario ON mensagem(id_usuario);

ANALYZE mensagem;

EXPLAIN ANALYZE
SELECT id, texto_mensagem FROM mensagem WHERE id_usuario = 42;