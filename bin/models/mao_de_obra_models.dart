import 'package:json_annotation/json_annotation.dart';

import 'funcao_prestador_models.dart';
import 'prestador_models.dart';
import 'tipo_mao_de_obra_models.dart';

part 'mao_de_obra_models.g.dart';

@JsonSerializable()
class MaoDeObraModel {
  int? idMao;
  String descricao;
  TipoMaoDeObraModel tipo;
  PrestadorModel prestador;
  FuncaoPrestadorModel funcao;

  MaoDeObraModel({
    this.idMao,
    required this.descricao,
    required this.tipo,
    required this.prestador,
    required this.funcao,
  });

Map<String, dynamic> toJson() => _$MaoDeObraModelToJson(this);

  static MaoDeObraModel fromJson(Map<String, dynamic> json) =>
      _$MaoDeObraModelFromJson(json);
  
}
