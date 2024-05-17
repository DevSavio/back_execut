import 'dart:convert';

class CustoPrestadorModel {
  int idCusto;
  double valor;
  String razaoSocial;
  int idPrestador;
  int idFuncao;

  CustoPrestadorModel({
    required this.idCusto,
    required this.valor,
    required this.razaoSocial,
    required this.idPrestador,
    required this.idFuncao,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idCusto': idCusto,
      'valor': valor,
      'razaoSocial': razaoSocial,
      'idPrestador': idPrestador,
      'idFuncao': idFuncao,
    };
  }

  // Método fromMap
  static CustoPrestadorModel fromMap(Map<dynamic, dynamic> map) {
    return CustoPrestadorModel(
      idCusto: map['idCusto'],
      valor: map['valor'],
      razaoSocial: map['razaoSocial'],
      idPrestador: map['idPrestador'],
      idFuncao: map['idFuncao'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static CustoPrestadorModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'CustoPrestadorModel(idCusto: $idCusto, valor: $valor, razaoSocial: $razaoSocial, idPrestador: $idPrestador, idFuncao: $idFuncao)';
  }
}
