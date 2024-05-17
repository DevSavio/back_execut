import 'dart:convert';

class MaoDeObraModel {
  int idMao;
  String descricao;
  int idTipo;
  int idPrestador;
  int idFuncao;

  MaoDeObraModel({
    required this.idMao,
    required this.descricao,
    required this.idTipo,
    required this.idPrestador,
    required this.idFuncao,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idMao': idMao,
      'descricao': descricao,
      'idTipo': idTipo,
      'idPrestador': idPrestador,
      'idFuncao': idFuncao,
    };
  }

  // Método fromMap
  static MaoDeObraModel fromMap(Map<dynamic, dynamic> map) {
    return MaoDeObraModel(
      idMao: map['idMao'],
      descricao: map['descricao'],
      idTipo: map['idTipo'],
      idPrestador: map['idPrestador'],
      idFuncao: map['idFuncao'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static MaoDeObraModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'MaoDeObraModel(idMao: $idMao, descricao: $descricao, idTipo: $idTipo, idPrestador: $idPrestador, idFuncao: $idFuncao)';
  }
}
