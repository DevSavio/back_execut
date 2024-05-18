// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tempo_de_obra_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempoDeObraModel _$TempoDeObraModelFromJson(Map<String, dynamic> json) =>
    TempoDeObraModel(
      idTempo: (json['idTempo'] as num).toInt(),
      nomeTempo: json['nomeTempo'] as String,
    );

Map<String, dynamic> _$TempoDeObraModelToJson(TempoDeObraModel instance) =>
    <String, dynamic>{
      'idTempo': instance.idTempo,
      'nomeTempo': instance.nomeTempo,
    };
