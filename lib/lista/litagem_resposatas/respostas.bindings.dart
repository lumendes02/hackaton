import 'package:get/get.dart';
import 'package:hackaton/lista/litagem_resposatas/repository/respostas_repository.dart';
import 'package:hackaton/lista/litagem_resposatas/respostas_controller.dart';
import 'package:hackaton/repository/I_resposta_repository.dart';

class RespostasBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IRespostaRepository>(DadosRespostas());
    Get.put(RespostaController(Get.find()));
  }
}
