import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackaton/lista/comentarios/comentario_controller.dart';
import 'package:hackaton/model/resposta_model.dart';
import 'package:http/http.dart' as http;

class ComentarioPage extends GetView<ComentarioController> {
  @override
  final TextController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Comentarios',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          automaticallyImplyLeading: true,
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 115,
                          color: Color.fromARGB(255, 255, 255, 255),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 10.0, left: 10.0),
                                  child: TextField(
                                    controller: TextController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Comentario',
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10.0),
                                  child: ElevatedButton(
                                    child: const Text('Enviar'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      postData(TextController.text);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(
                    Icons.add_comment,
                    size: 26.0,
                  ),
                )),
          ]),
      backgroundColor: const Color.fromARGB(255, 203, 199, 199),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final respostaModel item = state[index];
            return Card(
              child: ListTile(
                title: Text(
                  item.nome,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text((() {
                  if (item.resposta.length > 200) {
                    return _textSelect(item.resposta.substring(0, 200)) + '...';
                  }
                  return item.resposta;
                })()),
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

  postData(texto) async {
    try {
      var response = http.post(
          Uri.parse(
              'https://62b670316999cce2e802b01e.mockapi.io/api/respostas'),
          body: {"id_pesquisa": 1, "resposta": texto, "nome": "lucas"});
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
