import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class CustoPrestadorController {
  Future<void> create({
    required double valor,
    required int idPrestador,
    required int idFuncao,
  }) async {
    String sql =
        "INSERT INTO custo_prestador (valor, idPrestador, idFuncao)"
        " VALUES ($valor, $idPrestador, $idFuncao)";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );
    print('Custo prestador criado com sucesso!');
  }

  Future<void> update({
    required double valor,
    required int idPrestador,
    required int idFuncao,
    required int idCustoPrestador,
  }) async {
    String sql =
        "Update custo_prestador set valor = $valor, idPrestador = $idPrestador, idFuncao = $idFuncao"
        " where idCustoPrestador = $idCustoPrestador;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Custo prestador Atualizado com sucesso');
  }

  Future<void> delete({
    required int idCustoPrestador,
  }) async {
    String sql = "delete from custo_prestador "
        " where idCustoPrestador = $idCustoPrestador;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Custo prestador excluído com sucesso');
  }

  Future<void> readByID({
    required int idCustoPrestador,
  }) async {
    String sql = "select *  from custo_prestador  where idCustoPrestador = $idCustoPrestador;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o custo prestador');
    } else {
      if (r.rows.isEmpty) {
        print('Custo prestador não encontrado');
      } else {
        for (var row in r.rows) {
          print('Custo prestador encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from custo_prestador";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o custo prestador');
    } else {
      if (r.rows.isEmpty) {
        print('Custo prestador não encontrado');
      } else {
        for (var row in r.rows) {
          print('Custo prestador encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from custo_prestador where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o custo prestador');
    } else {
      if (r.rows.isEmpty) {
        print('Custo prestador não encontrado');
      } else {
        for (var row in r.rows) {
          print('Custo prestador encontrado: ${row.assoc()}');
        }
      }
    }
  }
}