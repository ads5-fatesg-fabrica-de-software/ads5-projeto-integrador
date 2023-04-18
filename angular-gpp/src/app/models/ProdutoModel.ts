import { FornecedorModel } from "./FornecedorModel";

export class ProdutoModel {
  idProduto?: number;
  descricao?: string;
  fornecedores: FornecedorModel = new FornecedorModel;

}
