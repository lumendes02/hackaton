import 'package:hackaton/model/lista_model.dart';
import 'package:hackaton/model/resposta_model.dart';

abstract class IComentarioRepository {
  Future<respostaModel> findResposta();
}
