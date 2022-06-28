import 'package:get/get.dart';
import 'package:hackaton/constants.dart';
import 'package:hackaton/repository/i_comentario_repository.dart';

class ComentarioController extends GetxController with StateMixin {
  final IComentarioRepository _comentarioRepository;

  ComentarioController(this._comentarioRepository);

  @override
  void onInit() {
    super.onInit();
    if (box.read('idpesquisa') != null) {
      String id = box.read('idpesquisa');
      findRespostas(id);
    }
  }

  Future<void> findRespostas(id) async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _comentarioRepository.findResposta(id);
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('erro ao buscar lista'));
    }
  }
}
