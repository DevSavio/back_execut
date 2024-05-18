import 'package:json_annotation/json_annotation.dart';

part 'prestador_obra_models.g.dart';

@JsonSerializable()
class PrestadorObraModel {
  int idPrestadorObra;
  int idPrestador;
  int idObra;

  PrestadorObraModel({
    required this.idPrestadorObra,
    required this.idPrestador,
    required this.idObra,
  });

  Map<String, dynamic> toJson() => _$PrestadorObraModelToJson(this);

  static PrestadorObraModel fromJson(Map<String, dynamic> json) =>
      _$PrestadorObraModelFromJson(json);
}
