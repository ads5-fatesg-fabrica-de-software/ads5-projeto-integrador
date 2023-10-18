import 'package:auth_migration/domain/model/fornecedor_model.dart';
import 'package:auth_migration/domain/model/perfil_usuario.dart';

class Usuario {
  int? id;
  String? name;
  String? password;
  int? ativo;
  PerfilUsuario? perfilUsuario;

  Usuario({this.id,this.name,this.password,this.ativo,this.perfilUsuario});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['password'] = password;
    data['ativo'] =  ativo;
    data['perfilUsuario'] =  perfilUsuario != null ? perfilUsuario!.toJson() : null;
    return data;
  }

  factory Usuario.fromMap(Map<String,dynamic> map){
    return Usuario(
      id: map['id'],
      name: map['name'],
      password: map['password'],
      ativo: map['ativo'],
      perfilUsuario: map['perfilUsuario'] != null ? PerfilUsuario.fromMap(map['perfilUsuario']) : null,
    );
  }
}
