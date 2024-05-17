import 'dart:convert';

class ClienteModel {
  int idPrestador;
  String nomePrestador;
  String tipoPrestador;
  String logradouro;
  int idFuncao;
  String cpfCnpj;
  String? telefone;

  ClienteModel({
    required this.idPrestador,
    required this.nomePrestador,
    required this.tipoPrestador,
    required this.logradouro,
    required this.idFuncao,
    required this.cpfCnpj,
    required this.telefone,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idPrestador': idPrestador,
      'nomePrestador': nomePrestador,
      'tipoPrestador': tipoPrestador,
      'logradouro': logradouro,
      'idFuncao': idFuncao,
      'cpfCnpj': cpfCnpj,
      'telefone': telefone,
    };
  }

  // Método fromMap
  static ClienteModel fromMap(Map<dynamic, dynamic> map) {
    return ClienteModel(
      idPrestador: map['idPrestador'],
      nomePrestador: map['nomePrestador'],
      tipoPrestador: map['tipoPrestador'],
      logradouro: map['logradouro'],
      idFuncao: map['idFuncao'],
      cpfCnpj: map['cpfCnpj'],
      telefone: map['telefone'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static ClienteModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'ClienteModel(idPrestador: $idPrestador, nomePrestador: $nomePrestador, tipoPrestador: $tipoPrestador, logradouro: $logradouro, idFuncao: $idFuncao, cpfCnpj: $cpfCnpj, telefone: $telefone)';
  }
}
