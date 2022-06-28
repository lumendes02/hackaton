import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackaton/lista/listagem/item/item_controller.dart';
import 'package:http/http.dart' as http;

class ItemPage extends GetView<ItemController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pesquisa',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              color: const Color.fromARGB(255, 203, 199, 199),
              child: Center(
                child: Text(Get.arguments.tema_pesquisa,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0))),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                width: 500,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Text(Get.arguments.conteudo),
              ),
            ),
            Container(
                height: 50,
                color: const Color.fromARGB(255, 203, 199, 199),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          primary: const Color.fromARGB(255, 0, 0, 0),
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Get.toNamed('/respostas/item');
                        },
                        child: const Text('Comentarios'),
                      ),
                    ))
                  ],
                ))
          ],
        ));
  }
}
