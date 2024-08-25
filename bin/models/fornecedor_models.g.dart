// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FornecedorModel _$FornecedorModelFromJson(Map<String, dynamic> json) =>
    FornecedorModel(
      idFornecedor: (json['idFornecedor'] as num?)?.toInt(),
      razaoSocial: json['razaoSocial'] as String,
      tipo:
          TipoDeFornecedorModel.fromJson(json['tipo'] as Map<String, dynamic>),
      telefone: json['telefone'] as String,
      endereco:
          EnderecoModel.fromJson(json['endereco'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FornecedorModelToJson(FornecedorModel instance) =>
    <String, dynamic>{
      'idFornecedor': instance.idFornecedor,
      'razaoSocial': instance.razaoSocial,
      'tipo': instance.tipo,
      'telefone': instance.telefone,
      'endereco': instance.endereco,
    };
