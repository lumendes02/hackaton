import 'package:get/get.dart';
import 'package:hackaton/repository/i_item_repository.dart';

class ItemController extends GetxController with StateMixin {
  final IItemRepository _itemRepository;

  ItemController(this._itemRepository);

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
