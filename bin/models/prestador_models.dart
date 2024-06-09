import 'package:json_annotation/json_annotation.dart';

part 'prestador_models.g.dart';

@JsonSerializable()
class PrestadorModel {
  int? idPrestador;
  String nomePrestador;
  String? tipoPrestador;
  String? cpfCnpj;
  String? telefone;
  int idFuncao;

  PrestadorModel({
    required this.idPrestador,
    required this.nomePrestador,
    this.tipoPrestador,
    this.cpfCnpj,
    this.telefone,
    required this.idFuncao,
  });

  Map<String, dynamic> toJson() => _$PrestadorModelToJson(this);

  static PrestadorModel fromJson(Map<String, dynamic> json) =>
      _$PrestadorModelFromJson(json);


}
