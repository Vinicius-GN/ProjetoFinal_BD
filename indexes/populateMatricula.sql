SELECT setval('matricula_id_seq', (SELECT MAX(id) FROM matricula));

INSERT INTO matricula (id_aluno, id_oferta, status, status_pagamento, dia_limite_confirmacao, mes_limite_confirmacao, ano_limite_confirmacao)
SELECT
    floor(random() * (40 - 21 + 1) + 21)::int,

    floor(random() * (40 - 1 + 1) + 1)::int,

    'ativo', 
    'pago',  
    1, 7, 2025 
FROM
    generate_series(1, 250000);
