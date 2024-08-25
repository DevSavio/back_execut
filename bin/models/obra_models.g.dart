// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obra_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObraModel _$ObraModelFromJson(Map<String, dynamic> json) => ObraModel(
      idObra: (json['idObra'] as num?)?.toInt(),
      valorFinal: (json['valorFinal'] as num).toDouble(),
      responsavelObra: json['responsavelObra'] as String,
      dataInicio: DateTime.parse(json['dataInicio'] as String),
      dataFim: DateTime.parse(json['dataFim'] as String),
      cliente: ClienteModel.fromJson(json['cliente'] as Map<String, dynamic>),
      pagamento:
          PagamentoModel.fromJson(json['pagamento'] as Map<String, dynamic>),
      prestador:
          PrestadorModel.fromJson(json['prestador'] as Map<String, dynamic>),
      endereco:
          EnderecoModel.fromJson(json['endereco'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ObraModelToJson(ObraModel instance) => <String, dynamic>{
      'idObra': instance.idObra,
      'valorFinal': instance.valorFinal,
      'responsavelObra': instance.responsavelObra,
      'dataInicio': instance.dataInicio.toIso8601String(),
      'dataFim': instance.dataFim.toIso8601String(),
      'cliente': instance.cliente,
      'pagamento': instance.pagamento,
      'prestador': instance.prestador,
      'endereco': instance.endereco,
    };
