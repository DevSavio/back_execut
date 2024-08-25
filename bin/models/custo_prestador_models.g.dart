// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custo_prestador_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustoPrestadorModel _$CustoPrestadorModelFromJson(Map<String, dynamic> json) =>
    CustoPrestadorModel(
      idCusto: (json['idCusto'] as num?)?.toInt(),
      valor: (json['valor'] as num).toDouble(),
      prestador:
          PrestadorModel.fromJson(json['prestador'] as Map<String, dynamic>),
      funcao:
          FuncaoPrestadorModel.fromJson(json['funcao'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustoPrestadorModelToJson(
        CustoPrestadorModel instance) =>
    <String, dynamic>{
      'idCusto': instance.idCusto,
      'valor': instance.valor,
      'prestador': instance.prestador,
      'funcao': instance.funcao,
    };
