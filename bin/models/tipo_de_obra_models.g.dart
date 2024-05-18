// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_de_obra_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoDeObraModel _$TipoDeObraModelFromJson(Map<String, dynamic> json) =>
    TipoDeObraModel(
      idTipo: (json['idTipo'] as num).toInt(),
      nomeTipo: json['nomeTipo'] as String,
      descricaoTipo: json['descricaoTipo'] as String,
    );

Map<String, dynamic> _$TipoDeObraModelToJson(TipoDeObraModel instance) =>
    <String, dynamic>{
      'idTipo': instance.idTipo,
      'nomeTipo': instance.nomeTipo,
      'descricaoTipo': instance.descricaoTipo,
    };
