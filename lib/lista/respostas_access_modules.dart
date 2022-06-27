import 'package:get/route_manager.dart';
import 'package:hackaton/lista/comentarios/comentario_bindings.dart';
import 'package:hackaton/lista/comentarios/comentarios_page.dart';
import 'package:hackaton/lista/litagem_resposatas/respostas.bindings.dart';
import 'package:hackaton/lista/litagem_resposatas/respostas_page.dart';

class respostasAccessModule extends GetPage {
  respostasAccessModule()
      : super(
            name: '/respostas',
            page: () => RespostasPage(),
            binding: RespostasBindings(),
            children: [
              GetPage(
                  name: '/item',
                  page: () => ComentarioPage(),
                  binding: ComentariosBindings()),
            ]);
}
