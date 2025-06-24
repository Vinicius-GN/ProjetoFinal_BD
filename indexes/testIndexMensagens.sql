SET enable_indexscan = off;
SET enable_bitmapscan = off;

ANALYZE mensagem;

EXPLAIN (ANALYZE, BUFFERS, TIMING)
SELECT id, texto_mensagem FROM mensagem WHERE id_usuario = 42;

-- test com indice

RESET enable_indexscan;
RESET enable_bitmapscan;

ANALYZE mensagem;

EXPLAIN (ANALYZE, BUFFERS, TIMING)
SELECT id, texto_mensagem FROM mensagem WHERE id_usuario = 42;