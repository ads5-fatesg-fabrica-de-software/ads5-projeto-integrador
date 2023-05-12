--fornecedor

TRUNCATE TABLE fornecedor CASCADE;

INSERT INTO fornecedor (id_fornecedor, nome_fornecedor)
VALUES
    (1, 'Acme Corporation'),
    (2, 'Globex Corporation'),
    (3, 'Stark Industries')
ON CONFLICT (id_fornecedor) DO NOTHING;


SELECT id_fornecedor, nome_fornecedor
FROM public.fornecedor;

--****************************************************************************************************************************************************************************************************************************
--produto


TRUNCATE TABLE produto CASCADE;

INSERT INTO produto (id_produto, descricao, fornecedor_id_fornecedor) 
VALUES 
    (1, 'Escrivaninha de madeira maciça com gavetas embutidas', 1),
    (2, 'Guarda-roupa com três portas de correr e prateleiras internas', 2),
    (3, 'Mesa de escritório com tampo de vidro temperado e estrutura metálica', 3)
ON CONFLICT (id_produto) DO NOTHING;

SELECT id_produto, descricao, fornecedor_id_fornecedor
FROM produto;

--****************************************************************************************************************************************************************************************************************************
--cliente


TRUNCATE TABLE cliente CASCADE;

INSERT INTO cliente (id_cliente, cpf_cnpj, email, nome)
VALUES 
    (1, '123.456.789-00', 'john@example.com', 'John Doe'),
    (2, '987.654.321-00', 'jane@example.com', 'Jane Smith'),
    (3, '555.555.555-55', 'bob@example.com', 'Bob Johnson')
ON CONFLICT (id_cliente) DO NOTHING;

SELECT id_cliente, cpf_cnpj, email, nome
FROM cliente;

--****************************************************************************************************************************************************************************************************************************

--peça


TRUNCATE TABLE peca CASCADE;

INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES (1, true, 10, 'COD1', 'Blue', 20, 'Widget 1', 11, 5, 'Metal', 'Steel', 123, 2, 2, 10, 3)
ON CONFLICT (id_peca) DO NOTHING;

INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES (2, true, 15, 'COD2', 'Red', 25, 'Widget 2', 12, 6, 'Plastic', 'Polypropylene', 234, 3, 3, 15, 4)
ON CONFLICT (id_peca) DO NOTHING;

INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES (3, true, 8, 'COD3', 'Green', 15, 'Widget 3', 11, 3, 'Metal', 'Aluminum', 345, 1, 2, 5, 2)
ON CONFLICT (id_peca) DO NOTHING;

SELECT id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes
FROM peca;

--****************************************************************************************************************************************************************************************************************************

TRUNCATE TABLE filial CASCADE;

INSERT INTO filial (id_filial, numero_filial, sigla)
VALUES
    (1, 1234, 'Filial Sao Paulo'),
    (2, 5678, 'Filial Rio de Janeiro'),
    (3, 91011, 'Filial Bahia')
ON CONFLICT DO NOTHING;

SELECT id_filial, numero_filial, sigla
FROM public.filial;
  
--****************************************************************************************************************************************************************************************************************************

TRUNCATE TABLE asteca_motivo CASCADE;

INSERT INTO public.asteca_motivo (id_asteca_motivo, denominacao, data_criacao, data_alteracao)
SELECT
  ROW_NUMBER() OVER () + 0 AS id_asteca_motivo,
  t.denominacao,
  CASE
    WHEN c.data_alteracao IS NULL THEN NOW() - (random() * INTERVAL '365 days')
    ELSE NOW() - (random() * (NOW() - c.data_alteracao))
  END AS data_criacao,
  NOW() - (random() * INTERVAL '365 days') AS data_alteracao
FROM (
  VALUES
    ('MERC. DANIFICADA EM USO'),
    ('MAU USO CONSUMIDOR'),
    ('AVARIA NA MONTAGEM'),
    ('MERCADORIA NÃO FUNCIONA'),
    ('MERCADORIA S/CONDIÇOES DE VENDA'),
    ('CARAC. NÃO ESPECIFICADA PELO VENDEDOR'),
    ('MERC. DANIFICADA POR DEFICIÊNCIA DA EMB. / FALTA ACESSORIOS'),
    ('DEFEITO DE FABRICAÇÃO'),
    ('MERC.  NÃO FUNCIONA CD/DVD'),
    ('DEFEITO NO AUDIO'),
    ('FALTA ACESSORIO/PEÇA NA EMBALAGEM'),
    ('PRODUTO CONSERTADO'),
    ('LOGISTICA'),
    ('MOTIVO CRIADO PELO SISMA'),
    ('PEÇA AVARIADA'),
    ('PRODUTO MOSTRUARIO'),
    ('PEÇA EM SEPARAÇAO'),
    ('MAU USO CONSUMIDOR'),
    ('MONTAGEM E DESMONTAGEM PRODUTOS/ESTOFADOS/PROD.SEM AVARIA'),
    ('VISTORIA'),
    ('PEÇAS PARA PRODUTO MOSTRUARIO'),
    ('PRODUTO DESMONTADO LOJA'),
    ('DESCOSTURADO'),
    ('PASSAR ESTOFADO PRA DENTRO RESIDENCIA'),
    ('PORTA COM VIDRO QUEBRADO'),
    ('TROCA VOLUME'),
    ('PRODUTO DESMONTADO'),
    ('PRODUTO ENTREGUE NA COR ERRADA'),
    ('ENTREGUE FALTANDO VOLUME'),
    ('PRODUTO MONTADO LOJA'),
    ('REPARO'),
    ('PRODUTO SEM DEFEITO')
) AS t(denominacao)
LEFT JOIN public.asteca_motivo c ON c.denominacao = t.denominacao
ON CONFLICT DO NOTHING;


SELECT id_asteca_motivo, data_alteracao, data_criacao, denominacao
FROM public.asteca_motivo;
  
--****************************************************************************************************************************************************************************************************************************

SELECT *
FROM documento_fiscal df ;

SELECT *
FROM item_documento_fiscal idf ;
