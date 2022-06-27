import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class respostaModel {
  int id_pesquisa;
  String resposta;
  String id;
  String nome;
  respostaModel({
    required this.id_pesquisa,
    required this.resposta,
    required this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_pesquisa': id_pesquisa,
      'resposta': resposta,
      'id': id,
      'nome': nome,
    };
  }

  factory respostaModel.fromMap(Map<String, dynamic> map) {
    return respostaModel(
      id_pesquisa: map['id_pesquisa'] as int,
      resposta: map['resposta'] as String,
      id: map['id'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory respostaModel.fromJson(String source) =>
      respostaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
