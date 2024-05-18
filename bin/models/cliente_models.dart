import 'package:json_annotation/json_annotation.dart';

part 'cliente_models.g.dart';

@JsonSerializable()
class ClienteModel {
  int? idCliente;
  String nomeCliente;
  String razaoSocial;
  String logradouro;
  String? complemento;
  String cpfCnpj;
  String? telefone;

  ClienteModel({
    required this.idCliente,
    required this.nomeCliente,
    required this.razaoSocial,
    required this.logradouro,
    this.complemento,
    required this.cpfCnpj,
    required this.telefone,
  });

  Map<String, dynamic> toJson() => _$ClienteModelToJson(this);

  static ClienteModel fromJson(Map<String, dynamic> json) =>
      _$ClienteModelFromJson(json);
}
