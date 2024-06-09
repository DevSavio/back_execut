// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnderecoModel _$EnderecoModelFromJson(Map<String, dynamic> json) =>
    EnderecoModel(
      idEndereco: (json['idEndereco'] as num?)?.toInt(),
      logradouro: json['logradouro'] as String,
      complemento: json['complemento'] as String,
      cidade: json['cidade'] as String,
      estado: json['estado'] as String,
    );

Map<String, dynamic> _$EnderecoModelToJson(EnderecoModel instance) =>
    <String, dynamic>{
      'idEndereco': instance.idEndereco,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'cidade': instance.cidade,
      'estado': instance.estado,
    };
