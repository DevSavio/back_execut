import 'dart:convert';

class UsuarioModel {
  int idUsuario;
  String nomeUsuario;
  String razaoSocial;
  String logradouro;
  String? complemento;
  String cpfCnpj;
  String? telefone;

  UsuarioModel({
    required this.idUsuario,
    required this.nomeUsuario,
    required this.razaoSocial,
    required this.logradouro,
    this.complemento,
    required this.cpfCnpj,
     required this.telefone,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idCliente': idUsuario,
      'nomeCliente': nomeUsuario,
      'razaoSocial': razaoSocial,
      'logradouro': logradouro,
      'complemento': complemento,
      'cpfCnpj': cpfCnpj,
      'telefone': telefone,
    };
  }

  // Método fromMap
  static UsuarioModel fromMap(Map<dynamic, dynamic> map) {
    return UsuarioModel(
      idUsuario: map['idUsuario'],
      nomeUsuario: map['nomeUsuario'],
      razaoSocial: map['razaoSocial'],
      logradouro: map['logradouro'],
      complemento: map['complemento'],
      cpfCnpj: map['cpfCnpj'],
            telefone: map['telefone'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static UsuarioModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'UsuarioModel(idUsuario: $idUsuario, nomeUsuario: $nomeUsuario, razaoSocial: $razaoSocial, logradouro: $logradouro, complemento: $complemento, cpfCnpj: $cpfCnpj, telefone: $telefone)';
  }
}
