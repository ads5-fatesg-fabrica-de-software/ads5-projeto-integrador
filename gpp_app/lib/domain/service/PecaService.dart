import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpp_app/core/config/Conection.dart';
import 'package:gpp_app/domain/models/PecaModel.dart';
import 'package:http/http.dart';

class PecaService {

  bool carregando = false;

   List<PecaModel> pecas = [];

  Future<List<PecaModel>> lista() async {
    try {
      carregando = true;

      Response response = await get(
        Uri.parse(Conection.url + 'pecas/'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
         pecas = jsonList.map((e) => PecaModel.fromJson(e)).toList();
        return pecas;
      } else {
        throw Exception('Erro ao buscar peças');
      }
    } catch (e) {
      carregando = false;
      // Você deve retornar um valor aqui para satisfazer o tipo de retorno.
      return []; // Retorne uma lista vazia ou lide com o erro de forma diferente.
    }
  }
}

