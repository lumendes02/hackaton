import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class loginModel {
  String token;
  String nome;
  loginModel({
    required this.token,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'nome': nome,
    };
  }

  factory loginModel.fromMap(Map<String, dynamic> map) {
    return loginModel(
      token: map['token'] as String,
      nome: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory loginModel.fromJson(String source) =>
      loginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
