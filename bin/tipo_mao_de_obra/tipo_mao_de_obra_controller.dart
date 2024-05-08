import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class TipoMaoDeObraController {
  Future<void> create({
    required String nomeTipo,
    required String descricao,
  }) async {
    String sql =
        "INSERT INTO tipo_mao_de_obra (nomeTipo, descricao)"
        " VALUES ($nomeTipo, $descricao);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );

    print('Tipo mão de obra criado com sucesso!');
  }

  Future<void> update({
    required String nomeTipo,
    required String descricao,
    required int idTipo,
  }) async {
    String sql =
        "Update tipo_mao_de_obra set nomeTipo = $nomeTipo, descricao = $descricao"
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Tipo mão de obra Atualizado com sucesso');
  }

  Future<void> delete({
    required int idTipo,
  }) async {
    String sql = "delete from tipo_mao_de_obra "
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Tipo mão de obra excluido com sucesso');
  }

  Future<void> readByID({
    required int idTipo,
  }) async {
    String sql = "select *  from tipo_mao_de_obra  where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo mão de obra');
    } else {
      if (r.rows.isEmpty) {
        print('Tipo mão de obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Tipo mão de obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from tipo_mao_de_obra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo mão de obra');
    } else {
      if (r.rows.isEmpty) {
        print('Tipo mão de obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Tipo mão de obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from tipo_mao_de_obra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo mão de obra');
    } else {
      if (r.rows.isEmpty) {
        print('Tipo mão de obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Tipo mão de obra encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
