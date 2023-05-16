--fornecedor

TRUNCATE TABLE fornecedor CASCADE;

INSERT INTO fornecedor (id_fornecedor, nome_fornecedor)
VALUES
    (1, 'Acme Corporation'),
    (2, 'Globex Corporation'),
    (3, 'Stark Industries'),
    (4, 'Initech'),
    (5, 'Hooli'),
    (6, 'Vehement Capital Partners'),
    (7, 'Waystar Royco'),
    (8, 'Pied Piper'),
    (9, 'Prestige Worldwide'),
    (10, 'Weyland-Yutani Corporation'),
    (11, 'Cyberdyne Systems'),
    (12, 'Umbrella Corporation'),
    (13, 'Wonka Industries')
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
    (3, 'Mesa de escritório com tampo de vidro temperado e estrutura metálica', 3),
    (4, 'Cadeira de escritório com rodinhas e encosto reclinável', 1),
    (5, 'Estante de madeira com 6 prateleiras', 2),
    (6, 'Sofá de três lugares em couro sintético', 3),
    (7, 'Mesa de jantar com tampo de vidro e 6 cadeiras', 1),
    (8, 'Cama de casal com estrutura de metal', 2),
    (9, 'Armário de cozinha com 3 portas e 1 gaveta', 3),
    (10, 'Cômoda de madeira com 5 gavetas', 1),
    (11, 'Rack para TV até 55 polegadas', 2),
    (12, 'Mesa lateral redonda com tampo de vidro', 3),
    (13, 'Poltrona reclinável com apoio para os pés', 1),
    (14, 'Conjunto de mesa e cadeiras para varanda', 2)
    
ON CONFLICT (id_produto) DO NOTHING;

SELECT id_produto, descricao, fornecedor_id_fornecedor
FROM produto;

--****************************************************************************************************************************************************************************************************************************
--cliente


TRUNCATE TABLE cliente CASCADE;

INSERT INTO cliente (id_cliente, cpf_cnpj, email, nome)
VALUES 
    (1, '999.000.111-22', 'paula.almeida@outlook.com', 'Paula Almeida'),
    (2, '000.111.222-33', 'sergio.oliveira@gmail.com', 'Sergio Oliveira'),
    (3, '111.222.333-44', 'joao.silva@gmail.br', 'João Silva'),
    (5, '222.333.444-55', 'maria.santos@gmail.com', 'Maria Santos'),
    (6, '333.444.555-66', 'antonio.souza@outlook.com', 'Antonio Souza'),
    (7, '444.555.666-77', 'jose.pereira@gmail.com', 'José Pereira'),
    (8, '555.666.777-88', 'ana.fernandes@outlook.com', 'Ana Fernandes'),
    (9, '666.777.888-99', 'pedro.martins@gmail.com', 'Pedro Martins'),
    (10, '777.888.999-00', 'lucia.rodrigues@outlook.com', 'Lucia Rodrigues'),
    (11, '888.999.000-11', 'carlos.mendes@gmail.com', 'Carlos Mendes')
ON CONFLICT (id_cliente) DO NOTHING;

SELECT id_cliente, cpf_cnpj, email, nome
FROM cliente;

--****************************************************************************************************************************************************************************************************************************

--peça


TRUNCATE TABLE peca CASCADE;

INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES 
    (1, true, 5, 'COD1', 'Preto', 10, 'Parafuso para cama', 1, 0.5, 'Metal', 'Aço', 111, 0.5, 100, 5, 50),
    (2, true, 75, 'COD2', 'Marrom', 100, 'Perna de cadeira', 2, 5, 'Madeira', 'Carvalho', 222, 5, 1, 54, 4),
    (3, true, 20, 'COD3', 'Prata', 30, 'Dobradiça para armário', 3, 2, 'Metal', 'Aço Inoxidável', 333, 2, 50, 47, 10),
    (4, true, 10, 'COD4', 'Marrom', 30, 'Parafuso da mesa', 4, 1, 'Metal', 'Aço', 456, 1, 100, 58, 1),
    (5, true, 20, 'COD5', 'Preto', 40, 'Pé de cadeira', 2, 5, 'Madeira', 'Carvalho', 567, 5, 4, 65, 4),
    (6, true, 15, 'COD6', 'Branco', 35, 'Dobradiça de armário', 6, 2, 'Metal', 'Ferro', 678, 1, 50, 62, 2),
    (7, true, 8, 'COD7', 'Marrom Escuro', 25, 'Tampo de mesa', 7, 120, 'Madeira', 'Mogno', 789, 80, 2, 40, 1),
    (8, true, 30, 'COD8', 'Prata', 45, 'Suporte de prateleira', 8, 5, 'Metal', 'Alumínio', 890, 2, 100, 65, 4),
    (9, true, 50, 'COD9', 'Azul', 50, 'Estrutura de sofá', 9, 200, 'Madeira', 'Pinho', 901, 90, 2, 25, 1),
    (10, true, 5, 'COD10', 'Dourado', 15, 'Maçaneta de gaveta', 10, 2, 'Metal', 'Bronze', 123, 1, 30, 14, 2)
