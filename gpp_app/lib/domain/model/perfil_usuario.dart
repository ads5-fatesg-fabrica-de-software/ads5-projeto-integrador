import 'package:auth_migration/base/model/abstract_entity.dart';
import 'package:auth_migration/domain/model/perfil_usuario_funcionalidades.dart';

class PerfilUsuario extends AbstractEntity {
  int? idPerfilUsuario;
  String? descricao;
  List<PerfilUsuarioFuncionalidades>? perfilUsuarioFuncionalidades;

  PerfilUsuario(
      {this.idPerfilUsuario,
      this.descricao,
      this.perfilUsuarioFuncionalidades});

  factory PerfilUsuario.fromMap(Map<String, dynamic> map) {
    return PerfilUsuario(
      idPerfilUsuario: map['idPerfilUsuario'],
      descricao: map['descricao'],
      perfilUsuarioFuncionalidades: map['perfilUsuarioFuncionalidades']
          ? map['perfilUsuarioFuncionalidades']
              .map<PerfilUsuarioFuncionalidades>((data) {
              return PerfilUsuarioFuncionalidades.fromMap(data);
            }).toList()
          : null,
    );
  }

  PerfilUsuario.fromJson(Map<String, dynamic> json) {
    idPerfilUsuario = json['idPerfilUsuario'];
    descricao = json['descricao'];
    perfilUsuarioFuncionalidades = json['perfilUsuarioFuncionalidades']
        ? json['perfilUsuarioFuncionalidades']
            .map<PerfilUsuarioFuncionalidades>((data) {
            return PerfilUsuarioFuncionalidades.fromJson(data);
          }).toList()
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idPerfilUsuario'] = idPerfilUsuario;
    data['descricao'] = descricao;
    if (perfilUsuarioFuncionalidades != null) {
      data['perfilUsuarioFuncionalidades'] = perfilUsuarioFuncionalidades!.map((e) => e.toJson()).toList();
    }
    return data;
  }

  @override
  toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
