import 'package:hackaton/model/lista_model.dart';

abstract class IListagemRepository {
  Future<List<ListaModel>> findAllLista();
}
