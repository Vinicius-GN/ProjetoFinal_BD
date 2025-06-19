-- ======================================================
-- populate_static.sql
-- execute: psql -U postgres -d SEU_BD -f populate_static.sql
-- ======================================================

-- 1) Unidades da escola (5)
INSERT INTO unidade_escola (id, cidade, estado, pais, predio_bloco) VALUES
  (1,'São Paulo','SP','Brasil','Bloco A'),
  (2,'Rio de Janeiro','RJ','Brasil','Bloco B'),
  (3,'Belo Horizonte','MG','Brasil','Bloco C'),
  (4,'Salvador','BA','Brasil','Bloco D'),
  (5,'Fortaleza','CE','Brasil','Bloco E');

-- 2) Regras (5)
INSERT INTO regra (id, descricao) VALUES
  (1,'Frequência mínima de 70%'),
  (2,'Nota mínima 5.0'),
  (3,'Entrega de trabalhos obrigatórios'),
  (4,'Participação em seminários'),
  (5,'Projeto final avaliado');

-- 3) Infraestruturas (5)
INSERT INTO infraestrutura (id, descricao) VALUES
  (1,'Laboratório de Informática'),
  (2,'Biblioteca'),
  (3,'Quadra de esportes'),
  (4,'Auditório'),
  (5,'Sala de estudos');

-- 4) Bolsas (5)
INSERT INTO bolsa (id, tipo, valor) VALUES
  (1,'Mérito Acadêmico',1000.0),
  (2,'Apoio Social',500.0),
  (3,'Pesquisa',1500.0),
  (4,'Esportiva',800.0),
  (5,'Cultural',700.0);

-- 5) Usuários: Professores (1–20)
INSERT INTO usuario (
  id, nome, sobrenome, numero_telefone,
  dia_nascimento, mes_nascimento, ano_nascimento,
  rua, numero, cep, cidade, sexo,
  email, senha, area_especializacao, titulacao, id_unidade_escola
) VALUES
( 1, 'Ana',      'Silva',     '11987654321',  1,  2, 1961, 'Rua das Flores',      '101', '01001000','São Paulo',      'F','ana.silva@escola.com',     'senhaAna1',     'Matemática',    'mestrado',       1),
( 2, 'Bruno',    'Costa',     '21923456789',  2,  3, 1962, 'Avenida Brasil',      '102', '20040030','Rio de Janeiro', 'M','bruno.costa@escola.com',   'senhaBruno2',   'Física',        'doutorado',      2),
( 3, 'Carla',    'Pereira',   '31976543210',  3,  4, 1963, 'Travessa do Sol',     '103', '30140071','Belo Horizonte','F','carla.pereira@escola.com', 'senhaCarla3',   'Química',       'pos_doutorado',  3),
( 4, 'Daniel',   'Oliveira',  '41987651234',  4,  5, 1964, 'Praça da Liberdade',   '104', '40015520','Salvador',       'M','daniel.oliveira@escola.com','senhaDaniel4',  'Biologia',      'mestrado',       4),
( 5, 'Elisa',    'Santos',    '51900011122',  5,  6, 1965, 'Alameda Santos',      '105', '50010010','Fortaleza',      'F','elisa.santos@escola.com',  'senhaElisa5',   'Informática',   'doutorado',      5),
( 6, 'Felipe',   'Rodrigues', '11923450000',  6,  7, 1966, 'Rua XV de Novembro',  '106', '01002000','São Paulo',      'M','felipe.rodrigues@escola.com','senhaFelipe6',  'História',      'pos_doutorado',  1),
( 7, 'Gabriela', 'Almeida',   '21911122233',  7,  8, 1967, 'Estrada do Coco',     '107', '20050040','Rio de Janeiro', 'F','gabriela.almeida@escola.com','senhaGabriela7','Geografia',     'doutorado',      2),
( 8, 'Henrique', 'Souza',     '31933344455',  8,  9, 1968, 'Rua do Comércio',     '108', '30110080','Belo Horizonte','M','henrique.souza@escola.com','senhaHenrique8','Literatura',    'mestrado',       3),
( 9, 'Isabela',  'Lima',      '41955566677',  9, 10, 1969, 'Rua das Acácias',     '109', '40020050','Salvador',       'F','isabela.lima@escola.com',   'senhaIsabela9', 'Filosofia',     'mestrado',       4),
(10,'João',      'Carvalho',  '51977788899', 10, 11, 1970, 'Rua das Palmeiras',   '110', '50020020','Fortaleza',      'M','joao.carvalho@escola.com',  'senhaJoao10',   'Sociologia',    'doutorado',      5),
(11,'Karina',    'Gomes',     '11988877766', 11, 12, 1971, 'Rua Marechal Deodoro','111', '01003000','São Paulo',      'F','karina.gomes@escola.com',   'senhaKarina11', 'Ed. Física',    'mestrado',       1),
(12,'Lucas',     'Ribeiro',   '21966655544', 12,  1, 1972, 'Rua Boa Vista',       '112', '20060060','Rio de Janeiro', 'M','lucas.ribeiro@escola.com',  'senhaLucas12',  'Arte',          'pos_doutorado',  2),
(13,'Mariana',   'Martins',   '31944433322', 13,  2, 1973, 'Avenida Paulista',    '113', '30120090','Belo Horizonte','F','mariana.martins@escola.com','senhaMariana13','Música',        'doutorado',      3),
(14,'Nicolas',   'Araújo',    '41922211100', 14,  3, 1974, 'Rua Augusta',         '114', '40030070','Salvador',       'M','nicolas.araujo@escola.com', 'senhaNicolas14','Economia',      'mestrado',       4),
(15,'Olivia',    'Nunes',     '51901010101', 15,  4, 1975, 'Rua das Laranjeiras', '115', '50030030','Fortaleza',      'F','olivia.nunes@escola.com',   'senhaOlivia15','Psicologia',    'mestrado',       5),
(16,'Pedro',     'Barros',    '11912121212', 16,  5, 1976, 'Rua das Oliveiras',   '116', '01004000','São Paulo',      'M','pedro.barros@escola.com',   'senhaPedro16',  'Engenharia',    'pos_doutorado',  1),
(17,'Quintino',  'Pires',     '21923232323', 17,  6, 1977, 'Rua do Cais',         '117', '20070080','Rio de Janeiro', 'M','quintino.pires@escola.com', 'senhaQuintino17','Direito',      'doutorado',      2),
(18,'Rafael',    'Mendes',    '31934343434', 18,  7, 1978, 'Rua das Rosas',       '118', '30130000','Belo Horizonte','M','rafael.mendes@escola.com',  'senhaRafael18','Administração', 'mestrado',       3),
(19,'Sofia',     'Teixeira',  '41945454545', 19,  8, 1979, 'Rua do Limoeiro',     '119', '40040010','Salvador',       'F','sofia.teixeira@escola.com', 'senhaSofia19','Medicina',      'doutorado',      4),
(20,'Tiago',     'Melo',      '51956565656', 20,  9, 1980, 'Estrada da Gávea',    '120', '50040040','Fortaleza',      'M','tiago.melo@escola.com',     'senhaTiago20','Odontologia',   'pos_doutorado',  5)
;

