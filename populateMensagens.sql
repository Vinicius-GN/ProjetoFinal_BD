-- Conteúdo de: populate_large_mensagens.sql

-- Sincroniza o contador de ID da tabela mensagem
SELECT setval('mensagem_id_seq', (SELECT MAX(id) FROM mensagem));

-- Insere 500.000 mensagens com dados aleatórios
INSERT INTO mensagem (texto_mensagem, dia_criacao, mes_criacao, ano_criacao, hora_criacao, id_usuario)
SELECT
    'Esta eh uma mensagem de teste de volume ' || s.id,
    floor(random() * 28 + 1)::int,                     -- Dia aleatório
    floor(random() * 12 + 1)::int,                     -- Mês aleatório
    2024,                                              -- Ano fixo
    (time '00:00' + (s.id || ' seconds')::interval),    -- Hora que avança a cada segundo
    floor(random() * (10060 - 1 + 1) + 1)::int          -- Remetente aleatório entre os usuários existentes
FROM
    generate_series(1, 500000) AS s(id);