import 'package:json_annotation/json_annotation.dart';

part 'funcao_prestador_models.g.dart';

@JsonSerializable()
class FuncaoPrestadorModel {
  int idFuncao;
  String nomeFuncao;
  String descricaoFuncao;

  FuncaoPrestadorModel({
    required this.idFuncao,
    required this.nomeFuncao,
    required this.descricaoFuncao,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idFuncao': idFuncao,
      'nomeFuncao': nomeFuncao,
      'descricaoFuncao': descricaoFuncao,
    };
  }

  Map<String, dynamic> toJson() => _$FuncaoPrestadorModelToJson(this);

  static FuncaoPrestadorModel fromJson(Map<String, dynamic> json) =>
      _$FuncaoPrestadorModelFromJson(json);
}
