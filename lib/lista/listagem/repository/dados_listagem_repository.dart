import 'dart:convert';

import 'package:hackaton/constants.dart';
import 'package:hackaton/model/lista_model.dart';
import 'package:hackaton/repository/i_listagem_repository.dart';
import 'package:http/http.dart' as http;

class DadosListagem implements IListagemRepository {
  @override
  Future<List<ListaModel>> findAllLista() async {
    Map<String, String> requestHeaders = {'Authorization': box.read('token')};
    final response = await http.get(
        Uri.parse(
            'https://pesquisa-satisfacao-api.herokuapp.com/api/pesquisas'),
        headers: requestHeaders);
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap
        .map<ListaModel>((resp) => ListaModel.fromMap(resp))
        .toList();
  }
}
