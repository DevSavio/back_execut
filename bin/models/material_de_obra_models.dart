import 'package:json_annotation/json_annotation.dart';

import 'fornecedor_models.dart';
import 'origem_recurso_models.dart';
import 'tipo_de_obra_models.dart';

part 'material_de_obra_models.g.dart';

@JsonSerializable()
class MaterialDeObraModel {
  int? idMaterial;
  String nomeMaterial;
  String descricaoMaterial;
  double valor;
  TipoDeObraModel tipo;
  OrigemRecursoModel origem;
  FornecedorModel fornecedor;

  MaterialDeObraModel({
    this.idMaterial,
    required this.nomeMaterial,
    required this.descricaoMaterial,
    required this.valor,
    required this.tipo,
    required this.origem,
    required this.fornecedor,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idMaterial': idMaterial,
      'nomeMaterial': nomeMaterial,
      'descricaoMaterial': descricaoMaterial,
      'valor': valor,
      'tipo': tipo,
      'origem': origem,
      'fornecedor': fornecedor,
    };
  }

  Map<String, dynamic> toJson() => _$MaterialDeObraModelToJson(this);

  static MaterialDeObraModel fromJson(Map<String, dynamic> json) =>
      _$MaterialDeObraModelFromJson(json);
}
