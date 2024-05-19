import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/custo_prestador_models.dart';

class CustoPrestadorController {
  Future<int?> create({
    required double valor,
    required int idPrestador,
    required int idFuncao,
  }) async {
    try {
      String sql =
        "INSERT INTO custo_prestador (valor, idPrestador, idFuncao)"
        " VALUES ($valor, $idPrestador, $idFuncao)";
      ControllerConnection c = ControllerConnection();
      IResultSet? result = await c.create(
        sql,
      );

      if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Custo Prestador criado com sucesso!');
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
    required double valor,
    required int idPrestador,
    required int idFuncao,
    required int idCusto,
  }) async {
    try {
      String sql =
        "Update custo_prestador set valor = $valor, idPrestador = $idPrestador, idFuncao = $idFuncao"
        " where idCusto = $idCusto;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Custo prestador Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idCusto,
  }) async {
    try {
      String sql = "delete from custo_prestador "
        "where idCusto = $idCusto;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );

    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Custo prestador excluído com sucesso');
          return idCusto;
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

  Future<CustoPrestadorModel?> readByID({
    required int idCusto,
  }) async {
    try {
      String sql = "select * from custo_prestador where idCusto = $idCusto;";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o custo prestador');
        throw ('Erro ao listar custo prestador: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Custo prestador não encontrado');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
            CustoPrestadorModel c = CustoPrestadorModel(
              idCusto: int.parse(map['idCusto']!),
              valor: double.parse(map['valor']!),
              idPrestador: int.parse(map['idPrestador']!),
              idFuncao: int.parse(map['idFuncao']!),
            );

            return c;
        }
      }
    } catch (e) {
      throw ('Erro ao listar custo prestador: $e');
    }
  }

  Future<List<CustoPrestadorModel>> list() async {
    try {
      String sql = "select *  from custo_prestador";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o custo prestador');
        throw('Erro ao listar custo prestador: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Custo prestador não encontrado');
          return List<CustoPrestadorModel>.empty();
        } else {
          List<CustoPrestadorModel> lista = [];
          for (var row in r.rows) {
            print('Cliente encontrado: ${row.typedAssoc()}');
            CustoPrestadorModel c = CustoPrestadorModel(
              idCusto: int.parse(row.assoc()['idCusto']!),
              valor: double.parse(row.assoc()['valor']!),
              idPrestador: int.parse(row.assoc()['idPrestador']!),
              idFuncao: int.parse(row.assoc()['idFuncao']!),
            );
            lista.add(c);
          }
          return lista;
        }
      }
    } catch (e) {
      throw('Erro ao listar custo prestador: $e');
    }
  }

  Future<List<CustoPrestadorModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from custo_prestador where $paramter $operator $value";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o custo prestador');
        return List<CustoPrestadorModel>.empty();
      } else {
        if (r.rows.isEmpty) {
          print('Custo prestador não encontrado');
          return List<CustoPrestadorModel>.empty();
        } else {
         List<CustoPrestadorModel> lista = [];
          for (var row in r.rows) {
            print('Cliente encontrado: ${row.typedAssoc()}');
            CustoPrestadorModel c = CustoPrestadorModel(
              idCusto: int.parse(row.assoc()['idCusto']!),
              valor: double.parse(row.assoc()['valor']!),
              idPrestador: int.parse(row.assoc()['idPrestador']!),
              idFuncao: int.parse(row.assoc()['idFuncao']!),
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