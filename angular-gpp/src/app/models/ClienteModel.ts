export class ClienteModel {
  [x: string]: any;
  idCliente: number;
  nome: string;
  cpfCnpj: string;
  email: string;
  endereco: string;

  constructor(
    idCliente: number,
    nome: string,
    cpfCnpj: string,
    email: string,
    endereco: string
  ) {
    this.idCliente = idCliente;
    this.nome = nome;
    this.cpfCnpj = cpfCnpj;
    this.email = email;
    this.endereco = endereco;
  }
}
