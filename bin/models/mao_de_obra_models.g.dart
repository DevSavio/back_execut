// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mao_de_obra_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaoDeObraModel _$MaoDeObraModelFromJson(Map<String, dynamic> json) =>
    MaoDeObraModel(
      idMao: (json['idMao'] as num).toInt(),
      descricao: json['descricao'] as String,
      idTipo: (json['idTipo'] as num).toInt(),
      idPrestador: (json['idPrestador'] as num).toInt(),
      idFuncao: (json['idFuncao'] as num).toInt(),
    );

Map<String, dynamic> _$MaoDeObraModelToJson(MaoDeObraModel instance) =>
    <String, dynamic>{
      'idMao': instance.idMao,
      'descricao': instance.descricao,
      'idTipo': instance.idTipo,
      'idPrestador': instance.idPrestador,
      'idFuncao': instance.idFuncao,
    };
