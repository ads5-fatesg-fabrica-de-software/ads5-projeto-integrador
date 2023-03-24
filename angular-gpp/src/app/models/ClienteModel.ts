export class ClienteModel {
  // [x: string]: any;
    
  constructor(
    public idCliente: number = 0,
    public nome: string = "",
    public cpfCnpj: string = "",
    public email: string = "",
    public endereco: string = ""
  ) {}
  
}
