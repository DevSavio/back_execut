// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_de_obra_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialDeObraModel _$MaterialDeObraModelFromJson(Map<String, dynamic> json) =>
    MaterialDeObraModel(
      idMaterial: (json['idMaterial'] as num?)?.toInt(),
      nomeMaterial: json['nomeMaterial'] as String,
      descricaoMaterial: json['descricaoMaterial'] as String,
      valor: (json['valor'] as num).toDouble(),
      idTipo: (json['idTipo'] as num).toInt(),
      idOrigem: (json['idOrigem'] as num).toInt(),
      idFornecedor: (json['idFornecedor'] as num).toInt(),
    );

Map<String, dynamic> _$MaterialDeObraModelToJson(
        MaterialDeObraModel instance) =>
    <String, dynamic>{
      'idMaterial': instance.idMaterial,
      'nomeMaterial': instance.nomeMaterial,
      'descricaoMaterial': instance.descricaoMaterial,
      'valor': instance.valor,
      'idTipo': instance.idTipo,
      'idOrigem': instance.idOrigem,
      'idFornecedor': instance.idFornecedor,
    };
