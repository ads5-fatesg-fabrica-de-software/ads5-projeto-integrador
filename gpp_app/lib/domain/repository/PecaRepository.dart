import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpp_app/core/config/Conection.dart';
import 'package:gpp_app/domain/models/PecaModel.dart';
import 'package:http/http.dart';

class PecaRepository {
  late Conection api;

  PecaRepository() {
    api = Conection();
  }

  Future<List<PecaModel>> listaPecas() async {
    Response response = await get(Uri.parse(api.url + 'pecas/'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      var pecas = jsonList.map((e) => PecaModel.fromJson(e)).toList();
      return pecas;
    } else {
      var error = jsonDecode(response.body)['error'];
      throw error;
    } 
  }
}
