// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prestador_obra_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrestadorObraModel _$PrestadorObraModelFromJson(Map<String, dynamic> json) =>
    PrestadorObraModel(
      idPrestadorObra: (json['idPrestadorObra'] as num?)?.toInt(),
      idPrestador: (json['idPrestador'] as num).toInt(),
      idObra: (json['idObra'] as num).toInt(),
      dataInicio: DateTime.parse(json['dataInicio'] as String),
      dataFim: json['dataFim'] == null
          ? null
          : DateTime.parse(json['dataFim'] as String),
    );

Map<String, dynamic> _$PrestadorObraModelToJson(PrestadorObraModel instance) =>
    <String, dynamic>{
      'idPrestadorObra': instance.idPrestadorObra,
      'idPrestador': instance.idPrestador,
      'idObra': instance.idObra,
      'dataInicio': instance.dataInicio.toIso8601String(),
      'dataFim': instance.dataFim?.toIso8601String(),
    };
