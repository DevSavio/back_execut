import 'dart:convert';

class TipoDeFornecedorModel {
  int idTipo;
  String nomeTipo;
  String descricao;

  TipoDeFornecedorModel({
    required this.idTipo,
    required this.nomeTipo,
    required this.descricao,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idTipo': idTipo,
      'nomeTipo': nomeTipo,
      'descricao': descricao,
    };
  }

  // Método fromMap
  static TipoDeFornecedorModel fromMap(Map<dynamic, dynamic> map) {
    return TipoDeFornecedorModel(
      idTipo: map['idTipo'],
      nomeTipo: map['nomeTipo'],
      descricao: map['descricao'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static TipoDeFornecedorModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'TipoDeFornecedorModel(idTipo: $idTipo, nomeTipo: $nomeTipo, descricao: $descricao)';
  }
}
