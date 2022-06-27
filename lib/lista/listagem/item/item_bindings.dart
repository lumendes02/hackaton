import 'package:get/get.dart';
import 'package:hackaton/lista/listagem/item/item_controller.dart';
import 'package:hackaton/lista/listagem/item/repository/dados_item_repository.dart';
import 'package:hackaton/repository/i_item_repository.dart';

class ItemBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IItemRepository>(DadosItem());
    Get.put(ItemController(Get.find()));
  }
}
