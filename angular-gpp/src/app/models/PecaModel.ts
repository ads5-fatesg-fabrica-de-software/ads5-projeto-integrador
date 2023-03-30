export class PecaModel {
  constructor(
    public idPeca: number = 0,
    public numero: string = "",
    public codigoFabrica: string = "",
    public unidade: number = 0,
    public descricao: string = "",
    public altura: number = 0,
    public largura: number = 0,
    public profundidade: number = 0,
    public unidadeMedida: number = 0,
    public volumes: string = "",
    public active: boolean = false,
    public custo: number = 0,
    public cor: string = "",
    public material: string = "",
    public idFornecedor: number = 0,
    public materialFabricacao: string = "",
    public produtosPeca: string = ""
  ) {}
}
