import 'dart:convert';

class PagamentoModel {
  int idPagamento;
  String tipoPagamento;
  String moeda;

  PagamentoModel({
    required this.idPagamento,
    required this.tipoPagamento,
    required this.moeda,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idPagamento': idPagamento,
      'tipoPagamento': tipoPagamento,
      'moeda': moeda,
    };
  }

  // Método fromMap
  static PagamentoModel fromMap(Map<dynamic, dynamic> map) {
    return PagamentoModel(
      idPagamento: map['idPagamento'],
      tipoPagamento: map['tipoPagamento'],
      moeda: map['moeda'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static PagamentoModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'PagamentoModel(idPagamento: $idPagamento, tipoPagamento: $tipoPagamento, moeda: $moeda)';
  }
}
