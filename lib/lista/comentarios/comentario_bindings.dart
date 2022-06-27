import 'package:get/get.dart';
import 'package:hackaton/lista/comentarios/comentario_controller.dart';
import 'package:hackaton/lista/comentarios/repository/comentarios_repository.dart';
import 'package:hackaton/repository/i_comentario_repository.dart';

class ComentariosBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IComentarioRepository>(DadosResposta());
    Get.put(ComentarioController(Get.find()));
  }
}
