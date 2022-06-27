import 'dart:convert';

import 'package:hackaton/model/lista_model.dart';
import 'package:hackaton/repository/i_listagem_repository.dart';
import 'package:http/http.dart' as http;

class DadosListagem implements IListagemRepository {
  @override
  Future<List<ListaModel>> findAllLista() async {
    final response = await http.get(
        Uri.parse('https://62b670316999cce2e802b01e.mockapi.io/api/lista'));
    final List<dynamic> responseMap = jsonDecode(response.body);
    print(response);
    return responseMap
        .map<ListaModel>((resp) => ListaModel.fromMap(resp))
        .toList();
  }
}
