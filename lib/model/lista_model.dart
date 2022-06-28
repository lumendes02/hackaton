// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ListaModel {
  int id;
  String tema_pesquisa;
  String conteudo;
  int cliente_id;
  String created_at;

  ListaModel({
    required this.id,
    required this.tema_pesquisa,
    required this.conteudo,
    required this.cliente_id,
    required this.created_at,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tema_pesquisa': tema_pesquisa,
      'conteudo': conteudo,
      'cliente_id': cliente_id,
      'created_at': created_at,
    };
  }

  factory ListaModel.fromMap(Map<String, dynamic> map) {
    return ListaModel(
      id: map['id'] as int,
      tema_pesquisa: map['tema_pesquisa'] as String,
      conteudo: map['conteudo'] as String,
      cliente_id: map['cliente_id'] as int,
      created_at: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListaModel.fromJson(String source) =>
      ListaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
