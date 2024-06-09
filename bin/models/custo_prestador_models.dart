import 'package:json_annotation/json_annotation.dart';

import 'funcao_prestador_models.dart';
import 'prestador_models.dart';

part 'custo_prestador_models.g.dart';

@JsonSerializable()
class CustoPrestadorModel {
  int? idCusto;
  double valor;
  PrestadorModel prestador;
  FuncaoPrestadorModel funcao;

  CustoPrestadorModel({
    this.idCusto,
    required this.valor,
    required this.prestador,
    required this.funcao,
  });

  Map<String, dynamic> toJson() => _$CustoPrestadorModelToJson(this);

  static CustoPrestadorModel fromJson(Map<String, dynamic> json) =>
      _$CustoPrestadorModelFromJson(json);
}
