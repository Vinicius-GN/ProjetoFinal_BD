SELECT setval('oferta_id_seq', (SELECT MAX(id) FROM oferta));

INSERT INTO oferta (ano, semestre, codigo_sala, codigo_disciplina)
SELECT
    floor(random() * (2024 - 2000 + 1) + 2000)::int, 
    floor(random() * 2 + 1)::int,                     
    'S' || LPAD(floor(random() * 10 + 1)::text, 2, '0'), 
    'D' || LPAD(floor(random() * 20 + 1)::text, 2, '0')  
FROM
    generate_series(1, 135000);