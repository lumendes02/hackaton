import 'package:get/get.dart';
import 'package:hackaton/constants.dart';
import 'package:hackaton/repository/i_listagem_repository.dart';

class ListagemController extends GetxController with StateMixin {
  final IListagemRepository _listagemRepository;

  ListagemController(this._listagemRepository);

  @override
  void onInit() {
    super.onInit();
    findLista();
  }

  Future<void> findLista() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _listagemRepository.findAllLista();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Nao tem pesquisas atualmente'));
    }
  }
}