-- 6) Usuários: Alunos (21–40)
INSERT INTO usuario (
  id, nome, sobrenome, numero_telefone,
  dia_nascimento, mes_nascimento, ano_nascimento,
  rua, numero, cep, cidade, sexo,
  email, senha, area_especializacao, titulacao, id_unidade_escola
) VALUES
(21, 'Arthur',   'Duarte',    '11911122233',  2,  2, 2000, 'Rua das Orquídeas',       '201','01050000','São Paulo',      'M','arthur.duarte@escola.com', 'senhaArthur21', NULL,NULL,1),
(22, 'Beatriz',  'Ramos',     '21922233344',  3,  3, 2001, 'Rua das Hortênsias',      '202','20060000','Rio de Janeiro', 'F','beatriz.ramos@escola.com','senhaBeatriz22',NULL,NULL,2),
(23, 'Caio',     'Ferreira',  '31933344455',  4,  4, 2002, 'Avenida das Américas',     '203','30170000','Belo Horizonte','M','caio.ferreira@escola.com', 'senhaCaio23',   NULL,NULL,3),
(24, 'Daniela',  'Alves',     '41944455566',  5,  5, 2003, 'Travessa das Margaridas',  '204','40080000','Salvador',       'F','daniela.alves@escola.com','senhaDaniela24',NULL,NULL,4),
(25, 'Eduardo',  'Melo',      '51955566677',  6,  6, 2004, 'Rua do Bosque',            '205','50090000','Fortaleza',      'M','eduardo.melo@escola.com', 'senhaEduardo25',NULL,NULL,5),
(26, 'Fabiana',  'Moreira',   '11966677788',  7,  7, 2005, 'Rua da Alegria',           '206','01011000','São Paulo',      'F','fabiana.moreira@escola.com','senhaFabiana26',NULL,NULL,1),
(27, 'Gabriel',  'Ribeiro',   '21977788899',  8,  8, 2006, 'Rua do Farol',             '207','20022000','Rio de Janeiro', 'M','gabriel.ribeiro@escola.com','senhaGabriel27',NULL,NULL,2),
(28, 'Heloisa',  'Pinto',     '31988899900',  9,  9, 2007, 'Alameda dos Anjos',        '208','30133000','Belo Horizonte','F','heloisa.pinto@escola.com','senhaHeloisa28',NULL,NULL,3),
(29, 'Igor',     'Castro',    '41999900011', 10, 10, 2008, 'Rua do Horizonte',         '209','40044000','Salvador',       'M','igor.castro@escola.com',   'senhaIgor29',   NULL,NULL,4),
(30, 'Juliana',  'Cardoso',   '51900011122', 11, 11, 2009, 'Rua do Luar',              '210','50055000','Fortaleza',      'F','juliana.cardoso@escola.com','senhaJuliana30',NULL,NULL,5),
(31, 'Keila',    'Rocha',     '11912131415', 12, 12, 2010, 'Rua da Paz',               '211','01066000','São Paulo',      'F','keila.rocha@escola.com',   'senhaKeila31',  NULL,NULL,1),
(32, 'Leonardo', 'Silva',     '21914151617', 13,  1, 2011, 'Rua dos Girassóis',        '212','20077000','Rio de Janeiro', 'M','leonardo.silva@escola.com','senhaLeonardo32',NULL,NULL,2),
(33, 'Marina',   'Santos',    '31916171819', 14,  2, 2012, 'Rua do Vento',             '213','30188000','Belo Horizonte','F','marina.santos@escola.com', 'senhaMarina33', NULL,NULL,3),
(34, 'Natalia',  'Oliveira',  '41918192021', 15,  3, 2013, 'Rua das Estrelas',         '214','40099000','Salvador',       'F','natalia.oliveira@escola.com','senhaNatalia34',NULL,NULL,4),
(35, 'Paulo',    'Costa',     '51921222324', 16,  4, 2014, 'Rua do Lago',              '215','50100100','Fortaleza',      'M','paulo.costa@escola.com',    'senhaPaulo35',  NULL,NULL,5),
(36, 'Rebeca',   'Lima',      '11923242526', 17,  5, 2015, 'Rua da Montanha',          '216','01010200','São Paulo',      'F','rebeca.lima@escola.com',    'senhaRebeca36', NULL,NULL,1),
(37, 'Samuel',   'Gomes',     '21925262728', 18,  6, 2016, 'Rua do Pescador',          '217','20020300','Rio de Janeiro', 'M','samuel.gomes@escola.com',   'senhaSamuel37', NULL,NULL,2),
(38, 'Taina',    'Martins',   '31927282930', 19,  7, 2017, 'Rua das Conchas',          '218','30130400','Belo Horizonte','F','taina.martins@escola.com',  'senhaTaina38',  NULL,NULL,3),
(39, 'Vitoria',  'Souza',     '41929303132', 20,  8, 2018, 'Rua do Sol',               '219','40040500','Salvador',       'F','vitoria.souza@escola.com',  'senhaVitoria39',NULL,NULL,4),
(40, 'Yasmin',   'Araújo',    '51930313233', 21,  9, 2019, 'Rua da Lua',               '220','50050600','Fortaleza',      'F','yasmin.araujo@escola.com', 'senhaYasmin40', NULL,NULL,5)
;

