import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class TipoDeObraController {
  Future<void> create({
    required String nomeTempo,
  }) async {
    String sql =
        "INSERT INTO tipo_de_obra (nomeTempo)"
        " VALUES ($nomeTempo);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );

    print('Tempo de obra criado com sucesso!');
  }

  Future<void> update({
    required String nomeTempo,
    required int idTempo,
  }) async {
    String sql =
        "Update tempo_de_obra set nomeTempo = $nomeTempo"
        " where idTempo = $idTempo;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Tempo de obra Atualizado com sucesso');
  }

  Future<void> delete({
    required int idTempo,
  }) async {
    String sql = "delete from tempo_de_obra "
        " where idTipo = $idTempo;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Tempo mão de obra excluido com sucesso');
  }

  Future<void> readByID({
    required int idTempo,
  }) async {
    String sql = "select *  from tempo_de_obra  where idTempo = $idTempo;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tempo de obra');
    } else {
      if (r.rows.isEmpty) {
        print('Tempo de obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Tempo de obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from tempo_de_obra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tempo de obra');
    } else {
      if (r.rows.isEmpty) {
        print('Tempo de obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Tempo de obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from tempo_de_obra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tempo de obra');
    } else {
      if (r.rows.isEmpty) {
        print('Tempo de obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Tempo de obra encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
