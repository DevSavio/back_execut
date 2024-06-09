// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClienteModel _$ClienteModelFromJson(Map<String, dynamic> json) => ClienteModel(
      idCliente: (json['idCliente'] as num?)?.toInt(),
      nomeCliente: json['nomeCliente'] as String,
      razaoSocial: json['razaoSocial'] as String,
      cpfCnpj: json['cpfCnpj'] as String,
      telefone: json['telefone'] as String?,
      idEndereco: (json['idEndereco'] as num).toInt(),
    );

Map<String, dynamic> _$ClienteModelToJson(ClienteModel instance) =>
    <String, dynamic>{
      'idCliente': instance.idCliente,
      'nomeCliente': instance.nomeCliente,
      'razaoSocial': instance.razaoSocial,
      'cpfCnpj': instance.cpfCnpj,
      'telefone': instance.telefone,
      'idEndereco': instance.idEndereco,
    };