-- 7) Usuários: Funcionários (41–60)
INSERT INTO usuario (
  id, nome, sobrenome, numero_telefone,
  dia_nascimento, mes_nascimento, ano_nascimento,
  rua, numero, cep, cidade, sexo,
  email, senha, area_especializacao, titulacao, id_unidade_escola
) VALUES
(41,'Marcos','Ferreira','11999900011',  5,1,1981,'Rua das Palmeiras','301','01020100','São Paulo','M','marcos.ferreira@escola.com','senhaMarcos41',NULL,NULL,1),
(42,'Luciana','Silva','21988811122',  6,2,1982,'Avenida Central','302','20030200','Rio de Janeiro','F','luciana.silva@escola.com','senhaLuciana42',NULL,NULL,2),
(43,'Fernando','Souza','31977722233',  7,3,1983,'Travessa das Laranjeiras','303','30140300','Belo Horizonte','M','fernando.souza@escola.com','senhaFernando43',NULL,NULL,3),
(44,'Patrícia','Gomes','41966633344',  8,4,1984,'Praça Sete','304','40050400','Salvador','F','patricia.gomes@escola.com','senhaPatricia44',NULL,NULL,4),
(45,'Ricardo','Santos','51955544455',  9,5,1985,'Alameda Ferroviária','305','50060500','Fortaleza','M','ricardo.santos@escola.com','senhaRicardo45',NULL,NULL,5),
(46,'Juliana','Costa','11944455566', 10,6,1986,'Rua do Comércio','306','01070700','São Paulo','F','juliana.costa@escola.com','senhaJuliana46',NULL,NULL,1),
(47,'Maurício','Alves','21933366677', 11,7,1987,'Rua das Acácias','307','20080800','Rio de Janeiro','M','mauricio.alves@escola.com','senhaMauricio47',NULL,NULL,2),
(48,'Renata','Pinto','31922277788', 12,8,1988,'Rua das Hortênsias','308','30190900','Belo Horizonte','F','renata.pinto@escola.com','senhaRenata48',NULL,NULL,3),
(49,'Alexandre','Lima','41911188899', 13,9,1989,'Rua do Farol','309','40001000','Salvador','M','alexandre.lima@escola.com','senhaAlexandre49',NULL,NULL,4),
(50,'Camila','Ribeiro','51900099900', 14,10,1990,'Estrada Velha','310','50011100','Fortaleza','F','camila.ribeiro@escola.com','senhaCamila50',NULL,NULL,5),
(51,'Gustavo','Rocha','11910101010', 15,11,1991,'Rua Nova','311','01021200','São Paulo','M','gustavo.rocha@escola.com','senhaGustavo51',NULL,NULL,1),
(52,'Aline','Carvalho','21920202020', 16,12,1992,'Avenida das Nações','312','20031300','Rio de Janeiro','F','aline.carvalho@escola.com','senhaAline52',NULL,NULL,2),
(53,'Bruno','Dias','31930303030', 17,1,1993,'Travessa do Cedro','313','30141400','Belo Horizonte','M','bruno.dias@escola.com','senhaBruno53',NULL,NULL,3),
(54,'Daniela','Melo','41940404040', 18,2,1994,'Praça da Paz','314','40051500','Salvador','F','daniela.melo@escola.com','senhaDaniela54',NULL,NULL,4),
(55,'Eduardo','Mota','51950505050', 19,3,1995,'Alameda dos Manacás','315','50061600','Fortaleza','M','eduardo.mota@escola.com','senhaEduardo55',NULL,NULL,5),
(56,'Fernanda','Barros','11960606060',20,4,1996,'Rua do Progresso','316','01071700','São Paulo','F','fernanda.barros@escola.com','senhaFernanda56',NULL,NULL,1),
(57,'Hugo','Nunes','21970707070',21,5,1997,'Rua do Sossego','317','20081800','Rio de Janeiro','M','hugo.nunes@escola.com','senhaHugo57',NULL,NULL,2),
(58,'Isabela','Pires','31980808080',22,6,1998,'Rua do Mar','318','30191900','Belo Horizonte','F','isabela.pires@escola.com','senhaIsabela58',NULL,NULL,3),
(59,'José','Teixeira','41990909090',23,7,1999,'Rua das Gardênias','319','40002000','Salvador','M','jose.teixeira@escola.com','senhaJose59',NULL,NULL,4),
(60,'Karen','Araújo','51912121212',24,8,2000,'Rua do Horizonte','320','50012100','Fortaleza','F','karen.araujo@escola.com','senhaKaren60',NULL,NULL,5)
;

-- 8) Vínculo de usuário (60)
INSERT INTO vinculo_usuario (id_usuario, vinculo) VALUES
  (1,'professor'), (2,'professor'), (3,'professor'), (4,'professor'),
  (5,'professor'), (6,'professor'), (7,'professor'), (8,'professor'),
  (9,'professor'),(10,'professor'),(11,'professor'),(12,'professor'),
  (13,'professor'),(14,'professor'),(15,'professor'),(16,'professor'),
  (17,'professor'),(18,'professor'),(19,'professor'),(20,'professor'),
  (21,'aluno'),    (22,'aluno'),    (23,'aluno'),    (24,'aluno'),
  (25,'aluno'),    (26,'aluno'),    (27,'aluno'),    (28,'aluno'),
  (29,'aluno'),    (30,'aluno'),    (31,'aluno'),    (32,'aluno'),
  (33,'aluno'),    (34,'aluno'),    (35,'aluno'),    (36,'aluno'),
  (37,'aluno'),    (38,'aluno'),    (39,'aluno'),    (40,'aluno'),
  (41,'funcionario_publico'),(42,'funcionario_publico'),
  (43,'funcionario_publico'),(44,'funcionario_publico'),
  (45,'funcionario_publico'),(46,'funcionario_publico'),
  (47,'funcionario_publico'),(48,'funcionario_publico'),
  (49,'funcionario_publico'),(50,'funcionario_publico'),
  (51,'funcionario_publico'),(52,'funcionario_publico'),
  (53,'funcionario_publico'),(54,'funcionario_publico'),
  (55,'funcionario_publico'),(56,'funcionario_publico'),
  (57,'funcionario_publico'),(58,'funcionario_publico'),
  (59,'funcionario_publico'),(60,'funcionario_publico')
;

-- 9) Disciplinas (20)
INSERT INTO disciplina (codigo, nome, n_aulas_semanais, id_unidade_escola) VALUES
  ('D01','Algoritmos e Programação',        4,1),
  ('D02','Estruturas de Dados',             4,2),
  ('D03','Banco de Dados',                  3,3),
  ('D04','Engenharia de Software',          3,4),
  ('D05','Redes de Computadores',           5,5),
  ('D06','Cálculo Diferencial e Integral',  4,1),
  ('D07','Álgebra Linear',                  3,2),
  ('D08','Física Geral',                    5,3),
  ('D09','Química Geral',                   4,4),
  ('D10','Biologia Celular',                3,5),
  ('D11','Estatística Aplicada',            4,1),
  ('D12','Metodologia Científica',          5,2),
  ('D13','Sociologia',                      3,3),
  ('D14','Psicologia Geral',                4,4),
  ('D15','Fundamentos de Administração',    5,5),
  ('D16','Economia Política',               3,1),
  ('D17','Direito Constitucional',          4,2),
  ('D18','Anatomia Humana',                 5,3),
  ('D19','Projeto Arquitetônico',           3,4),
  ('D20','Nutrição e Dietética',            4,5)
;


