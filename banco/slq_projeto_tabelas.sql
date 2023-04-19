
//peça
SELECT id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes
FROM public.peca;


INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES (1, true, 10, 'COD1', 'Blue', 20, 'Widget 1', 101, 5, 'Metal', 'Steel', 123, 2, 2, 10, 3)
ON CONFLICT (id_peca) DO NOTHING;

INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES (2, true, 15, 'COD2', 'Red', 25, 'Widget 2', 102, 6, 'Plastic', 'Polypropylene', 234, 3, 3, 15, 4)
ON CONFLICT (id_peca) DO NOTHING;

INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES (3, true, 8, 'COD3', 'Green', 15, 'Widget 3', 101, 3, 'Metal', 'Aluminum', 345, 1, 2, 5, 2)
ON CONFLICT (id_peca) DO NOTHING;

INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES (4, true, 12, 'COD4', 'Yellow', 30, 'Widget 4', 102, 4, 'Glass', 'Soda-lime', 456, 2, 4, 8, 3)
ON CONFLICT (id_peca) DO NOTHING;

INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES (5, true, 10, 'COD5', 'Purple', 40, 'Widget 5', 101, 5, 'Plastic', 'ABS', 567, 2, 2, 10, 3)
ON CONFLICT (id_peca) DO NOTHING;

INSERT INTO public.peca (id_peca, active, altura, codigo_fabrica, cor, custo, descricao, id_fornecedor, largura, material, material_fabricacao, numero, profundidade, unidade, unidade_medida, volumes)
VALUES (6, true, 14, 'COD6', 'Orange', 35, 'Widget 6', 102, 7, 'Metal', 'Copper', 678, 3, 3, 20, 4)
ON CONFLICT (id_peca) DO NOTHING;


//fornecedor
SELECT id_fornecedor, nome_fornecedor
FROM public.fornecedor;

INSERT INTO public.fornecedor (nome_fornecedor)
VALUES
    ('Acme Corporation'),
    ('Globex Corporation'),
    ('Stark Industries'),
    ('Wayne Enterprises'),
    ('Umbrella Corporation'),
    ('Weyland-Yutani Corporation'),
    ('Oscorp Industries'),
    ('Tyrell Corporation'),
    ('Aperture Science'),
    ('InGen Corporation');

//produto
SELECT id_produto, descricao, fornecedor_id_fornecedor
FROM public.produto;
  -- Exemplo 1
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Escrivaninha de madeira maciça com gavetas embutidas', 11);

-- Exemplo 2
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Guarda-roupa com três portas de correr e prateleiras internas', 12);

-- Exemplo 3
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Mesa de escritório com tampo de vidro temperado e estrutura metálica', 11);

-- Exemplo 4
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Cama box de casal com colchão de molas ensacadas', 12);

-- Exemplo 5
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Sofá retrátil de couro sintético com três lugares', 13);

-- Exemplo 6
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Geladeira frost-free de inox com dispenser de água', 14);

-- Exemplo 7
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Fogão a gás com quatro bocas e acendimento automático', 14);

-- Exemplo 8
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Televisão LED Full HD de 50 polegadas', 15);

-- Exemplo 9
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Notebook com processador Intel Core i5 e 8GB de RAM', 16);

-- Exemplo 10
INSERT INTO public.produto (descricao, fornecedor_id_fornecedor) 
VALUES ('Smartphone Android com câmera de alta resolução e tela de 6 polegadas', 17);

  
  
  

