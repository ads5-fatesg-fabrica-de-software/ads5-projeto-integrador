import 'ProdutoModel.dart';

class PecaModel {
  int? idPeca;
  String? numero;
  String? codigoFabrica;
  int? unidade;
  String? descricao;
  int? altura;
  int? largura;
  int? profundidade;
  int? unidadeMedida;
  String? volumes;
  bool? active;
  double? custo;
  String? cor;
  String? material;
  int? idFornecedor;
  String? materialFabricacao;
  ProdutoModel? produto;

  PecaModel({
    this.idPeca,
    this.numero,
    this.codigoFabrica,
    this.unidade,
    this.descricao,
    this.altura,
    this.largura,
    this.profundidade,
    this.unidadeMedida,
    this.volumes,
    this.active,
    this.custo,
    this.cor,
    this.material,
    this.idFornecedor,
    this.materialFabricacao,
    this.produto,
  });

  factory PecaModel.fromJson(Map<String, dynamic> json) {
    return PecaModel(
      idPeca: json['idPeca'] as int,
      numero: json['numero'] as String,
      codigoFabrica: json['codigoFabrica'] as String,
      unidade: json['unidade'] as int,
      descricao: json['descricao'] as String,
      altura: json['altura'] as int,
      largura: json['largura'] as int,
      profundidade: json['profundidade'] as int,
      unidadeMedida: json['unidadeMedida'] as int,
      volumes: json['volumes'] as String,
      active: json['active'] as bool,
      custo: json['custo'] as double,
      cor: json['cor'] as String,
      material: json['material'] as String,
      idFornecedor: json['idFornecedor'] as int,
      materialFabricacao: json['materialFabricacao'] as String,
      produto: json['produto'] != null
          ? ProdutoModel.fromJson(json['produto'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPeca'] = this.idPeca;
    data['numero'] = this.numero;
    data['codigoFabrica'] = this.codigoFabrica;
    data['unidade'] = this.unidade;
    data['descricao'] = this.descricao;
    data['altura'] = this.altura;
    data['largura'] = this.largura;
    data['profundidade'] = this.profundidade;
    data['unidadeMedida'] = this.unidadeMedida;
    data['volumes'] = this.volumes;
    data['active'] = this.active;
    data['custo'] = this.custo;
    data['cor'] = this.cor;
    data['material'] = this.material;
    data['idFornecedor'] = this.idFornecedor;
    data['materialFabricacao'] = this.materialFabricacao;
    if (this.produto != null) {
      data['produto'] = this.produto?.toJson();
    }
    return data;
  }
}
