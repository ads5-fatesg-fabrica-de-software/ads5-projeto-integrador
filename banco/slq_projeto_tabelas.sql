
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

//********************************************************************************************


