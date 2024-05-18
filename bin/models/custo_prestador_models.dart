import 'package:json_annotation/json_annotation.dart';

part 'custo_prestador_models.g.dart';

@JsonSerializable()
class CustoPrestadorModel {
  int idCusto;
  double valor;
  String razaoSocial;
  int idPrestador;
  int idFuncao;

  CustoPrestadorModel({
    required this.idCusto,
    required this.valor,
    required this.razaoSocial,
    required this.idPrestador,
    required this.idFuncao,
  });

  Map<String, dynamic> toJson() => _$CustoPrestadorModelToJson(this);

  static CustoPrestadorModel fromJson(Map<String, dynamic> json) =>
      _$CustoPrestadorModelFromJson(json);
}
