import 'package:get/get.dart';
import 'package:hackaton/repository/I_resposta_repository.dart';
import 'package:hackaton/repository/i_comentario_repository.dart';

class ComentarioController extends GetxController with StateMixin {
  final IComentarioRepository _comentarioRepository;

  ComentarioController(this._comentarioRepository);

  @override
  void onInit() {
    super.onInit();
    findRespostas();
  }

  Future<void> findRespostas() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _comentarioRepository.findResposta();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('erro ao buscar lista'));
    }
  }
}
