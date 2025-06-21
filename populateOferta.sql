-- Conteúdo de: populate_large_oferta.sql

-- Sincroniza o contador de ID da tabela oferta
SELECT setval('oferta_id_seq', (SELECT MAX(id) FROM oferta));

-- Insere 10.000 ofertas históricas com dados aleatórios
INSERT INTO oferta (ano, semestre, codigo_sala, codigo_disciplina)
SELECT
    floor(random() * (2024 - 2000 + 1) + 2000)::int, -- Ano aleatório entre 2000 e 2024
    floor(random() * 2 + 1)::int,                     -- Semestre 1 ou 2
    'S' || LPAD(floor(random() * 10 + 1)::text, 2, '0'), -- Sala aleatória de S01 a S10
    'D' || LPAD(floor(random() * 20 + 1)::text, 2, '0')  -- Disciplina aleatória de D01 a D20
FROM
    generate_series(1, 135000);