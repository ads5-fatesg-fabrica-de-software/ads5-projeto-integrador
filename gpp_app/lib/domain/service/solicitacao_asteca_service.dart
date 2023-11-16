import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SolicitacaoAstecaService extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final txtIdProduto;

  SolicitacaoAstecaService() {
    txtIdProduto = TextEditingController();
  }
  
  limparFiltro() {
    formKey.currentState!.reset();
  }

  Future<bool> buscarNotasFiscais(String idProduto) async {
    return true;
  }
}
