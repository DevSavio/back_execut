import 'dart:convert';
import 'dart:ffi';

class OrigemRecursoModel {
  int idOrigem;
  String tipoOrigem;
  Float? percentual;

  OrigemRecursoModel({
    required this.idOrigem,
    required this.tipoOrigem,
    this.percentual,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idOrigem': idOrigem,
      'tipoOrigem': tipoOrigem,
      'percentual': percentual,
    };
  }

  // Método fromMap
  static OrigemRecursoModel fromMap(Map<dynamic, dynamic> map) {
    return OrigemRecursoModel(
      idOrigem: map['idOrigem'],
      tipoOrigem: map['tipoOrigem'],
      percentual: map['percentual'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static OrigemRecursoModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'OrigemRecursoModel(idOrigem: $idOrigem, tipoOrigem: $tipoOrigem, percentual: $percentual)';
  }
}
