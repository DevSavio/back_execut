// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagamentoModel _$PagamentoModelFromJson(Map<String, dynamic> json) =>
    PagamentoModel(
      idPagamento: (json['idPagamento'] as num).toInt(),
      tipoPagamento: json['tipoPagamento'] as String,
      moeda: json['moeda'] as String,
    );

Map<String, dynamic> _$PagamentoModelToJson(PagamentoModel instance) =>
    <String, dynamic>{
      'idPagamento': instance.idPagamento,
      'tipoPagamento': instance.tipoPagamento,
      'moeda': instance.moeda,
    };
