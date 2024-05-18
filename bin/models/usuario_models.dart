import 'package:json_annotation/json_annotation.dart';

part 'usuario_models.g.dart';

@JsonSerializable()
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

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);

  static UsuarioModel fromJson(Map<String, dynamic> json) =>
      _$UsuarioModelFromJson(json);
}
