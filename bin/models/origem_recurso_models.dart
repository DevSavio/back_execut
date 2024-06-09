import 'package:json_annotation/json_annotation.dart';

part 'origem_recurso_models.g.dart';

@JsonSerializable()
class OrigemRecursoModel {
  int? idOrigem;
  String tipoOrigem;
  double valor;

  OrigemRecursoModel({
    this.idOrigem,
    required this.tipoOrigem,
    required this.valor,
  });

  Map<String, dynamic> toJson() => _$OrigemRecursoModelToJson(this);

  static OrigemRecursoModel fromJson(Map<String, dynamic> json) =>
      _$OrigemRecursoModelFromJson(json);
}
