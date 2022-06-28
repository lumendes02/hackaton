import 'package:get/get.dart';
import 'package:hackaton/repository/I_resposta_repository.dart';

class RespostaController extends GetxController with StateMixin {
  final IRespostaRepository _respostasRepository;

  RespostaController(this._respostasRepository);

  @override
  void onInit() {
    super.onInit();
    findRespostas();
  }

  Future<void> findRespostas() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _respostasRepository.findAllRespostas();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Voce nao tem respostas'));
    }
  }
}
