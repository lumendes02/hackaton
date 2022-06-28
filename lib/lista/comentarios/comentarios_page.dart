import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackaton/constants.dart';
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
                          height: 175,
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
                                      postData(TextController.text);
                                      Navigator.pop(context);
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
                    return item.resposta.substring(0, 200) + '...';
                  }
                  return item.resposta;
                })()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          deleteData(item.id);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          },
        );
      }, onError: (error) {
        return Center(child: Text(error ?? ''));
      }),
    );
  }

  postData(texto) async {
    try {
      Map<String, String> requestHeaders = {'Authorization': box.read('token')};
      String id = box.read('idpesquisa').toString();
      String nome = box.read('nome');
      var response = await http.post(
          Uri.parse(
              'https://pesquisa-satisfacao-api.herokuapp.com/api/clientes/pesquisas/' +
                  id +
                  '/respostas'),
          body: {"id_pesquisa": id, "resposta": texto, "nome": nome},
          headers: requestHeaders);
      TextController.text = '';
      controller.findRespostas(id);
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  deleteData(idint) async {
    try {
      Map<String, String> requestHeaders = {'Authorization': box.read('token')};
      String id = box.read('idpesquisa').toString();
      String idresposta = idint.toString();
      var response = await http.delete(
          Uri.parse(
              'https://pesquisa-satisfacao-api.herokuapp.com/api/respostas/' +
                  idresposta),
          headers: requestHeaders);
      controller.findRespostas(id);
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
