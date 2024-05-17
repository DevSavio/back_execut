import 'dart:convert';

class TipoMaoDeObraModel {
  int idTipo;
  String nomeTipo;
  String descricao;

  TipoMaoDeObraModel({
    required this.idTipo,
    required this.nomeTipo,
    required this.descricao,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idTipo': idTipo,
      'nomeTipo': nomeTipo,
      'razaoSocial': descricao,
    };
  }

  // Método fromMap
  static TipoMaoDeObraModel fromMap(Map<dynamic, dynamic> map) {
    return TipoMaoDeObraModel(
      idTipo: map['idTipo'],
      nomeTipo: map['nomeTipo'],
      descricao: map['descricao'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static TipoMaoDeObraModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'TipoMaoDeObraModel(idTipo: $idTipo, nomeTipo: $nomeTipo, descricao: $descricao)';
  }
}
