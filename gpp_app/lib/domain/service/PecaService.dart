import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gpp_app/core/config/Conection.dart';
import 'package:gpp_app/domain/models/PecaModel.dart';
import 'package:http/http.dart';

class PecaService {
  Future<void> lista() async {
    Response response = await post(
      Uri.parse(Conection.url + 'pecas'),
      headers: {'Content-Type': 'application/json'},
      body: PecaModel,
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Done!');
    } else {
      Fluttertoast.showToast(msg: jsonDecode(response.body)['message']);
    }
  }
}
