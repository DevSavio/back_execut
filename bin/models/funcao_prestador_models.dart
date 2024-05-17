import 'dart:convert';

class FuncaoPrestadorModel {
  int idFuncao;
  String nomeFuncao;
  String descricaoFuncao;

  FuncaoPrestadorModel({
    required this.idFuncao,
    required this.nomeFuncao,
    required this.descricaoFuncao,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idFuncao': idFuncao,
      'nomeFuncao': nomeFuncao,
      'descricaoFuncao': descricaoFuncao,
    };
  }

  // Método fromMap
  static FuncaoPrestadorModel fromMap(Map<dynamic, dynamic> map) {
    return FuncaoPrestadorModel(
      idFuncao: map['idFuncao'],
      nomeFuncao: map['nomeFuncao'],
      descricaoFuncao: map['descricaoFuncao'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static FuncaoPrestadorModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'FuncaoPrestadorModel(idFuncao: $idFuncao, nomeFuncao: $nomeFuncao, descricaoFuncao: $descricaoFuncao)';
  }
}
