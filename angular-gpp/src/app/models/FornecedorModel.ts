import { ClienteModel } from "./ClienteModel";

export class FornecedorModel {
  constructor(
    public idFornecedor: number,
    public cliente: ClienteModel
  ) {}
}
