import 'package:json_annotation/json_annotation.dart';

import 'endereco_models.dart';

part 'obra_models.g.dart';

@JsonSerializable()
class ObraModel {
  int? idObra;
  double valorFinal;
  String responsavelObra;
  DateTime dataInicio;
  DateTime dataFim;
  int idCliente;
  int idPagamento;
  int idTempo;
  int idPrestador;
  EnderecoModel endereco;

  ObraModel({
    this.idObra,
    required this.valorFinal,
    required this.responsavelObra,
    required this.dataInicio,
    required this.dataFim,
    required this.idCliente,
    required this.idPagamento,
    required this.idTempo,
    required this.idPrestador,
    required this.endereco,
  });

  Map<String, dynamic> toJson() => _$ObraModelToJson(this);

  static ObraModel fromJson(Map<String, dynamic> json) =>
      _$ObraModelFromJson(json);
}
