import 'dart:ffi';

import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class ObraController {
  Future<void> create({
    required Float valorFinal,
    required String responsavelObra,
    required DateTime dataInicio,
    required DateTime dataFim,
    required String logradouro,
    required String complemento,
    required int idCliente,
    required int idPagamento,
    required int idTempo,
    required int idPrestador,
  }) async {
    String sql =
        "INSERT INTO obra (responsavelObra, dataInicio, dataFim, logradouro,complemento, idCliente, idPagamento, idTempo, idPrestador)"
        " VALUES ($responsavelObra, $dataInicio, $dataFim, $logradouro, $complemento, $idCliente, $idPagamento, $idTempo,  $idPrestador)";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );
    print('Obra criado com sucesso!');
  }

  Future<void> update({
    required Float valorFinal,
    required String responsavelObra,
    required DateTime dataInicio,
    required DateTime dataFim,
    required String logradouro,
    required String complemento,
    required int idCliente,
    required int idPagamento,
    required int idTempo,
    required int idPrestador,
    required int idObra,
  }) async {
    String sql =
        "Update obra set responsavelObra = $responsavelObra, dataInicio = $dataInicio, dataFim = $dataFim, logradouro = $logradouro, idPrestador= $idPrestador"
        " where idObra = $idObra;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Obra Atualizado com sucesso');
  }

  Future<void> delete({
    required int idObra,
  }) async {
    String sql = "delete from obra "
        " where idObra = $idObra;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Obra excluído com sucesso');
  }

  Future<void> readByID({
    required int idObra,
  }) async {
    String sql = "select *  from obra  where idObra = $idObra;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o obra');
    } else {
      if (r.rows.isEmpty) {
        print('Obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from obra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o obra');
    } else {
      if (r.rows.isEmpty) {
        print('Obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from obra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o obra');
    } else {
      if (r.rows.isEmpty) {
        print('Obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Obra encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
