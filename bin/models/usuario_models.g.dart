// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) => UsuarioModel(
      idUsuario: (json['idUsuario'] as num?)?.toInt(),
      nomeUsuario: json['nomeUsuario'] as String,
      razaoSocial: json['razaoSocial'] as String,
      cpfCnpj: json['cpfCnpj'] as String,
      telefone: json['telefone'] as String,
      endereco:
          EnderecoModel.fromJson(json['endereco'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsuarioModelToJson(UsuarioModel instance) =>
    <String, dynamic>{
      'idUsuario': instance.idUsuario,
      'nomeUsuario': instance.nomeUsuario,
      'razaoSocial': instance.razaoSocial,
      'cpfCnpj': instance.cpfCnpj,
      'telefone': instance.telefone,
      'endereco': instance.endereco,
    };
