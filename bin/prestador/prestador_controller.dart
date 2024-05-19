import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/prestador_models.dart';

class PrestadorController {
  Future<int?> create({
    required String nomePrestador,
    String? tipoPrestador,
    String? cpfCnpj,
    String? telefone,
    required int idFuncao,
  }) async {
    try {
      String sql =
        "INSERT INTO prestador (nomePrestador, tipoPrestador, cpfCnpj, telefone, idFuncao)"
        " VALUES ($nomePrestador, $tipoPrestador, $cpfCnpj, $telefone, $idFuncao);";
      ControllerConnection c = ControllerConnection();
      IResultSet? result = await c.create(
        sql,
      );
      
      if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Prestador criado com sucesso!');
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
    required String nomePrestador,
    String? tipoPrestador,
    String? cpfCnpj,
    String? telefone,
    required int idFuncao,
    required int idPrestador,
  }) async {
    try {
      String sql =
        "Update prestador set nomePrestador = $nomePrestador, cpfCnpj = $cpfCnpj, telefone = $telefone, idFuncao = $idFuncao"
        " where idPrestador = $idPrestador;";
      ControllerConnection c = ControllerConnection();
      await c.update(
        sql,
      );
      print('Prestador Atualizado com sucesso');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idPrestador,
  }) async {
    try {
      String sql = "delete from prestador "
        " where idPrestador = $idPrestador;";
      ControllerConnection c = ControllerConnection();
      IResultSet? i = await c.delete(
        sql,
      );
      
      if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Prestador excluído com sucesso');
          return idPrestador;
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

  Future<PrestadorModel?> readByID({
    required int idPrestador,
  }) async {
    try {
      String sql = "select * from prestador where idPrestador = $idPrestador;";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o prestador');
        throw ('Erro ao listar prestadores: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Prestador não encontrado');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
            PrestadorModel c = PrestadorModel(
              idPrestador: int.parse(map['idPrestador']!),
              nomePrestador: map['nomePrestador']!,
              telefone: map['telefone'] ?? "",
              cpfCnpj: map['cpfCnpj'] ?? "",
              tipoPrestador: map['tipoPrestador'] ?? "",
              idFuncao: int.parse(map['idFuncao']!),
            );

            return c;
        }
      }
    } catch (e) {
      throw('Erro ao lista fornecedores: $e');
    }
  }

  Future<List<PrestadorModel>> list() async {
    String sql = "select *  from prestador";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o prestador');
      throw('Erro ao listar fornecedores: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Prestador não encontrado');
        return List<PrestadorModel>.empty();
      } else {
        List<PrestadorModel> lista = [];
          for (var row in r.rows) {
            print('Prestador encontrado: ${row.typedAssoc()}');
            PrestadorModel c = PrestadorModel(
              idPrestador: int.parse(row.assoc()['idPrestador']!),
              nomePrestador: row.assoc()['nomeCliente']!,
              tipoPrestador: row.assoc()['tipoPrestador'] ?? "",
              cpfCnpj: row.assoc()['cpfCnpj'] ?? "",
              telefone: row.assoc()['telefone'] ?? "",
              idFuncao: int.parse(row.assoc()['idFuncao']!),
            );
            lista.add(c);
          }
          return lista;
      }
    }
  }

  Future<List<PrestadorModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from prestador where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o prestador');
      return List<PrestadorModel>.empty();
    } else {
      if (r.rows.isEmpty) {
        print('Prestador não encontrado');
        return List<PrestadorModel>.empty();
      } else {
        List<PrestadorModel> lista = [];
          for (var row in r.rows) {
            print('Prestador encontrado: ${row.typedAssoc()}');
            PrestadorModel c = PrestadorModel(
              idPrestador: int.parse(row.assoc()['idPrestador']!),
              nomePrestador: row.assoc()['nomeCliente']!,
              tipoPrestador: row.assoc()['tipoPrestador'] ?? "",
              cpfCnpj: row.assoc()['cpfCnpj'] ?? "",
              telefone: row.assoc()['telefone'] ?? "",
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
