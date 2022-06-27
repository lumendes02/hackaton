import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackaton/lista/listagem/listagem_controller.dart';
import 'package:hackaton/model/lista_model.dart';
import 'package:http/http.dart' as http;

class ItemPage extends GetView {
  postComentario(idpesquisa, comentario) async {
    try {
      var response = await http.post(
          Uri.parse(
              'https://62b670316999cce2e802b01e.mockapi.io/api/respostas'),
          body: {"id_pesquisa": idpesquisa, "resposta": comentario});
      print(response);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          automaticallyImplyLeading: true,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              color: Color.fromARGB(255, 61, 61, 61),
              child: Center(
                child: Text(Get.arguments.tema_pesquisa,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255))),
              ),
            ),
            Expanded(
              child: Container(
                width: 500,
                color: Color.fromARGB(255, 211, 211, 211),
                child: Text(Get.arguments.texto),
              ),
            ),
            Container(
                width: 500,
                color: Color.fromARGB(255, 61, 61, 61),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          primary: Color.fromARGB(255, 255, 255, 255),
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
