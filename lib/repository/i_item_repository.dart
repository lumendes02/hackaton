import 'package:hackaton/model/lista_model.dart';

abstract class IItemRepository {
  Future<ListaModel> findItem(id);
}
