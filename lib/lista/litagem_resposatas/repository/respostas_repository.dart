import 'dart:convert';

import 'package:hackaton/constants.dart';
import 'package:hackaton/model/lista_model.dart';
import 'package:hackaton/model/resposta_model.dart';
import 'package:hackaton/repository/I_resposta_repository.dart';
import 'package:http/http.dart' as http;

class DadosRespostas implements IRespostaRepository {
  @override
  Future<List<respostaModel>> findAllRespostas() async {
    Map<String, String> requestHeaders = {'Authorization': box.read('token')};
    String nome = box.read('nome');
    final response = await http.get(
        Uri.parse(
            'https://pesquisa-satisfacao-api.herokuapp.com/api/clientes/nome/' +
                nome +
                '/respostas'),
        headers: requestHeaders);
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap
        .map<respostaModel>((resp) => respostaModel.fromMap(resp))
        .toList();
  }
}
