import 'package:json_annotation/json_annotation.dart';

part 'tipo_mao_de_obra_models.g.dart';

@JsonSerializable()
class TipoMaoDeObraModel {
  int? idTipo;
  String nomeTipo;
  String descricao;

  TipoMaoDeObraModel({
    required this.idTipo,
    required this.nomeTipo,
    required this.descricao,
  });

  Map<String, dynamic> toJson() => _$TipoMaoDeObraModelToJson(this);

  static TipoMaoDeObraModel fromJson(Map<String, dynamic> json) =>
      _$TipoMaoDeObraModelFromJson(json);  
}
