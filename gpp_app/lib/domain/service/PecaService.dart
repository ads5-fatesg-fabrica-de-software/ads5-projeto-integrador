import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpp_app/core/config/Conection.dart';
import 'package:gpp_app/domain/models/PecaModel.dart';
import 'package:http/http.dart';

class PecaService {
  List<PecaModel> pecas = [];
  bool carregando = false;

  lista() async {
    try {
      carregando = true;
      Response response = await get(
        Uri.parse(Conection.url + 'pecas/'),
        headers: {'Content-Type': 'application/json'},
      );
      var data = jsonDecode(response.body);
      print(data);
      pecas = data['pecas']
          .map<PecaModel>((data) => PecaModel.fromJson(data))
          .toList();
      if (response.statusCode == 200) {
        return pecas;
      } else {
        Fluttertoast.showToast(msg: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      carregando = false;
    }
  }
}
