import { PecasEstoqueModel } from "./PecasEstoqueModel";

export class ItemSolicitacaoAstecaModel {
  constructor(
    public idItemAsteca?: number,
    public quantidade?: number,
    public pecaEstoque?: PecasEstoqueModel
  ) {}

}
