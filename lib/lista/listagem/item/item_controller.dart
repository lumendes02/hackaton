import 'package:get/get.dart';
import 'package:hackaton/constants.dart';
import 'package:hackaton/repository/i_item_repository.dart';

class ItemController extends GetxController with StateMixin {
  final IItemRepository _itemRepository;

  ItemController(this._itemRepository);

  void onInit() {
    super.onInit();
    if (box.read('idpesquisa') != null) {
      String id = box.read('idpesquisa');
      findItemc(id);
    }
  }

  @override
  Future<void> findItemc(id) async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _itemRepository.findItem(id);
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('erro ao buscar lista'));
    }
  }
}
