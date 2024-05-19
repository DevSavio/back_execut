// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FornecedorModel _$FornecedorModelFromJson(Map<String, dynamic> json) =>
    FornecedorModel(
      idFornecedor: (json['idFornecedor'] as num).toInt(),
      razaoSocial: json['razaoSocial'] as String,
      logradouro: json['logradouro'] as String,
      idTipo: (json['idTipo'] as num).toInt(),
      telefone: json['telefone'] as String,
      complemento: json['complemento'] as String?,
    );

Map<String, dynamic> _$FornecedorModelToJson(FornecedorModel instance) =>
    <String, dynamic>{
      'idFornecedor': instance.idFornecedor,
      'razaoSocial': instance.razaoSocial,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'idTipo': instance.idTipo,
      'telefone': instance.telefone,
    };
