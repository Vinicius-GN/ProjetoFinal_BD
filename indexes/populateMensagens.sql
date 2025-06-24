SELECT setval('mensagem_id_seq', (SELECT MAX(id) FROM mensagem));

INSERT INTO mensagem (texto_mensagem, dia_criacao, mes_criacao, ano_criacao, hora_criacao, id_usuario)
SELECT
    'Esta eh uma mensagem de teste de volume ' || s.id,
    floor(random() * 28 + 1)::int,                     
    floor(random() * 12 + 1)::int,                     
    2024,                                              
    (time '00:00' + (s.id || ' seconds')::interval),    
    floor(random() * (60 - 1 + 1) + 1)::int          
FROM
    generate_series(1, 500000) AS s(id);