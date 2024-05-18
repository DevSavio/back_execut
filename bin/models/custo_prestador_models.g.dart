// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custo_prestador_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustoPrestadorModel _$CustoPrestadorModelFromJson(Map<String, dynamic> json) =>
    CustoPrestadorModel(
      idCusto: (json['idCusto'] as num).toInt(),
      valor: (json['valor'] as num).toDouble(),
      idPrestador: (json['idPrestador'] as num).toInt(),
      idFuncao: (json['idFuncao'] as num).toInt(),
    );

Map<String, dynamic> _$CustoPrestadorModelToJson(
        CustoPrestadorModel instance) =>
    <String, dynamic>{
      'idCusto': instance.idCusto,
      'valor': instance.valor,
      'idPrestador': instance.idPrestador,
      'idFuncao': instance.idFuncao,
    };
