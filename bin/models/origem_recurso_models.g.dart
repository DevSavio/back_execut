// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'origem_recurso_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrigemRecursoModel _$OrigemRecursoModelFromJson(Map<String, dynamic> json) =>
    OrigemRecursoModel(
      idOrigem: (json['idOrigem'] as num?)?.toInt(),
      tipoOrigem: json['tipoOrigem'] as String,
      valor: (json['valor'] as num).toDouble(),
    );

Map<String, dynamic> _$OrigemRecursoModelToJson(OrigemRecursoModel instance) =>
    <String, dynamic>{
      'idOrigem': instance.idOrigem,
      'tipoOrigem': instance.tipoOrigem,
      'valor': instance.valor,
    };
