import 'FornecedorModel.dart';

class ProdutoModel {
  int? idProduto;
  String? descricao;
  FornecedorModel? fornecedor;

  ProdutoModel({
    this.idProduto,
    this.descricao,
    this.fornecedor,
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      idProduto: json['idProduto'] as int,
      descricao: json['descricao'] as String,
      fornecedor: json['fornecedor'] != null
          ? FornecedorModel.fromJson(json['fornecedor'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idProduto'] = this.idProduto;
    data['descricao'] = this.descricao;
    if (this.fornecedor != null) {
      data['fornecedor'] = this.fornecedor;
    }

    return data;
  }
}