-- 10) Salas (10)
INSERT INTO sala (codigo, capacidade) VALUES
  ('S01',22),('S02',24),('S03',26),('S04',28),('S05',30),
  ('S06',32),('S07',34),('S08',36),('S09',38),('S10',40)
;

-- 11) Ofertas (40)
INSERT INTO oferta (id, ano, semestre, codigo_sala, codigo_disciplina) VALUES
  ( 1,2024,1,'S01','D01'),( 2,2025,2,'S02','D01'),
  ( 3,2024,1,'S03','D02'),( 4,2025,2,'S04','D02'),
  ( 5,2024,1,'S05','D03'),( 6,2025,2,'S06','D03'),
  ( 7,2024,1,'S07','D04'),( 8,2025,2,'S08','D04'),
  ( 9,2024,1,'S09','D05'),(10,2025,2,'S10','D05'),
  (11,2024,1,'S01','D06'),(12,2025,2,'S02','D06'),
  (13,2024,1,'S03','D07'),(14,2025,2,'S04','D07'),
  (15,2024,1,'S05','D08'),(16,2025,2,'S06','D08'),
  (17,2024,1,'S07','D09'),(18,2025,2,'S08','D09'),
  (19,2024,1,'S09','D10'),(20,2025,2,'S10','D10'),
  (21,2024,1,'S01','D11'),(22,2025,2,'S02','D11'),
  (23,2024,1,'S03','D12'),(24,2025,2,'S04','D12'),
  (25,2024,1,'S05','D13'),(26,2025,2,'S06','D13'),
  (27,2024,1,'S07','D14'),(28,2025,2,'S08','D14'),
  (29,2024,1,'S09','D15'),(30,2025,2,'S10','D15'),
  (31,2024,1,'S01','D16'),(32,2025,2,'S02','D16'),
  (33,2024,1,'S03','D17'),(34,2025,2,'S04','D17'),
  (35,2024,1,'S05','D18'),(36,2025,2,'S06','D18'),
  (37,2024,1,'S07','D19'),(38,2025,2,'S08','D19'),
  (39,2024,1,'S09','D20'),(40,2025,2,'S10','D20')
;

-- 12) Departamentos Acadêmicos (5)
INSERT INTO departamento_academico (codigo, nome, id_professor_chefe) VALUES
  ('DA1','Departamento de Ciência da Computação e Informática',      5),  -- Elisa Santos (Informática) chefia CS e BD
  ('DA2','Departamento de Física e Engenharia de Software',          2),  -- Bruno Costa (Física) chefia Física e SW
  ('DA3','Departamento de Química e Sistemas de Informação',         3),  -- Carla Pereira (Química) chefia Química e SI
  ('DA4','Departamento de Biociências e Saúde',                     4),  -- Daniel Oliveira (Biologia) chefia Biologia e Nutrição
  ('DA5','Departamento de Administração, Economia e Negócios',     18)   -- Rafael Mendes (Administração) chefia Administração e Economia
;

-- 13) Cursos (20)
INSERT INTO curso (
  codigo, nome, nivel_ensino, carga_horaria_total,
  numero_vagas, ementa, codigo_padrao,
  codigo_departamento_academico, id_unidade_escola
) VALUES
  ('C01','Ciência da Computação',     'graduacao',410, 50,'Ementa: algoritmos, paradigmas de programação','S01','DA1',1),
  ('C02','Engenharia de Software',    'graduacao',420, 50,'Ementa: metodologias ágeis e testes','S02','DA2',2),
  ('C03','Sistemas de Informação',    'graduacao',430, 50,'Ementa: gestão de banco de dados e BI','S03','DA3',3),
  ('C04','Engenharia Civil',          'graduacao',440, 50,'Ementa: estruturas, materiais e fundações','S04','DA4',4),
  ('C05','Arquitetura',               'graduacao',450, 50,'Ementa: projeto arquitetônico e urbanismo','S05','DA5',5),
  ('C06','Matemática Aplicada',       'graduacao',460, 50,'Ementa: equações diferenciais e modelagem matemática','S06','DA1',1),
  ('C07','Física',                    'graduacao',470, 50,'Ementa: mecânica, termodinâmica e óptica','S07','DA2',2),
  ('C08','Química',                   'graduacao',480, 50,'Ementa: química orgânica e inorgânica','S08','DA3',3),
  ('C09','Biologia',                  'graduacao',490, 50,'Ementa: genética, ecologia e bioquímica','S09','DA4',4),
  ('C10','Administração',             'graduacao',500, 50,'Ementa: finanças, marketing e RH','S10','DA5',5),
  ('C11','Economia',                  'graduacao',510, 50,'Ementa: micro, macro e econometria','S01','DA1',1),
  ('C12','Psicologia',                'graduacao',520, 50,'Ementa: teorias psicológicas e pesquisa','S02','DA2',2),
  ('C13','Direito',                   'graduacao',530, 50,'Ementa: fundamentos do direito e jurisprudência','S03','DA3',3),
  ('C14','Enfermagem',                'graduacao',540, 50,'Ementa: cuidados de saúde e enfermagem crítica','S04','DA4',4),
  ('C15','Medicina',                  'graduacao',550, 50,'Ementa: anatomia, semiologia e clínica médica','S05','DA5',5),
  ('C16','Odontologia',               'graduacao',560, 50,'Ementa: anatomia bucal e técnicas odontológicas','S06','DA1',1),
  ('C17','Educação Física',           'graduacao',570, 50,'Ementa: fisiologia do exercício e pedagogia esportiva','S07','DA2',2),
  ('C18','Design',                    'graduacao',580, 50,'Ementa: design gráfico e de produtos','S08','DA3',3),
  ('C19','Comunicação Social',        'graduacao',590, 50,'Ementa: jornalismo, publicidade e mídias digitais','S09','DA4',4),
  ('C20','Nutrição',                  'graduacao',600, 50,'Ementa: dietética e metabolismo','S10','DA5',5)
;

--- 14) Disciplina–Curso (40)
INSERT INTO disciplina_curso (codigo_curso, codigo_disciplina) VALUES
  -- Ciência da Computação
  ('C01','D01'),('C01','D02'),
  -- Engenharia de Software
  ('C02','D01'),('C02','D04'),
  -- Sistemas de Informação
  ('C03','D03'),('C03','D11'),
  -- Engenharia Civil
  ('C04','D06'),('C04','D07'),
  -- Arquitetura
  ('C05','D19'),('C05','D06'),
  -- Matemática Aplicada
  ('C06','D06'),('C06','D11'),
  -- Física
  ('C07','D08'),('C07','D06'),
  -- Química
  ('C08','D09'),('C08','D03'),
  -- Biologia
  ('C09','D10'),('C09','D09'),
  -- Administração
  ('C10','D15'),('C10','D11'),
  -- Economia
  ('C11','D16'),('C11','D11'),
  -- Psicologia
  ('C12','D14'),('C12','D13'),
  -- Direito
  ('C13','D17'),('C13','D13'),
  -- Enfermagem
  ('C14','D18'),('C14','D10'),
  -- Medicina
  ('C15','D18'),('C15','D09'),
  -- Odontologia
  ('C16','D18'),('C16','D10'),
  -- Educação Física
  ('C17','D14'),('C17','D08'),
  -- Design
  ('C18','D19'),('C18','D12'),
  -- Comunicação Social
  ('C19','D13'),('C19','D12'),
  -- Nutrição
  ('C20','D20'),('C20','D10')
