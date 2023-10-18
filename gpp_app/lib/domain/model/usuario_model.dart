import 'package:auth_migration/domain/model/fornecedor_model.dart';
import 'package:auth_migration/domain/model/perfil_usuario.dart';

class Usuario {
  int? id;
  String? name;
  String? password;
  int? ativo;
  PerfilUsuario? perfilUsuario;
  String? username;

  Usuario({this.id, this.name, this.password, this.ativo, this.perfilUsuario,this.username});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['password'] = password;
    data['ativo'] = ativo;
    data['perfilUsuario'] =
        perfilUsuario != null ? perfilUsuario!.toJson() : null;
    data['username'] = username;
    return data;
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
        id: map['id'],
        name: map['name'],
        password: map['password'],
        ativo: map['ativo'],
        perfilUsuario: map['perfilUsuario'] != null
            ? PerfilUsuario.fromMap(map['perfilUsuario'])
            : null,
        username: map['username'],);
  }

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    ativo = json['ativo'];
    perfilUsuario = json['perfilUsuario'] != null
        ? PerfilUsuario.fromJson(json['perfilUsuario'])
        : null;
    username = json['username'];
  }
}
