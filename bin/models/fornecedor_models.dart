import 'package:json_annotation/json_annotation.dart';

import 'endereco_models.dart';
import 'tipo_de_fornecedor_models.dart';

part 'fornecedor_models.g.dart';

@JsonSerializable()
class FornecedorModel {
  int? idFornecedor;
  String razaoSocial;
  TipoDeFornecedorModel tipo;
  String telefone;
  EnderecoModel endereco;

  FornecedorModel({
    this.idFornecedor,
    required this.razaoSocial,
    required this.tipo,
    required this.telefone,
    required this.endereco,
  });

  
  Map<String, dynamic> toJson() => _$FornecedorModelToJson(this);

  static FornecedorModel fromJson(Map<String, dynamic> json) =>
      _$FornecedorModelFromJson(json);
}
