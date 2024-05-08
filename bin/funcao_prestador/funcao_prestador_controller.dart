import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class FuncaoPrestadorController {
  Future<void> create({
    required String nomeFuncao,
    required String descricaoFuncao,
  }) async {
    String sql =
        "INSERT INTO funcao_prestador (nomeFuncao, descricaoFuncao)"
        " VALUES ($nomeFuncao, $descricaoFuncao);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );
    print('Função prestador criado com sucesso!');
  }

  Future<void> update({
    required String nomeFuncao,
    required String descricaoFuncao,
    required int idFuncao,
  }) async {
    String sql =
        "Update funcao_prestador set nomeFuncao = $nomeFuncao, descricaoFuncao = $descricaoFuncao"
        " where idFuncao = $idFuncao;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Função prestador Atualizado com sucesso');
  }

  Future<void> delete({
    required int idFuncao,
  }) async {
    String sql = "delete from funcao_prestador "
        " where idFuncao = $idFuncao;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Função prestador excluido com sucesso');
  }

  Future<void> readByID({
    required int idFuncao,
  }) async {
    String sql = "select *  from funcao_prestador  where idFuncao = $idFuncao;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o função prestador');
    } else {
      if (r.rows.isEmpty) {
        print('Função prestador não encontrado');
      } else {
        for (var row in r.rows) {
          print('Função prestador encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from funcao_prestador";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o função prestador');
    } else {
      if (r.rows.isEmpty) {
        print('Função prestador não encontrado');
      } else {
        for (var row in r.rows) {
          print('Função prestador encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from funcao_prestador where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o função prestador');
    } else {
      if (r.rows.isEmpty) {
        print('Função prestador não encontrado');
      } else {
        for (var row in r.rows) {
          print('Função prestador encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
