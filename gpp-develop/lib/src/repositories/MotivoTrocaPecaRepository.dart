import 'dart:convert';

import 'package:gpp/src/models/motivo_model.dart';
import 'package:gpp/src/shared/repositories/status_code.dart';
import 'package:gpp/src/shared/services/gpp_api.dart';
import 'package:http/http.dart';

class MotivoTrocaPecaRepository {
  late ApiService api;
  late String path;

  MotivoTrocaPecaRepository() {
    this.api = ApiService();
    this.path = '/pecas/motivos';
  }

  Future<List<MotivoModel>> buscarTodos() async {
    Response response = await api.get(path);

    if (response.statusCode == StatusCode.OK) {
      var data = jsonDecode(response.body);

      List<MotivoModel> reasonPartsReplacement = data.map<MotivoModel>((data) => MotivoModel.fromJson(data)).toList();

      return reasonPartsReplacement;
    } else {
      var error = json.decode(response.body)['error'];
      throw error;
    }
  }

  Future<bool> create(MotivoModel reasonPartsReplacement) async {
    Response response = await api.post(path, reasonPartsReplacement.toJson());

    if (response.statusCode == StatusCode.OK) {
      return true;
    } else {
      var error = json.decode(response.body)['error'];
      throw error;
    }
  }

  Future<bool> update(MotivoModel reasonPartsReplacement) async {
    Response response = await api.put(path + '/' + reasonPartsReplacement.idMotivo.toString(), reasonPartsReplacement.toJson());

    if (response.statusCode == StatusCode.OK) {
      return true;
    } else {
      var error = json.decode(response.body)['error'];
      throw error;
    }
  }

  Future<bool> excluir(MotivoModel reasonPartsReplacement) async {
    Response response = await api.delete(
      path + '/' + reasonPartsReplacement.idMotivo.toString(),
    );

    if (response.statusCode == StatusCode.OK) {
      return true;
    } else {
      var error = json.decode(response.body)['error'];
      throw error;
    }
  }
}
