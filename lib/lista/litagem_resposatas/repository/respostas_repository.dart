import 'dart:convert';

import 'package:hackaton/model/lista_model.dart';
import 'package:hackaton/model/resposta_model.dart';
import 'package:hackaton/repository/I_resposta_repository.dart';
import 'package:http/http.dart' as http;

class DadosRespostas implements IRespostaRepository {
  @override
  Future<List<respostaModel>> findAllRespostas() async {
    final response = await http.get(
        Uri.parse('https://62b670316999cce2e802b01e.mockapi.io/api/respostas'));
    final List<dynamic> responseMap = jsonDecode(response.body);
    print(response);
    return responseMap
        .map<respostaModel>((resp) => respostaModel.fromMap(resp))
        .toList();
  }
}
