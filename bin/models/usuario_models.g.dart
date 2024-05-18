// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) => UsuarioModel(
      idUsuario: (json['idUsuario'] as num).toInt(),
      nomeUsuario: json['nomeUsuario'] as String,
      razaoSocial: json['razaoSocial'] as String,
      logradouro: json['logradouro'] as String,
      complemento: json['complemento'] as String?,
      cpfCnpj: json['cpfCnpj'] as String,
      telefone: json['telefone'] as String?,
    );

Map<String, dynamic> _$UsuarioModelToJson(UsuarioModel instance) =>
    <String, dynamic>{
      'idUsuario': instance.idUsuario,
      'nomeUsuario': instance.nomeUsuario,
      'razaoSocial': instance.razaoSocial,
      'logradouro': instance.logradouro,
      'complemento': instance.complemento,
      'cpfCnpj': instance.cpfCnpj,
      'telefone': instance.telefone,
    };
