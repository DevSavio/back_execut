import 'dart:convert';

class PrestadorObraModel {
  int idPrestadorObra;
  int idPrestador;
  int idObra;

  PrestadorObraModel({
    required this.idPrestadorObra,
    required this.idPrestador,
    required this.idObra,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idPrestadorObra': idPrestadorObra,
      'idPrestador': idPrestador,
      'idObra': idObra,
    };
  }

  // Método fromMap
  static PrestadorObraModel fromMap(Map<dynamic, dynamic> map) {
    return PrestadorObraModel(
      idPrestadorObra: map['idPrestadorObra'],
      idPrestador: map['idPrestador'],
      idObra: map['idObra'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static PrestadorObraModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'PrestadorObraModel(idPrestadorObra: $idPrestadorObra, idPrestador: $idPrestador, idObra: $idObra)';
  }
}
