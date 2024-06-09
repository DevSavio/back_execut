import 'package:json_annotation/json_annotation.dart';

part 'cliente_models.g.dart';

@JsonSerializable()
class ClienteModel {
  int? idCliente;
  String nomeCliente;
  String razaoSocial;
  String cpfCnpj;
  String? telefone;
  int idEndereco;

  ClienteModel({
    required this.idCliente,
    required this.nomeCliente,
    required this.razaoSocial,
    required this.cpfCnpj,
    required this.telefone,
    required this.idEndereco
  });

  Map<String, dynamic> toJson() => _$ClienteModelToJson(this);

  static ClienteModel fromJson(Map<String, dynamic> json) =>
      _$ClienteModelFromJson(json);
}
