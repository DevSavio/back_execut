// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prestador_obra_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrestadorObraModel _$PrestadorObraModelFromJson(Map<String, dynamic> json) =>
    PrestadorObraModel(
      idPrestadorObra: (json['idPrestadorObra'] as num).toInt(),
      idPrestador: (json['idPrestador'] as num).toInt(),
      idObra: (json['idObra'] as num).toInt(),
    );

Map<String, dynamic> _$PrestadorObraModelToJson(PrestadorObraModel instance) =>
    <String, dynamic>{
      'idPrestadorObra': instance.idPrestadorObra,
      'idPrestador': instance.idPrestador,
      'idObra': instance.idObra,
    };
