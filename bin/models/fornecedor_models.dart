import 'package:json_annotation/json_annotation.dart';

part 'fornecedor_models.g.dart';

@JsonSerializable()
class FornecedorModel {
  int idFornecedor;
  String razaoSocial;
  int idTipo;
  String telefone;
  int idEndereco;

  FornecedorModel({
    required this.idFornecedor,
    required this.razaoSocial,
    required this.idTipo,
    required this.telefone,
    required this.idEndereco,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idFornecedor': idFornecedor,
      'razaoSocial': razaoSocial,
      'idTipo': idTipo,
      'telefone': telefone,
      'idEndereco': idEndereco,
    };
  }

  Map<String, dynamic> toJson() => _$FornecedorModelToJson(this);

  static FornecedorModel fromJson(Map<String, dynamic> json) =>
      _$FornecedorModelFromJson(json);
}
