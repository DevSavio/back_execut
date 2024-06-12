import 'package:json_annotation/json_annotation.dart';

import 'cliente_models.dart';
import 'endereco_models.dart';
import 'pagamento_models.dart';
import 'prestador_models.dart';

part 'obra_models.g.dart';

@JsonSerializable()
class ObraModel {
  int? idObra;
  double valorFinal;
  String responsavelObra;
  DateTime dataInicio;
  DateTime dataFim;
  ClienteModel cliente;
  PagamentoModel pagamento;
  PrestadorModel prestador;
  EnderecoModel endereco;

  ObraModel({
    this.idObra,
    required this.valorFinal,
    required this.responsavelObra,
    required this.dataInicio,
    required this.dataFim,
    required this.cliente,
    required this.pagamento,
    required this.prestador,
    required this.endereco,
  });

  Map<String, dynamic> toJson() => _$ObraModelToJson(this);

  static ObraModel fromJson(Map<String, dynamic> json) =>
      _$ObraModelFromJson(json);
}
