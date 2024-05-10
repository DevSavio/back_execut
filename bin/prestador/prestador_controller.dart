import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class PrestadorController {
  Future<void> create({
    required String nomePrestador,
    required String tipoPrestador,
    required String cpfCnpj,
    required String telefone,
    required int idFuncao,
  }) async {
    String sql =
        "INSERT INTO prestador (nomePrestador, tipoPrestador, cpfCnpj, telefone, idFuncao)"
        " VALUES ($nomePrestador, $tipoPrestador, $cpfCnpj, $telefone, $idFuncao);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );
    print('Prestador criado com sucesso!');
  }

  Future<void> update({
    required String nomePrestador,
    required String tipoPrestador,
    required String cpfCnpj,
    required String telefone,
    required int idFuncao,
    required int idPrestador,
  }) async {
    String sql =
        "Update prestador set nomePrestador = $nomePrestador, cpfCnpj = $cpfCnpj, telefone = $telefone, idFuncao = $idFuncao"
        " where idPrestador = $idPrestador;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Prestador Atualizado com sucesso');
  }

  Future<void> delete({
    required int idPrestador,
  }) async {
    String sql = "delete from prestador "
        " where idPrestador = $idPrestador;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Prestador excluído com sucesso');
  }

  Future<void> readByID({
    required int idPrestador,
  }) async {
    String sql = "select *  from prestador  where idPrestador = $idPrestador;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o prestador');
    } else {
      if (r.rows.isEmpty) {
        print('Prestador não encontrado');
      } else {
        for (var row in r.rows) {
          print('Prestador encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from prestador";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o prestador');
    } else {
      if (r.rows.isEmpty) {
        print('Prestador não encontrado');
      } else {
        for (var row in r.rows) {
          print('Prestador encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from prestador where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o prestador');
    } else {
      if (r.rows.isEmpty) {
        print('Prestador não encontrado');
      } else {
        for (var row in r.rows) {
          print('Prestador encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
