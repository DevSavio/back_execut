// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prestador_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrestadorModel _$PrestadorModelFromJson(Map<String, dynamic> json) =>
    PrestadorModel(
      idPrestador: (json['idPrestador'] as num?)?.toInt(),
      nomePrestador: json['nomePrestador'] as String,
      tipoPrestador: json['tipoPrestador'] as String?,
      cpfCnpj: json['cpfCnpj'] as String?,
      telefone: json['telefone'] as String?,
      idFuncao: (json['idFuncao'] as num).toInt(),
    );

Map<String, dynamic> _$PrestadorModelToJson(PrestadorModel instance) =>
    <String, dynamic>{
      'idPrestador': instance.idPrestador,
      'nomePrestador': instance.nomePrestador,
      'tipoPrestador': instance.tipoPrestador,
      'cpfCnpj': instance.cpfCnpj,
      'telefone': instance.telefone,
      'idFuncao': instance.idFuncao,
    };
