import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackaton/lista/litagem_resposatas/respostas_controller.dart';
import 'package:hackaton/model/resposta_model.dart';

class ComentarioPage extends GetView<RespostaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comentarios',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        automaticallyImplyLeading: true,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      // body: controller.obx((state) {
      //   return ListView.builder(
      //     itemCount: state.length,
      //     itemBuilder: (_, index) {
      //       final respostaModel item = state[index];
      //       return Card(
      //         child: ListTile(
      //           title: Text(item.nome),
      //           subtitle: Text((() {
      //             if (item.resposta.length > 200) {
      //               return _textSelect(item.resposta.substring(0, 200)) + '...';
      //             }
      //             return item.resposta;
      //           })()),
      //           // Get.toNamed('/lista'),
      //         ),
      //       );
      //     },
      //   );
      // }, onError: (error) {
      //   return Center(child: Text(error ?? ''));
      // }),
    );
  }

  String _textSelect(String str) {
    str = str.replaceAll('Ã©', 'é');
    return str;
  }
}
