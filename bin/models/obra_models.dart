import 'dart:convert';
import 'dart:ffi';

class ObraModel {
  int idObra;
  Float valorFinal;
  String responsavelObra;
  DateTime dataInicio;
  DateTime dataFim;
  String logradouro;
  String? complemento;
  int idCliente;
  int idPagamento;
  int idTempo;
  int idPrestador;

  ObraModel({
    required this.idObra,
    required this.valorFinal,
    required this.responsavelObra,
    required this.dataInicio,
    required this.dataFim,
    required this.logradouro,
    this.complemento,
    required this.idCliente,
    required this.idPagamento,
    required this.idTempo,
    required this.idPrestador,
  });

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'idObra': idObra,
      'valorFinal': valorFinal,
      'responsavelObra': responsavelObra,
      'dataInicio': dataInicio,
      'dataFim': dataFim,
      'logradouro': logradouro,
      'complemento': complemento,
      'idCliente': idCliente,
      'idPagamento': idPagamento,
      'idTempo': idTempo,
      'idPrestador': idPrestador,
    };
  }

  // Método fromMap
  static ObraModel fromMap(Map<dynamic, dynamic> map) {
    return ObraModel(
      idObra: map['idObra'],
      valorFinal: map['valorFinal'],
      responsavelObra: map['responsavelObra'],
      dataInicio: map['dataInicio'],
      dataFim: map['dataFim'],
      logradouro: map['logradouro'],
      complemento: map['complemento'],
      idCliente: map['idCliente'],
      idPagamento: map['idPagamento'],
      idTempo: map['idTempo'],
      idPrestador: map['idPrestador'],
    );
  }

  // Método toJson
  String toJson() => json.encode(toMap());

  // Método fromJson
  static ObraModel fromJson(dynamic source) => fromMap(json.decode(source));

  // Método toString
  @override
  String toString() {
    return 'ObraModel(idObra: $idObra, valorFinal: $valorFinal, responsavelObra: $responsavelObra, dataInicio: $dataInicio, dataFim: $dataFim, logradouro: $logradouro, complemento: $complemento, idCliente: $idCliente, idPagamento: $idPagamento, idTempo: $idTempo, idPrestador: $idPrestador)';
  }
}