;

-- 15) Infraestrutura–Curso (40)
INSERT INTO infraestrutura_curso (codigo_curso, id_infraestrutura) VALUES
  ('C01',1),('C01',2),
  ('C02',2),('C02',3),
  ('C03',3),('C03',4),
  ('C04',4),('C04',5),
  ('C05',5),('C05',1),
  ('C06',1),('C06',2),
  ('C07',2),('C07',3),
  ('C08',3),('C08',4),
  ('C09',4),('C09',5),
  ('C10',5),('C10',1),
  ('C11',1),('C11',2),
  ('C12',2),('C12',3),
  ('C13',3),('C13',4),
  ('C14',4),('C14',5),
  ('C15',5),('C15',1),
  ('C16',1),('C16',2),
  ('C17',2),('C17',3),
  ('C18',3),('C18',4),
  ('C19',4),('C19',5),
  ('C20',5),('C20',1)
;

-- 16) Regra–Curso (40)
INSERT INTO regra_curso (codigo_curso, id_regra) VALUES
  ('C01',1),('C01',2),
  ('C02',2),('C02',3),
  ('C03',3),('C03',4),
  ('C04',4),('C04',5),
  ('C05',5),('C05',1),
  ('C06',1),('C06',2),
  ('C07',2),('C07',3),
  ('C08',3),('C08',4),
  ('C09',4),('C09',5),
  ('C10',5),('C10',1),
  ('C11',1),('C11',2),
  ('C12',2),('C12',3),
  ('C13',3),('C13',4),
  ('C14',4),('C14',5),
  ('C15',5),('C15',1),
  ('C16',1),('C16',2),
  ('C17',2),('C17',3),
  ('C18',3),('C18',4),
  ('C19',4),('C19',5),
  ('C20',5),('C20',1)
;

-- 17) Pré-requisito Curso→Curso (5)
INSERT INTO prerequisito_curso_curso (codigo_curso, codigo_curso_prerequisito) VALUES
  ('C02','C01'),
  ('C03','C02'),
  ('C05','C04'),
  ('C07','C06'),
  ('C10','C09')
;

-- 18) Pré-requisito Disciplina→Curso (5)
INSERT INTO prerequisito_disciplina_curso (codigo_curso, codigo_disciplina_prerequisito) VALUES
  ('C01','D02'),
  ('C02','D04'),
  ('C05','D03'),
  ('C07','D10'),
  ('C10','D01')
;

-- 19) Responsável por Disciplina (20) — garantindo coerência por departamento
INSERT INTO responsavel_disciplina (codigo_disciplina, id_professor) VALUES
  -- Departamento DA1 (Ciência da Computação e Informática) → Elisa Santos (id=5)
  ('D01',5),  -- Algoritmos e Programação
  ('D02',5),  -- Estruturas de Dados
  ('D03',5),  -- Banco de Dados
  ('D04',5),  -- Engenharia de Software
  ('D05',5),  -- Redes de Computadores

  -- Matemática → Ana Silva (id=1)
  ('D06',1),  -- Cálculo Diferencial e Integral
  ('D07',1),  -- Álgebra Linear
  ('D11',1),  -- Estatística Aplicada

  -- Física → Bruno Costa (id=2)
  ('D08',2),

  -- Química → Carla Pereira (id=3)
  ('D09',3),

  -- Biologia → Daniel Oliveira (id=4)
  ('D20',4),  -- Nutrição e Dietética

  -- História/Metodologia → Felipe Rodrigues (id=6)
  ('D12',6),

  -- Sociologia → João Carvalho (id=10)
  ('D13',10),

  -- Psicologia → Olivia Nunes (id=15)
  ('D14',15),

  -- Administração → Rafael Mendes (id=18)
  ('D15',18),

  -- Economia → Nicolas Araújo (id=14)
  ('D16',14),

  -- Direito → Quintino Pires (id=17)
  ('D17',17),

  -- Engenharia → Pedro Barros (id=16)
  ('D19',16)
;

-- 20) Material Didático (20)
INSERT INTO material_didatico (codigo_disciplina, titulo) VALUES
  ('D01','Livro Disciplina 1'),
  ('D02','Livro Disciplina 2'),
  ('D03','Livro Disciplina 3'),
  ('D04','Livro Disciplina 4'),
  ('D05','Livro Disciplina 5'),
  ('D06','Livro Disciplina 6'),
  ('D07','Livro Disciplina 7'),
  ('D08','Livro Disciplina 8'),
  ('D09','Livro Disciplina 9'),
  ('D10','Livro Disciplina 10'),
  ('D11','Livro Disciplina 11'),
  ('D12','Livro Disciplina 12'),
  ('D13','Livro Disciplina 13'),
  ('D14','Livro Disciplina 14'),
  ('D15','Livro Disciplina 15'),
  ('D16','Livro Disciplina 16'),
  ('D17','Livro Disciplina 17'),
  ('D18','Livro Disciplina 18'),
  ('D19','Livro Disciplina 19'),
  ('D20','Livro Disciplina 20')
;

