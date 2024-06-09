import 'package:json_annotation/json_annotation.dart';

import 'funcao_prestador_models.dart';

part 'prestador_models.g.dart';

@JsonSerializable()
class PrestadorModel {
  int? idPrestador;
  String nomePrestador;
  String? tipoPrestador;
  String? cpfCnpj;
  String? telefone;
  FuncaoPrestadorModel funcao;

  PrestadorModel({
    required this.idPrestador,
    required this.nomePrestador,
    this.tipoPrestador,
    this.cpfCnpj,
    this.telefone,
    required this.funcao,
  });

  Map<String, dynamic> toJson() => _$PrestadorModelToJson(this);

  static PrestadorModel fromJson(Map<String, dynamic> json) =>
      _$PrestadorModelFromJson(json);


}
