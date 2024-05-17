import 'dart:convert';

class MaterialDeObraModel {
  int idMaterial;
  String nomeMaterial;
  String descricaoMaterial;
  double valor;
  int idTipo;
  int idOrigem;
  int idFornecedor;

  MaterialDeObraModel({
    required this.idMaterial,
    required this.nomeMaterial,
    required this.descricaoMaterial,
    required this.valor,
    required this.idTipo,
    required this.idOrigem,
    required this.idFornecedor,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idMaterial': idMaterial,
      'nomeMaterial': nomeMaterial,
      'descricaoMaterial': descricaoMaterial,
      'valor': valor,
      'idTipo': idTipo,
      'idOrigem': idOrigem,
      'idFornecedor': idFornecedor,
    };
  }

  // Método fromMap
  static MaterialDeObraModel fromMap(Map<dynamic, dynamic> map) {
    return MaterialDeObraModel(
      idMaterial: map['idMaterial'],
      nomeMaterial: map['nomeMaterial'],
      descricaoMaterial: map['descricaoMaterial'],
      valor: map['valor'],
      idTipo: map['idTipo'],
      idOrigem: map['idOrigem'],
      idFornecedor: map['idFornecedor'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static MaterialDeObraModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'MaterialDeObraModel(idMaterial: $idMaterial, nomeMaterial: $nomeMaterial, descricaoMaterial: $descricaoMaterial, valor: $valor, idTipo: $idTipo, idOrigem: $idOrigem, idFornecedor: $idFornecedor)';
  }
}
