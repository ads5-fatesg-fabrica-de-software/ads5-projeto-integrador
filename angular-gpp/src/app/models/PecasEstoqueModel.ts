import { PecaModel } from "./PecaModel";

export class PecasEstoqueModel {
  idPecaEstoque: number;
  peca: PecaModel;
  saldoDisponivel: number;
  saldoReservado: number;
  fornecedor?: string;
  endereco?: string;
  quantidadeMinima?: number;
  quantidadeMaxima?: number;
  quantidadeIdeal?: number;

  constructor(
    idPecaEstoque: number,
    peca: PecaModel,
    saldoDisponivel: number,
    saldoReservado: number,
    fornecedor?: string,
    endereco?: string,
    quantidadeMinima?: number,
    quantidadeMaxima?: number,
    quantidadeIdeal?: number
  ) {
    this.idPecaEstoque = idPecaEstoque;
    this.peca = peca;
    this.saldoDisponivel = saldoDisponivel;
    this.saldoReservado = saldoReservado;
    this.fornecedor = fornecedor;
    this.endereco = endereco;
    this.quantidadeMinima = quantidadeMinima;
    this.quantidadeMaxima = quantidadeMaxima;
    this.quantidadeIdeal = quantidadeIdeal;
  }
}
