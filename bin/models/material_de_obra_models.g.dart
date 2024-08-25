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
      tipo: TipoDeObraModel.fromJson(json['tipo'] as Map<String, dynamic>),
      origem:
          OrigemRecursoModel.fromJson(json['origem'] as Map<String, dynamic>),
      fornecedor:
          FornecedorModel.fromJson(json['fornecedor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaterialDeObraModelToJson(
        MaterialDeObraModel instance) =>
    <String, dynamic>{
      'idMaterial': instance.idMaterial,
      'nomeMaterial': instance.nomeMaterial,
      'descricaoMaterial': instance.descricaoMaterial,
      'valor': instance.valor,
      'tipo': instance.tipo,
      'origem': instance.origem,
      'fornecedor': instance.fornecedor,
    };
