class FornecedorModel {
  int? idFornecedor;
  String? nomeFornecedor;
  String? email;
  String? cnpj;

  FornecedorModel({
    this.idFornecedor,
    this.nomeFornecedor,
    this.email,
    this.cnpj,
  });

  factory FornecedorModel.fromJson(Map<String, dynamic> json) {
    return FornecedorModel(
      idFornecedor: json['idFornecedor'],
      nomeFornecedor: json['nomeFornecedor'],
      email: json['email'],
      cnpj: json['cnpj'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idFornecedor'] = this.idFornecedor;
    data['nomeFornecedor'] = this.nomeFornecedor;
    data['email'] = this.email;
    data['cnpj'] = this.cnpj;
    return data;
  }
}
