import 'package:get/route_manager.dart';
import 'package:hackaton/lista/listagem/item/item_page.dart';
import 'package:hackaton/lista/listagem/listagem_bindings.dart';
import 'package:hackaton/lista/listagem/listagem_page.dart';

class ListaAccessModule extends GetPage {
  ListaAccessModule()
      : super(
            name: '/lista',
            page: () => ListagemPage(),
            binding: ListagemBindings(),
            children: [
              GetPage(
                  name: '/item',
                  page: () => ItemPage(),
                  binding: ListagemBindings()),
            ]);
}