-- 21) Matrículas (60)
INSERT INTO matricula (
  id,id_aluno,id_oferta,
  dia_efetivacao,mes_efetivacao,ano_efetivacao,
  status,status_pagamento,
  dia_limite_confirmacao,mes_limite_confirmacao,ano_limite_confirmacao
) VALUES
  ( 1,21, 1, 1,1,2024,'concluido','pago',   5,1,2024),
  ( 2,21, 2, 2,1,2024,'ativo','pago',       6,1,2024),
  ( 3,21, 3, 3,1,2024,'pendente','pendente', 7,1,2024),
  ( 4,22, 4, 4,2,2024,'concluido','pago',   8,2,2024),
  ( 5,22, 5, 5,2,2024,'ativo','pago',       9,2,2024),
  ( 6,22, 6, 6,2,2024,'pendente','pendente',10,2,2024),
  ( 7,23, 7, 7,3,2024,'concluido','pago',  11,3,2024),
  ( 8,23, 8, 8,3,2024,'ativo','pago',      12,3,2024),
  ( 9,23, 9, 9,3,2024,'pendente','pendente',13,3,2024),
  (10,24,10,10,4,2024,'concluido','pago',  14,4,2024),
  (11,24,11,11,4,2024,'ativo','pago',      15,4,2024),
  (12,24,12,12,4,2024,'pendente','pendente',16,4,2024),
  (13,25,13,13,5,2024,'concluido','pago',  17,5,2024),
  (14,25,14,14,5,2024,'ativo','pago',      18,5,2024),
  (15,25,15,15,5,2024,'pendente','pendente',19,5,2024),
  (16,26,16,16,6,2024,'concluido','pago',  20,6,2024),
  (17,26,17,17,6,2024,'ativo','pago',      21,6,2024),
  (18,26, 1, 1,1,2025,'pendente','pendente', 2,1,2025),
  (19,27, 2, 2,1,2025,'concluido','pago',   3,1,2025),
  (20,27, 3, 3,1,2025,'ativo','pago',       4,1,2025),
  (21,27, 4, 4,2,2025,'pendente','pendente', 5,2,2025),
  (22,28, 5, 5,2,2025,'concluido','pago',   6,2,2025),
  (23,28, 6, 6,2,2025,'ativo','pago',       7,2,2025),
  (24,28, 7, 7,3,2025,'pendente','pendente', 8,3,2025),
  (25,29, 8, 8,3,2025,'concluido','pago',   9,3,2025),
  (26,29, 9, 9,3,2025,'ativo','pago',      10,3,2025),
  (27,29,10,10,4,2025,'pendente','pendente',11,4,2025),
  (28,30,11,11,4,2025,'concluido','pago',  12,4,2025),
  (29,30,12,12,4,2025,'ativo','pago',      13,4,2025),
  (30,30,13,13,5,2025,'pendente','pendente',14,5,2025),
  (31,31,14,14,5,2025,'concluido','pago',  15,5,2025),
  (32,31,15,15,5,2025,'ativo','pago',      16,5,2025),
  (33,31,16,16,6,2025,'pendente','pendente',17,6,2025),
  (34,32,17,17,6,2025,'concluido','pago',  18,6,2025),
  (35,32,18,18,7,2025,'ativo','pago',      19,7,2025),
  (36,32,19,19,7,2025,'pendente','pendente',20,7,2025),
  (37,33,20,20,8,2025,'concluido','pago',  21,8,2025),
  (38,33,21,21,9,2025,'ativo','pago',      22,9,2025),
  (39,33,22,22,9,2025,'pendente','pendente',23,9,2025)
;

-- 22) Matrícula–Bolsa (20)
INSERT INTO matricula_bolsa (
  id_matricula, id_bolsa,
  dia_inicio, mes_inicio, ano_inicio,
  dia_prazo_validade, mes_prazo_validade, ano_prazo_validade
) VALUES
  (3,1, 1,1,2024,15,2,2024),
  (6,2, 2,2,2024,16,3,2024),
  (9,3, 3,3,2024,17,4,2024),
  (12,4, 4,4,2024,18,5,2024),
  (15,5, 5,5,2024,19,6,2024),
  (18,1, 6,6,2024,20,7,2024),
  (21,2, 7,7,2024,21,8,2024),
  (24,3, 8,8,2024,22,9,2024),
  (27,4, 9,9,2024,23,10,2024),
  (30,5,10,10,2024,24,11,2024),
  (33,1,11,11,2024,25,12,2024),
  (36,2,12,12,2024,26,1,2025),
  (39,3,13,1,2025,27,2,2025),
  (42,4,14,2,2025,28,3,2025),
  (45,5,15,3,2025,29,4,2025),
  (48,1,16,4,2025,30,5,2025),
  (51,2,17,5,2025,31,6,2025),
  (54,3,18,6,2025, 1,7,2025),
  (57,4,19,7,2025, 2,8,2025),
  (60,5,20,8,2025, 3,9,2025)
;

-- 23) Avaliação de Professor (40)
INSERT INTO avaliacao_professor (nome_disciplina,id_professor,id_aluno,didatica_nota) VALUES
  ('D01',1,21,7.0),('D01',1,22,8.5),
  ('D02',2,23,6.5),('D02',2,24,9.0),
  ('D03',3,25,5.5),('D03',3,26,7.5),
  ('D04',4,27,8.0),('D04',4,28,6.0),
  ('D05',5,29,9.5),('D05',5,30,7.0),
  ('D06',6,31,6.0),('D06',6,32,8.0),
  ('D07',7,33,7.5),('D07',7,34,9.0),
  ('D08',8,35,5.0),('D08',8,36,6.5),
  ('D09',9,37,8.5),('D09',9,38,7.0),
  ('D10',10,39,9.0),('D10',10,40,6.5),
  ('D11',11,21,7.5),('D11',11,22,8.0),
  ('D12',12,23,5.5),('D12',12,24,6.0),
  ('D13',13,25,9.5),('D13',13,26,8.5),
  ('D14',14,27,7.0),('D14',14,28,6.5),
  ('D15',15,29,8.0),('D15',15,30,9.0),
  ('D16',16,31,5.5),('D16',16,32,7.5),
  ('D17',17,33,6.0),('D17',17,34,8.5),
  ('D18',18,35,9.0),('D18',18,36,7.0),
  ('D19',19,37,6.5),('D19',19,38,8.0),
  ('D20',20,39,9.5),('D20',20,40,7.5)
;

-- 24) Avaliação de Disciplina (40)
INSERT INTO avaliacao_disciplina (
  id_aluno,codigo_disciplina,comentario_texto,
  material_apoio_nota,infraestrutura_sala_nota,relevancia_conteudo_nota
) VALUES
  (21,'D01','Ótimo material',7.0,8.0,9.0),
  (22,'D01','Bom suporte',6.5,7.5,8.5),
  (23,'D02','Adequado',5.0,6.0,7.0),
  (24,'D02','Poderia melhorar',6.0,5.5,6.5),
  (25,'D03','Excelente',9.0,9.5,9.0),
  (26,'D03','Muito bom',8.0,8.5,8.0),
  (27,'D04','Regular',6.5,6.0,6.0),
  (28,'D04','Bom',7.0,7.5,7.0),
  (29,'D05','Ótimo',8.5,8.0,9.0),
  (30,'D05','Excelente',9.5,9.0,9.5),
  (31,'D06','Razoável',5.5,5.0,6.0),
  (32,'D06','Poderia melhorar',6.0,5.5,6.5),
  (33,'D07','Ótimo conteúdo',8.0,8.5,8.5),
  (34,'D07','Interessante',7.5,7.0,7.0),
  (35,'D08','Bom material',7.0,7.5,7.5),
  (36,'D08','Agradável',8.0,8.0,8.0),
  (37,'D09','Excelente',9.0,9.5,9.5),
  (38,'D09','Ótimo',8.5,8.0,8.0),
  (39,'D10','Muito bom',8.0,7.5,8.5),
  (40,'D10','Bom',7.5,7.0,7.0)
