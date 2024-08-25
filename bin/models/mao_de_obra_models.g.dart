// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mao_de_obra_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaoDeObraModel _$MaoDeObraModelFromJson(Map<String, dynamic> json) =>
    MaoDeObraModel(
      idMao: (json['idMao'] as num?)?.toInt(),
      descricao: json['descricao'] as String,
      tipo: TipoMaoDeObraModel.fromJson(json['tipo'] as Map<String, dynamic>),
      prestador:
          PrestadorModel.fromJson(json['prestador'] as Map<String, dynamic>),
      funcao:
          FuncaoPrestadorModel.fromJson(json['funcao'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaoDeObraModelToJson(MaoDeObraModel instance) =>
    <String, dynamic>{
      'idMao': instance.idMao,
      'descricao': instance.descricao,
      'tipo': instance.tipo,
      'prestador': instance.prestador,
      'funcao': instance.funcao,
    };
