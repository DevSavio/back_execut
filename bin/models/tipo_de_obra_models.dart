import 'package:json_annotation/json_annotation.dart';

part 'tipo_de_obra_models.g.dart';

@JsonSerializable()
class TipoDeObraModel {
  int idTipo;
  String nomeTipo;
  String descricaoTipo;

  TipoDeObraModel({
    required this.idTipo,
    required this.nomeTipo,
    required this.descricaoTipo,
  });

  Map<String, dynamic> toJson() => _$TipoDeObraModelToJson(this);

  static TipoDeObraModel fromJson(Map<String, dynamic> json) =>
      _$TipoDeObraModelFromJson(json);
}
