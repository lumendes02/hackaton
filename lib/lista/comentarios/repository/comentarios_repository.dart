import 'dart:convert';
import 'package:hackaton/constants.dart';
import 'package:hackaton/model/resposta_model.dart';
import 'package:hackaton/repository/i_comentario_repository.dart';
import 'package:http/http.dart' as http;

class DadosResposta implements IComentarioRepository {
  @override
  Map<String, String> requestHeaders = {'Authorization': box.read('token')};
  Future<List<respostaModel>> findResposta(id) async {
    final response = await http.get(
        Uri.parse(
            'https://pesquisa-satisfacao-api.herokuapp.com/api/pesquisas/' +
                id +
                '/respostas'),
        headers: requestHeaders);
    final List<dynamic> responseMap = jsonDecode(response.body);

    return responseMap
        .map<respostaModel>((resp) => respostaModel.fromMap(resp))
        .toList();
  }
}
