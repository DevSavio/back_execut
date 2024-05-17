import 'dart:convert';

class TipoDeObraModel {
  int idTipo;
  String nomeTipo;
  String descricaoTipo;

  TipoDeObraModel({
    required this.idTipo,
    required this.nomeTipo,
    required this.descricaoTipo,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idTipo': idTipo,
      'nomeTipo': nomeTipo,
      'descricaoTipo': descricaoTipo,
    };
  }

  // Método fromMap
  static TipoDeObraModel fromMap(Map<dynamic, dynamic> map) {
    return TipoDeObraModel(
      idTipo: map['idTipo'],
      nomeTipo: map['nomeTipo'],
      descricaoTipo: map['descricaoTipo'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static TipoDeObraModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'TipoDeObraModel(idTipo: $idTipo, nomeTipo: $nomeTipo, descricaoTipo: $descricaoTipo)';
  }
}
