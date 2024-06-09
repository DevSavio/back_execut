import 'package:json_annotation/json_annotation.dart';

import 'endereco_models.dart';

part 'cliente_models.g.dart';

@JsonSerializable()
class ClienteModel {
  int? idCliente;
  String nomeCliente;
  String razaoSocial;
  String cpfCnpj;
  String? telefone;
  EnderecoModel endereco;

  ClienteModel({
    this.idCliente,
    required this.nomeCliente,
    required this.razaoSocial,
    required this.cpfCnpj,
    required this.telefone,
    required this.endereco
  });

  Map<String, dynamic> toJson() => _$ClienteModelToJson(this);

  static ClienteModel fromJson(Map<String, dynamic> json) =>
      _$ClienteModelFromJson(json);
}
