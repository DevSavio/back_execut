// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_de_fornecedor_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoDeFornecedorModel _$TipoDeFornecedorModelFromJson(
        Map<String, dynamic> json) =>
    TipoDeFornecedorModel(
      idTipo: (json['idTipo'] as num).toInt(),
      nomeTipo: json['nomeTipo'] as String,
      descricao: json['descricao'] as String,
    );

Map<String, dynamic> _$TipoDeFornecedorModelToJson(
        TipoDeFornecedorModel instance) =>
    <String, dynamic>{
      'idTipo': instance.idTipo,
      'nomeTipo': instance.nomeTipo,
      'descricao': instance.descricao,
    };
