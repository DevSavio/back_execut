import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class OrigemRecursoController {
  Future<void> create({
    required String tipoOrigem,
    required String percentual,
  }) async {
    String sql =
        "INSERT INTO origem_recurso (tipoOrigem, percentual)"
        " VALUES ($tipoOrigem, $percentual);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );

    print('Origem recurso criado com sucesso!');
  }

  Future<void> update({
    required String tipoOrigem,
    required String percentual,
    required int idOrigem,
  }) async {
    String sql =
        "Update origem_recurso set tipoOrigem = $tipoOrigem, percentual = $percentual"
        " where idOrigem = $idOrigem;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Origem recurso Atualizado com sucesso');
  }

  Future<void> delete({
    required int idOrigem,
  }) async {
    String sql = "delete from origem_recurso "
        " where idOrigem = $idOrigem;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Origem recurso excluído com sucesso');
  }

  Future<void> readByID({
    required int idOrigem,
  }) async {
    String sql = "select *  from origem_recurso  where idOrigem = $idOrigem;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar origem recurso');
    } else {
      if (r.rows.isEmpty) {
        print('Origem recurso não encontrado');
      } else {
        for (var row in r.rows) {
          print('Origem recurso encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from origem_recurso";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o origem recurso');
    } else {
      if (r.rows.isEmpty) {
        print('Origem recurso não encontrado');
      } else {
        for (var row in r.rows) {
          print('Origem recurso encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from origem_recurso where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o origem recurso');
    } else {
      if (r.rows.isEmpty) {
        print('Origem recurso não encontrado');
      } else {
        for (var row in r.rows) {
          print('Origem recurso encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
