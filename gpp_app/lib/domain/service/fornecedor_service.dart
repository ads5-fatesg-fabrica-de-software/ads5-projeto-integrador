import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/auth/usuario_service.dart';
import '../../shared/components/MaskFormatter.dart';
import '../model/pagina_model.dart';
import '../model/fornecedor_model.dart';
import '../model/usuario_model.dart';
import '../repository/fornecedor_repository.dart';

class FornecedorService extends GetxController {

  NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
  late MaskFormatter maskFormatter = MaskFormatter();
  String pesquisar = '';
  var carregando = true.obs;
  late FornecedorRepository fornecedorRepository;
  late List<Fornecedor> fornecedores;
  late Pagina pagina;



  FornecedorService(){
    fornecedorRepository = FornecedorRepository();
    fornecedores = <Fornecedor>[].obs;
    pagina = Pagina(total: 0, atual: 1);
  }

  @override
  void onInit() {
    listaFornecedors();
    super.onInit();
  }

  listaFornecedors() async {
    try {
      carregando(true);
      fornecedores = await fornecedorRepository.listaFornecedores();
    } catch (e) {
     null;
    } finally {
      carregando(false);
      update();
    }
  }
}
