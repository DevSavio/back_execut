import 'package:json_annotation/json_annotation.dart';

part 'tempo_de_obra_models.g.dart';

@JsonSerializable()
class TempoDeObraModel {
  int idTempo;
  String nomeTempo;

  TempoDeObraModel({
    required this.idTempo,
    required this.nomeTempo,
  });

  Map<String, dynamic> toJson() => _$TempoDeObraModelToJson(this);

  static TempoDeObraModel fromJson(Map<String, dynamic> json) =>
      _$TempoDeObraModelFromJson(json);

}
