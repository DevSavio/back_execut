import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/prestador_obra_models.dart';

class PrestadorObraController {
  Future<int?> create({
    required int idPrestador,
    required int idObra,
  }) async {
    try {
      String sql =
        "INSERT INTO prestadorObra (idPrestador, idObra)"
        " VALUES ($idPrestador, $idObra);";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );
    
    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Prestador na obra criado com sucesso!');
          return result.lastInsertID.toInt();
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> update({
    required int idPrestador,
    required int idObra,
    required int idPrestadorObra,
  }) async {
    try {
      String sql =
        "Update prestadorObra set idPrestador = $idPrestador, idObra = $idObra"
        " where idPrestadorObra = $idPrestadorObra;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Prestador da obra Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idPrestadorObra,
  }) async {
    try {
      String sql = "delete from prestadorObra "
        " where idPrestadorObra = $idPrestadorObra;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
    
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Prestador da obra excluído com sucesso');
          return idPrestadorObra;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<PrestadorObraModel?> readByID({
    required int idPrestadorObra,
  }) async {
    try {
      String sql = "select * from prestadorObra  where idPrestadorObra = $idPrestadorObra;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

      if (r == null) {
        print('Erro ao buscar o prestador da obra');
        throw ('Erro ao listar prestadores da obra: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Prestador na obra não encontrado nesta obra');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
          PrestadorObraModel c = PrestadorObraModel(
            idPrestadorObra: int.parse(map['idPrestadorObra']!),
            idObra: int.parse(map['idObra']!),
            idPrestador: int.parse(map['idPrestador']!)
          );

          return c;
        }
      }
    } catch (e) {
      throw('Erro ao listar prestador na obra: $e');
    }
  }

  Future<List<PrestadorObraModel>> list() async {
    try {
      String sql = "select * from prestadorObra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o prestador obra');
      throw ('Erro ao listar prestador na obra: ResultSet is null');
    } else {
      List<PrestadorObraModel> lista = [];
          for (var row in r.rows) {
            print('prestador obra encontrado: ${row.typedAssoc()}');
            PrestadorObraModel c = PrestadorObraModel(
              idPrestadorObra: int.parse(row.assoc()['idPrestadorObra']!),
              idObra: int.parse(row.assoc()['idObra']!),
              idPrestador: int.parse(row.assoc()['idPrrestador']!),
            );
            lista.add(c);
          }
          return lista;
    }
    } catch (e) {
      throw('Erro ao listar prestador obra: $e');
    }
  }

  Future<List<PrestadorObraModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from prestadorObra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
        print('Erro ao buscar o prestador obra');
        return List<PrestadorObraModel>.empty();
      } else {
        if (r.rows.isEmpty) {
          print('prestador obra não encontrado');
          return List<PrestadorObraModel>.empty();
        } else {
          List<PrestadorObraModel> lista = [];
          for (var row in r.rows) {
            print('prestador obra encontrado: ${row.typedAssoc()}');
            PrestadorObraModel c = PrestadorObraModel(
              idPrestadorObra: int.parse(row.assoc()['idPrestadorObra']!),
              idPrestador: int.parse(row.assoc()['idPrestador']!),
              idObra: int.parse(row.assoc()['idObra']!),
            );
            lista.add(c);
          }
          return lista;
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