;

-- 25) Avisos (20)
INSERT INTO aviso (
  id,texto_mensagem,dia_criacao,mes_criacao,ano_criacao,hora_criacao,id_funcionario_administrativo
) VALUES
  ( 1,'Manutenção no sistema',  1,1,2024,'09:00',41),
  ( 2,'Reunião de equipe',      2,1,2024,'10:00',42),
  ( 3,'Entrega de relatórios',   3,2,2024,'11:00',43),
  ( 4,'Feira de ciências',       4,2,2024,'12:00',44),
  ( 5,'Planejamento anual',      5,3,2024,'13:00',45),
  ( 6,'Visita técnica',          6,3,2024,'14:00',46),
  ( 7,'Concurso interno',        7,4,2024,'15:00',47),
  ( 8,'Atualização de currículo',8,4,2024,'16:00',48),
  ( 9,'Seminário externo',       9,5,2024,'09:30',49),
  (10,'Palestra motivacional',  10,5,2024,'10:30',50),
  (11,'Teste de software',      11,6,2024,'11:30',51),
  (12,'Recesso escolar',        12,6,2024,'12:30',52),
  (13,'Inscrição em evento',    13,7,2024,'13:30',53),
  (14,'Backup de dados',        14,7,2024,'14:30',54),
  (15,'Campanha de leitura',    15,8,2024,'15:30',55),
  (16,'Gincana escolar',        16,8,2024,'16:30',56),
  (17,'Dia do professor',       17,9,2024,'09:15',57),
  (18,'Formatura',              18,9,2024,'10:15',58),
  (19,'Reunião com pais',       19,10,2024,'11:15',59),
  (20,'Avaliação semestral',    20,10,2024,'12:15',60)
;

-- 26) Mensagens (40)
INSERT INTO mensagem (
  id,texto_mensagem,dia_criacao,mes_criacao,ano_criacao,hora_criacao,id_usuario
) VALUES
  ( 1,'Olá, tudo bem?',       1,1,2024,'08:00',21),
  ( 2,'Preciso de ajuda',      2,1,2024,'08:05',22),
  ( 3,'Quando é a prova?',     3,2,2024,'08:10',23),
  ( 4,'Enviei o trabalho',     4,2,2024,'08:15',24),
  ( 5,'Obrigado!',             5,3,2024,'08:20',25),
  ( 6,'Boa tarde',             6,3,2024,'08:25',26),
  ( 7,'Qual conteúdo?',        7,4,2024,'08:30',27),
  ( 8,'Bom dia',               8,4,2024,'08:35',28),
  ( 9,'Posso adiar?',          9,5,2024,'08:40',29),
  (10,'Até logo',             10,5,2024,'08:45',30),
  (11,'Pergunta rápida',      11,6,2024,'08:50',31),
  (12,'Mensagem de teste',    12,6,2024,'08:55',32),
  (13,'Aviso importante',     13,7,2024,'09:00',33),
  (14,'Confirmação',          14,7,2024,'09:05',34),
  (15,'Enviado',             15,8,2024,'09:10',35),
  (16,'Recebido',            16,8,2024,'09:15',36),
  (17,'Até mais',            17,9,2024,'09:20',37),
  (18,'Boa noite',           18,9,2024,'09:25',38),
  (19,'Preciso falar',       19,10,2024,'09:30',39),
  (20,'Tchau',               20,10,2024,'09:35',40),
  (21,'Teste 21',             1,11,2024,'10:00',41),
  (22,'Teste 22',             2,11,2024,'10:05',42),
  (23,'Teste 23',             3,12,2024,'10:10',43),
  (24,'Teste 24',             4,12,2024,'10:15',44),
  (25,'Teste 25',             5,1,2025,'10:20',45),
  (26,'Teste 26',             6,1,2025,'10:25',46),
  (27,'Teste 27',             7,2,2025,'10:30',47),
  (28,'Teste 28',             8,2,2025,'10:35',48),
  (29,'Teste 29',             9,3,2025,'10:40',49),
  (30,'Teste 30',            10,3,2025,'10:45',50),
  (31,'Teste 31',            11,4,2025,'10:50',51),
  (32,'Teste 32',            12,4,2025,'10:55',52),
  (33,'Teste 33',            13,5,2025,'11:00',53),
  (34,'Teste 34',            14,5,2025,'11:05',54),
  (35,'Teste 35',            15,6,2025,'11:10',55),
  (36,'Teste 36',            16,6,2025,'11:15',56),
  (37,'Teste 37',            17,7,2025,'11:20',57),
  (38,'Teste 38',            18,7,2025,'11:25',58),
  (39,'Teste 39',            19,8,2025,'11:30',59),
  (40,'Teste 40',            20,8,2025,'11:35',60)
;

-- 27) Destinatários (80) – 2 por mensagem
INSERT INTO destinatario (id_mensagem,id_destinatario) VALUES
  ( 1,22),( 1,23),( 2,23),( 2,24),( 3,24),( 3,25),( 4,25),( 4,26),
  ( 5,26),( 5,27),( 6,27),( 6,28),( 7,28),( 7,29),( 8,29),( 8,30),
  ( 9,30),( 9,21),(10,21),(10,22),(11,22),(11,23),(12,23),(12,24),
  (13,24),(13,25),(14,25),(14,26),(15,26),(15,27),(16,27),(16,28),
  (17,28),(17,29),(18,29),(18,30),(19,30),(19,21),(20,21),(20,22),
  (21,22),(21,23),(22,23),(22,24),(23,24),(23,25),(24,25),(24,26),
  (25,26),(25,27),(26,27),(26,28),(27,28),(27,29),(28,29),(28,30),
  (29,30),(29,21),(30,21),(30,22),(31,22),(31,23),(32,23),(32,24),
  (33,24),(33,25),(34,25),(34,26),(35,26),(35,27),(36,27),(36,28),
  (37,28),(37,29),(38,29),(38,30),(39,30),(39,21),(40,21),(40,22)
;

