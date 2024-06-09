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
      idCliente: (json['idCliente'] as num).toInt(),
      idPagamento: (json['idPagamento'] as num).toInt(),
      idTempo: (json['idTempo'] as num).toInt(),
      idPrestador: (json['idPrestador'] as num).toInt(),
      idEndereco: (json['idEndereco'] as num).toInt(),
    );

Map<String, dynamic> _$ObraModelToJson(ObraModel instance) => <String, dynamic>{
      'idObra': instance.idObra,
      'valorFinal': instance.valorFinal,
      'responsavelObra': instance.responsavelObra,
      'dataInicio': instance.dataInicio.toIso8601String(),
      'dataFim': instance.dataFim.toIso8601String(),
      'idCliente': instance.idCliente,
      'idPagamento': instance.idPagamento,
      'idTempo': instance.idTempo,
      'idPrestador': instance.idPrestador,
      'idEndereco': instance.idEndereco,
    };
