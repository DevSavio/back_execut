import 'dart:convert';

class FornecedorModel {
  int idFornecedor;
  String razaoSocial;
  String logradouro;
  String? complemento;
  int idTipo;
  String? telefone;

  FornecedorModel({
    required this.idFornecedor,
    required this.razaoSocial,
    required this.logradouro,
    required this.idTipo,
    required this.telefone,
    this.complemento,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idFornecedor': idFornecedor,
      'razaoSocial': razaoSocial,
      'logradouro': logradouro,
      'complemento': complemento,
      'idTipo': idTipo,
      'telefone': telefone,
    };
  }

  // Método fromMap
  static FornecedorModel fromMap(Map<dynamic, dynamic> map) {
    return FornecedorModel(
      idFornecedor: map['idFornecedor'],
      razaoSocial: map['razaoSocial'],
      logradouro: map['logradouro'],
      complemento: map['complemento'],
      idTipo: map['idTipo'],
      telefone: map['telefone'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static FornecedorModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'FornecedorModel(idFornecedor: $idFornecedor, razaoSocial: $razaoSocial, logradouro: $logradouro, complemento: $complemento, idTipo: $idTipo, telefone: $telefone)';
  }
}
