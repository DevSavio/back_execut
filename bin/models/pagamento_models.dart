import 'package:json_annotation/json_annotation.dart';

part 'pagamento_models.g.dart';

@JsonSerializable()
class PagamentoModel {
  int? idPagamento;
  String tipoPagamento;
  String moeda;

  PagamentoModel({
    this.idPagamento,
    required this.tipoPagamento,
    required this.moeda,
  });

  Map<String, dynamic> toJson() => _$PagamentoModelToJson(this);

  static PagamentoModel fromJson(Map<String, dynamic> json) =>
      _$PagamentoModelFromJson(json);
}
