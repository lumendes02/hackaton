import 'package:hackaton/model/resposta_model.dart';

abstract class IComentarioRepository {
  Future<List<respostaModel>> findResposta(String id);
}
