// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListaModel {
  String id;
  int id_cliente;
  String tema_pesquisa;
  String horario;
  int status;
  String texto;

  ListaModel({
    required this.id,
    required this.id_cliente,
    required this.tema_pesquisa,
    required this.horario,
    required this.status,
    required this.texto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'id_cliente': id_cliente,
      'tema_pesquisa': tema_pesquisa,
      'horario': horario,
      'status': status,
      'texto': texto,
    };
  }

  factory ListaModel.fromMap(Map<String, dynamic> map) {
    return ListaModel(
      id: map['id'] as String,
      id_cliente: map['id_cliente'] as int,
      tema_pesquisa: map['tema_pesquisa'] as String,
      horario: map['horario'] as String,
      status: map['status'] as int,
      texto: map['texto'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListaModel.fromJson(String source) =>
      ListaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