-- 28) Notas (60)
INSERT INTO nota (id_matricula,motivo,valor) VALUES
  (1,'Prova',7.0),(2,'Trabalho',8.5),(3,'Exercício',6.5),
  (4,'Prova',9.0),(5,'Trabalho',7.5),(6,'Exercício',5.5),
  (7,'Prova',8.0),(8,'Trabalho',6.0),(9,'Exercício',9.5),
  (10,'Prova',7.0),(11,'Trabalho',8.0),(12,'Exercício',6.0),
  (13,'Prova',9.5),(14,'Trabalho',7.0),(15,'Exercício',5.0),
  (16,'Prova',8.5),(17,'Trabalho',6.5),(18,'Exercício',9.0),
  (19,'Prova',7.5),(20,'Trabalho',8.0),(21,'Exercício',5.5),
  (22,'Prova',9.0),(23,'Trabalho',7.5),(24,'Exercício',6.5),
  (25,'Prova',8.0),(26,'Trabalho',6.0),(27,'Exercício',9.5),
  (28,'Prova',7.0),(29,'Trabalho',8.5),(30,'Exercício',6.5),
  (31,'Prova',9.0),(32,'Trabalho',7.5),(33,'Exercício',5.5),
  (34,'Prova',8.0),(35,'Trabalho',6.0),(36,'Exercício',9.5),
  (37,'Prova',7.5),(38,'Trabalho',8.0),(39,'Exercício',5.5),
  (40,'Prova',9.0),(41,'Trabalho',7.0),(42,'Exercício',6.0),
  (43,'Prova',8.5),(44,'Trabalho',6.5),(45,'Exercício',9.0),
  (46,'Prova',7.5),(47,'Trabalho',8.0),(48,'Exercício',5.0),
  (49,'Prova',9.5),(50,'Trabalho',7.5),(51,'Exercício',6.5),
  (52,'Prova',8.0),(53,'Trabalho',6.0),(54,'Exercício',9.0),
  (55,'Prova',7.0),(56,'Trabalho',8.5),(57,'Exercício',6.5),
  (58,'Prova',9.0),(59,'Trabalho',7.5),(60,'Exercício',5.5)
;

-- 29) Descontos (18)
INSERT INTO desconto (id_matricula, motivo, valor) VALUES
  ( 2, 'Bolsa de Mérito Acadêmico',      500.00),
  ( 5, 'Bolsa Social',                   300.00),
  ( 8, 'Desconto por Pontualidade',      150.00),
  (11, 'Desconto Ex-Aluno',              200.00),
  (14, 'Desconto por Indicação',         100.00),
  (17, 'Bolsa de Pesquisa',              400.00),
  (20, 'Desconto API',                   250.00),
  (23, 'Bolsa Esportiva',                350.00),
  (26, 'Desconto Profissional',          180.00),
  (29, 'Desconto Admissão',              220.00),
  (32, 'Bolsa Cultural',                 300.00),
  (35, 'Desconto por Residência',        160.00),
  (38, 'Bolsa de Estudo Integral',       600.00),
  (41, 'Desconto por Convenção',         140.00),
  (44, 'Desconto por Projeto',           175.00),
  (47, 'Bolsa Especial',                 450.00),
  (50, 'Desconto de Fim de Ano',         130.00),
  (53, 'Bolsa de Verão',                 320.00)
;

-- 30) Taxas (60)
INSERT INTO taxa (id_matricula, motivo, valor) VALUES
  ( 1, 'Taxa de Matrícula',           200.00),
  ( 2, 'Taxa de Material Didático',    50.00),
  ( 3, 'Taxa de Laboratório',         100.00),
  ( 4, 'Taxa de Biblioteca',           30.00),
  ( 5, 'Taxa de Certificação',         80.00),
  ( 6, 'Taxa de Matrícula',           200.00),
  ( 7, 'Taxa de Material Didático',    50.00),
  ( 8, 'Taxa de Laboratório',         100.00),
  ( 9, 'Taxa de Biblioteca',           30.00),
  (10, 'Taxa de Certificação',         80.00),
  (11, 'Taxa de Matrícula',           200.00),
  (12, 'Taxa de Material Didático',    50.00),
  (13, 'Taxa de Laboratório',         100.00),
  (14, 'Taxa de Biblioteca',           30.00),
  (15, 'Taxa de Certificação',         80.00),
  (16, 'Taxa de Matrícula',           200.00),
  (17, 'Taxa de Material Didático',    50.00),
  (18, 'Taxa de Laboratório',         100.00),
  (19, 'Taxa de Biblioteca',           30.00),
  (20, 'Taxa de Certificação',         80.00),
  (21, 'Taxa de Matrícula',           200.00),
  (22, 'Taxa de Material Didático',    50.00),
  (23, 'Taxa de Laboratório',         100.00),
  (24, 'Taxa de Biblioteca',           30.00),
  (25, 'Taxa de Certificação',         80.00),
  (26, 'Taxa de Matrícula',           200.00),
  (27, 'Taxa de Material Didático',    50.00),
  (28, 'Taxa de Laboratório',         100.00),
  (29, 'Taxa de Biblioteca',           30.00),
  (30, 'Taxa de Certificação',         80.00),
  (31, 'Taxa de Matrícula',           200.00),
  (32, 'Taxa de Material Didático',    50.00),
  (33, 'Taxa de Laboratório',         100.00),
  (34, 'Taxa de Biblioteca',           30.00),
  (35, 'Taxa de Certificação',         80.00),
  (36, 'Taxa de Matrícula',           200.00),
  (37, 'Taxa de Material Didático',    50.00),
  (38, 'Taxa de Laboratório',         100.00),
  (39, 'Taxa de Biblioteca',           30.00),
  (40, 'Taxa de Certificação',         80.00),
  (41, 'Taxa de Matrícula',           200.00),
  (42, 'Taxa de Material Didático',    50.00),
  (43, 'Taxa de Laboratório',         100.00),
  (44, 'Taxa de Biblioteca',           30.00),
  (45, 'Taxa de Certificação',         80.00),
  (46, 'Taxa de Matrícula',           200.00),
  (47, 'Taxa de Material Didático',    50.00),
  (48, 'Taxa de Laboratório',         100.00),
  (49, 'Taxa de Biblioteca',           30.00),
  (50, 'Taxa de Certificação',         80.00),
  (51, 'Taxa de Matrícula',           200.00),
  (52, 'Taxa de Material Didático',    50.00),
  (53, 'Taxa de Laboratório',         100.00),
  (54, 'Taxa de Biblioteca',           30.00),
  (55, 'Taxa de Certificação',         80.00),
  (56, 'Taxa de Matrícula',           200.00),
  (57, 'Taxa de Material Didático',    50.00),
  (58, 'Taxa de Laboratório',         100.00),
  (59, 'Taxa de Biblioteca',           30.00),
  (60, 'Taxa de Certificação',         80.00)
;
