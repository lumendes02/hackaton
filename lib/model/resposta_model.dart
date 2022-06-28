import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class respostaModel {
  int id;
  String resposta;
  int pesquisa_id;
  String nome;

  respostaModel({
    required this.id,
    required this.resposta,
    required this.pesquisa_id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'resposta': resposta,
      'pesquisa_id': pesquisa_id,
      'nome': nome,
    };
  }

  factory respostaModel.fromMap(Map<String, dynamic> map) {
    return respostaModel(
      id: map['id'] as int,
      resposta: map['resposta'] as String,
      pesquisa_id: map['pesquisa_id'] as int,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory respostaModel.fromJson(String source) =>
      respostaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
