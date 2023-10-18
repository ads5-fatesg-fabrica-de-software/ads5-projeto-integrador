import 'package:auth_migration/base/model/abstract_entity.dart';
import 'package:auth_migration/domain/model/subfuncionalidades_model.dart';

class Funcionalidades extends AbstractEntity {
  int? idFuncionalidade;
  String? nome;
  String? icone;
  List<SubFuncionalidades>? subFuncionalidades;

  Funcionalidades(
      {this.idFuncionalidade, this.icone, this.nome, this.subFuncionalidades});

  factory Funcionalidades.fromMap(Map<String, dynamic> map) {
    return Funcionalidades(
      idFuncionalidade: map['idFuncionalidade'],
      nome: map['nome'],
      icone: map['icone'],
      subFuncionalidades: map['subfuncionalidades']
          ? map['subfuncionalidades'].map<SubFuncionalidades>((data) {
              return SubFuncionalidades.fromMap(data);
            }).toList()
          : null,
    );
  }
  
  Funcionalidades.fromJson(Map<String, dynamic> json) {
    idFuncionalidade = json['idFuncionalidade'];
    icone = json['icone'];
    nome = json['nome'];
    if (json['subfuncionalidades'] != null) {
      subFuncionalidades = <SubFuncionalidades>[];
      json['subfuncionalidades'].forEach((f){
        subFuncionalidades!.add(f);
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idFuncionalidade'] = idFuncionalidade;
    data['icone'] = icone;
    data['nome'] = nome;
    if (subFuncionalidades != null) {
      data['subFuncionalidades'] =
          subFuncionalidades!.map((e) => e.toJson()).toList();
    }
    return data;
  }

  @override
  toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
