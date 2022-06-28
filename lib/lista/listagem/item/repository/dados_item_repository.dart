import 'dart:convert';

import 'package:hackaton/model/lista_model.dart';
import 'package:hackaton/repository/i_item_repository.dart';
import 'package:http/http.dart' as http;

class DadosItem implements IItemRepository {
  @override
  Future<ListaModel> findItem(id) async {
    final response = await http.get(Uri.parse(
        'https://62b670316999cce2e802b01e.mockapi.io/api/lista/' + id));
    final ListaModel responseJ = jsonDecode(response.body);
    return responseJ;
  }
}
