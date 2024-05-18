// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funcao_prestador_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuncaoPrestadorModel _$FuncaoPrestadorModelFromJson(
        Map<String, dynamic> json) =>
    FuncaoPrestadorModel(
      idFuncao: (json['idFuncao'] as num).toInt(),
      nomeFuncao: json['nomeFuncao'] as String,
      descricaoFuncao: json['descricaoFuncao'] as String,
    );

Map<String, dynamic> _$FuncaoPrestadorModelToJson(
        FuncaoPrestadorModel instance) =>
    <String, dynamic>{
      'idFuncao': instance.idFuncao,
      'nomeFuncao': instance.nomeFuncao,
      'descricaoFuncao': instance.descricaoFuncao,
    };
