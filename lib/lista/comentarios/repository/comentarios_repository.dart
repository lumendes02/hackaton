import 'dart:convert';
import 'package:hackaton/model/resposta_model.dart';
import 'package:hackaton/repository/i_comentario_repository.dart';
import 'package:http/http.dart' as http;

class DadosResposta implements IComentarioRepository {
  @override
  Future<respostaModel> findResposta() async {
    final response = await http.get(
        Uri.parse('https://62b670316999cce2e802b01e.mockapi.io/api/respostas'));
    final respostaModel responseJ = jsonDecode(response.body);
    print(response);
    return responseJ;
  }
}