ON CONFLICT (id_peca) DO NOTHING;


SELECT id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes
FROM peca;

--****************************************************************************************************************************************************************************************************************************

TRUNCATE TABLE filial CASCADE;

INSERT INTO filial (id_filial, numero_filial, sigla)
VALUES
    (1, 1234, 'Filial Sao Paulo'),
    (2, 5678, 'Filial Rio de Janeiro'),
    (3, 91011, 'Filial Bahia'),
    (4, 1213, 'Filial Minas Gerais'),
    (5, 1415, 'Filial Paraná'),
    (6, 1617, 'Filial Santa Catarina'),
    (7, 1819, 'Filial Rio Grande do Sul'),
    (8, 2021, 'Filial Pernambuco'),
    (9, 2223, 'Filial Ceará'),
    (10, 2425, 'Filial Goiás')
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

TRUNCATE TABLE item_documento_fiscal CASCADE;

SELECT *
FROM item_documento_fiscal idf ;


--****************************************************************************************************************************************************************************************************************************

TRUNCATE TABLE documento_fiscal CASCADE;

SELECT *
FROM documento_fiscal df ;

--****************************************************************************************************************************************************************************************************************************

TRUNCATE TABLE pecas_estoque CASCADE;

INSERT INTO public.pecas_estoque (id_peca_estoque, endereco, fornecedor, quantidade_ideal, quantidade_maxima, quantidade_minima, saldo_disponivel, saldo_reservado, id_peca)
VALUES
    (1, 'Endereco 1', 'Fornecedor 1', 10, 20, 5, 15, 5, 1),
    (2, 'Endereco 2', 'Fornecedor 2', 12, 25, 8, 18, 6, 2),
    (3, 'Endereco 3', 'Fornecedor 3', 15, 30, 10, 20, 7, 3),
    (4, 'Endereco 4', 'Fornecedor 4', 8, 18, 3, 13, 3, 4),
    (5, 'Endereco 5', 'Fornecedor 5', 20, 40, 15, 25, 10, 5),
    (6, 'Endereco 6', 'Fornecedor 6', 10, 22, 6, 16, 4, 6),
    (7, 'Endereco 7', 'Fornecedor 7', 14, 28, 9, 19, 5, 7),
    (8, 'Endereco 8', 'Fornecedor 8', 18, 35, 12, 22, 8, 8),
    (9, 'Endereco 9', 'Fornecedor 9', 13, 26, 7, 17, 6, 9),
    (10, 'Endereco 10', 'Fornecedor 10', 16, 32, 11, 21, 9, 10)
ON CONFLICT (id_peca_estoque) DO NOTHING;

SELECT id_peca_estoque, endereco, fornecedor, quantidade_ideal, quantidade_maxima, quantidade_minima, saldo_disponivel, saldo_reservado, id_peca
FROM public.pecas_estoque;


--****************************************************************************************************************************************************************************************************************************

/*

SELECT *
FROM item_documento_fiscal idf ;

SELECT *
FROM item_documento_fiscal idf ;

SELECT *
FROM documento_fiscal df ;

SELECT *
FROM produto;

select
	*
from
	documento_fiscal df
inner join item_documento_fiscal idf on
	idf.id_item_doc_fiscal = df.id_documento_fiscal

	
select
	*
from
	documento_fiscal df
inner join item_documento_fiscal idf on
	idf.item_doc_id = df.id_documento_fiscal
	
	
SELECT * FROM documento_fiscal df INNER JOIN item_documento_fiscal idf ON idf.item_doc_id = df.id_documento_fiscal INNER JOIN produto p ON idf.id_produto = p.id_produto WHERE p.id_produto = :prod