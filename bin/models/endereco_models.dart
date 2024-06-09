import 'package:json_annotation/json_annotation.dart';

part 'endereco_models.g.dart';

@JsonSerializable()
class EnderecoModel {
  int? idEndereco;
  String logradouro;
  String complemento;
  String cidade;
  String estado;

  EnderecoModel({
    this.idEndereco,
    required this.logradouro,
    required this.complemento,
    required this.cidade,
    required this.estado
  });

  Map<String, dynamic> toJson() => _$EnderecoModelToJson(this);

  static EnderecoModel fromJson(Map<String, dynamic> json) =>
      _$EnderecoModelFromJson(json);
}
