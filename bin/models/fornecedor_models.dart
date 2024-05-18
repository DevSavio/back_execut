import 'package:json_annotation/json_annotation.dart';

part 'fornecedor_models.g.dart';

@JsonSerializable()
class FornecedorModel {
  int idFornecedor;
  String razaoSocial;
  String logradouro;
  String? complemento;
  int idTipo;
  String? telefone;

  FornecedorModel({
    required this.idFornecedor,
    required this.razaoSocial,
    required this.logradouro,
    required this.idTipo,
    required this.telefone,
    this.complemento,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idFornecedor': idFornecedor,
      'razaoSocial': razaoSocial,
      'logradouro': logradouro,
      'complemento': complemento,
      'idTipo': idTipo,
      'telefone': telefone,
    };
  }

  Map<String, dynamic> toJson() => _$FornecedorModelToJson(this);

  static FornecedorModel fromJson(Map<String, dynamic> json) =>
      _$FornecedorModelFromJson(json);
}
