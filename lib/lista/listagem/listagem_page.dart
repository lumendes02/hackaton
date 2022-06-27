import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackaton/constants.dart';
import 'package:hackaton/lista/listagem/listagem_controller.dart';
import 'package:hackaton/model/lista_model.dart';

class ListagemPage extends GetView<ListagemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Pesquisas',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed('/respostas');
                  },
                  child: const Icon(
                    Icons.comment,
                    size: 26.0,
                  ),
                )),
          ]),
      backgroundColor: const Color.fromARGB(255, 203, 199, 199),
      body: controller.obx((state) {
        print(box.read('teste'));
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final ListaModel item = state[index];
            return Card(
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 54,
                    maxHeight: 54,
                  ),
                  child: Image.asset('assets/images/bb.png', fit: BoxFit.cover),
                ),
                title: Text(item.tema_pesquisa),
                subtitle: Text((() {
                  if (item.texto.length > 60) {
                    return _textSelect(item.texto.substring(0, 60)) + '...';
                  }
                  return item.texto;
                })()),
                onTap: () {
                  Get.toNamed('/lista/item', arguments: item);
                },
                // Get.toNamed('/lista'),
              ),
            );
          },
        );
      }, onError: (error) {
        return Center(child: Text(error ?? ''));
      }),
    );
  }

  String _textSelect(String str) {
    str = str.replaceAll('Ã©', 'é');
    return str;
  }
}
