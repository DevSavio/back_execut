import 'package:json_annotation/json_annotation.dart';

part 'material_de_obra_models.g.dart';

@JsonSerializable()
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

  Map<String, dynamic> toJson() => _$MaterialDeObraModelToJson(this);

  static MaterialDeObraModel fromJson(Map<String, dynamic> json) =>
      _$MaterialDeObraModelFromJson(json);
}
