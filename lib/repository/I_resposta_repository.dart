import 'package:hackaton/model/resposta_model.dart';

abstract class IRespostaRepository {
  Future<List<respostaModel>> findAllRespostas();
}
