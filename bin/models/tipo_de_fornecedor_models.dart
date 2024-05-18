import 'package:json_annotation/json_annotation.dart';

part 'tipo_de_fornecedor_models.g.dart';

@JsonSerializable()
class TipoDeFornecedorModel {
  int idTipo;
  String nomeTipo;
  String descricao;

  TipoDeFornecedorModel({
    required this.idTipo,
    required this.nomeTipo,
    required this.descricao,
  });

  Map<String, dynamic> toJson() => _$TipoDeFornecedorModelToJson(this);

  static TipoDeFornecedorModel fromJson(Map<String, dynamic> json) =>
      _$TipoDeFornecedorModelFromJson(json);
}
