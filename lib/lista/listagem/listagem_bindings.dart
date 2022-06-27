import 'package:get/get.dart';
import 'package:hackaton/lista/listagem/listagem_controller.dart';
import 'package:hackaton/lista/listagem/repository/dados_listagem_repository.dart';
import 'package:hackaton/repository/i_listagem_repository.dart';

class ListagemBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IListagemRepository>(DadosListagem());
    Get.put(ListagemController(Get.find()));
  }
}
