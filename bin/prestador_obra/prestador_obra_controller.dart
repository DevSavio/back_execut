import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class PrestadorObraController {
  Future<void> create({
    required int idPrestador,
    required int idObra,
  }) async {
    String sql =
        "INSERT INTO prestadorObra (idPrestador, idObra)"
        " VALUES ($idPrestador, $idObra);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );

    print('Prestador obra criado com sucesso!');
  }

  Future<void> update({
    required String idPrestador,
    required double idObra,
    required int idPrestadorObra,
  }) async {
    String sql =
        "Update prestadorObra set idPrestador = $idPrestador, idObra = $idObra"
        " where idPrestadorObra = $idPrestadorObra;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Prestador obra Atualizado com sucesso');
  }

  Future<void> delete({
    required int idPrestadorObra,
  }) async {
    String sql = "delete from prestadorObra "
        " where idPrestadorObra = $idPrestadorObra;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Prestador obra excluído com sucesso');
  }

  Future<void> readByID({
    required int idPrestadorObra,
  }) async {
    String sql = "select *  from prestadorObra  where idPrestadorObra = $idPrestadorObra;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar prestador obra');
    } else {
      if (r.rows.isEmpty) {
        print('Prestador obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Prestador obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from prestadorObra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o prestador obra');
    } else {
      if (r.rows.isEmpty) {
        print('Prestador obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Prestador obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from prestadorObra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o prestador obra');
    } else {
      if (r.rows.isEmpty) {
        print('Prestador obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Prestador obra encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
