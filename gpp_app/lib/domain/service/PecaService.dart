import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gpp_app/core/config/Conection.dart';
import 'package:gpp_app/domain/models/PecaModel.dart';
import 'package:gpp_app/domain/repository/PecaRepository.dart';
import 'package:gpp_app/shared/components/Notificacao.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../shared/components/MaskFormatter.dart';
import '../models/PaginaModel.dart';

class PecaService extends GetxController {

  NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
  late MaskFormatter maskFormatter = MaskFormatter();
  String pesquisar = '';
  var carregando = true.obs;
  late PecaRepository pecaRepository;
  late List<PecaModel> pecas;
  late PaginaModel pagina;

  PecaService(){
    pecaRepository = PecaRepository();
    pecas = <PecaModel>[].obs;
    pagina = PaginaModel(total: 0, atual: 1);
  }


  @override
  void onInit() {
    listaPecas();
    super.onInit();
  }

  listaPecas() async {
    try {
      carregando(true);
      pecas = await pecaRepository.listaPecas();
    } catch (e) {
     null;
    } finally {
      carregando(false);
      update();
    }
  }
}
