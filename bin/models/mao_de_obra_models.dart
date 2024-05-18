import 'package:json_annotation/json_annotation.dart';

part 'mao_de_obra_models.g.dart';

@JsonSerializable()
class MaoDeObraModel {
  int idMao;
  String descricao;
  int idTipo;
  int idPrestador;
  int idFuncao;

  MaoDeObraModel({
    required this.idMao,
    required this.descricao,
    required this.idTipo,
    required this.idPrestador,
    required this.idFuncao,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idMao': idMao,
      'descricao': descricao,
      'idTipo': idTipo,
      'idPrestador': idPrestador,
      'idFuncao': idFuncao,
    };
  }
Map<String, dynamic> toJson() => _$MaoDeObraModelToJson(this);

  static MaoDeObraModel fromJson(Map<String, dynamic> json) =>
      _$MaoDeObraModelFromJson(json);
  
}
