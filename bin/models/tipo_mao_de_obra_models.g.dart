// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_mao_de_obra_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoMaoDeObraModel _$TipoMaoDeObraModelFromJson(Map<String, dynamic> json) =>
    TipoMaoDeObraModel(
      idTipo: (json['idTipo'] as num?)?.toInt(),
      nomeTipo: json['nomeTipo'] as String,
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$TipoMaoDeObraModelToJson(TipoMaoDeObraModel instance) =>
    <String, dynamic>{
      'idTipo': instance.idTipo,
      'nomeTipo': instance.nomeTipo,
      'descricao': instance.descricao,
    };
