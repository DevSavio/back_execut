import 'dart:convert';

class TempoDeObraModel {
  int idTempo;
  String nomeTempo;

  TempoDeObraModel({
    required this.idTempo,
    required this.nomeTempo,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idTempo': idTempo,
      'nomeTempo': nomeTempo,
    };
  }

  // Método fromMap
  static TempoDeObraModel fromMap(Map<dynamic, dynamic> map) {
    return TempoDeObraModel(
      idTempo: map['idTempo'],
      nomeTempo: map['nomeTempo'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static TempoDeObraModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'TempoDeObraModel(idTempo: $idTempo, nomeTempo: $nomeTempo)';
  }
}
