import 'dart:convert';

class ClienteModel{

  int idCliente;
  String nomeCliente;
  String razaoSocial;
  String logradouro;
  String? complemento;
  String cpfCnpj;

  ClienteModel({
    required this.idCliente,
    required this.nomeCliente,
    required this.razaoSocial,
    required this.logradouro,
    this.complemento,
    required this.cpfCnpj,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idCliente': idCliente,
      'nomeCliente': nomeCliente,
      'razaoSocial': razaoSocial,
      'logradouro': logradouro,
      'complemento': complemento,
      'cpfCnpj': cpfCnpj,
    };
  }

  // Método fromMap
  static ClienteModel fromMap(Map<String, dynamic> map) {
    return ClienteModel(
      idCliente: map['idCliente'],
      nomeCliente: map['nomeCliente'],
      razaoSocial: map['razaoSocial'],
      logradouro: map['logradouro'],
      complemento: map['complemento'],
      cpfCnpj: map['cpfCnpj'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static ClienteModel fromJson(String source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'ClienteModel(idCliente: $idCliente, nomeCliente: $nomeCliente, razaoSocial: $razaoSocial, logradouro: $logradouro, complemento: $complemento, cpfCnpj: $cpfCnpj)';
  }
}