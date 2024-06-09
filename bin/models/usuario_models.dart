import 'package:json_annotation/json_annotation.dart';

part 'usuario_models.g.dart';

@JsonSerializable()
class UsuarioModel {
  int? idUsuario;
  String nomeUsuario;
  String razaoSocial;
  String cpfCnpj;
  String telefone;
  int idEndereco;

  UsuarioModel({
    required this.idUsuario,
    required this.nomeUsuario,
    required this.razaoSocial,
    required this.cpfCnpj,
    required this.telefone,
    required this.idEndereco
  });

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);

  static UsuarioModel fromJson(Map<String, dynamic> json) =>
      _$UsuarioModelFromJson(json);
}
