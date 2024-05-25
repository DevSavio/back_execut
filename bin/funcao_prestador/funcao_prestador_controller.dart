import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/funcao_prestador_models.dart';

class FuncaoPrestadorController {
  Future<int?> create({
    required String nomeFuncao,
    required String descricaoFuncao,
  }) async {
    try {
      String sql =
        "INSERT INTO funcao_prestador (nomeFuncao, descricaoFuncao)"
        " VALUES ('$nomeFuncao', '$descricaoFuncao');";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );
    
    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Função prestador criado com sucesso!');
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
    required String nomeFuncao,
    required String descricaoFuncao,
    required int idFuncao,
  }) async {
    try {
      String sql =
        "Update funcao_prestador set nomeFuncao = '$nomeFuncao', descricaoFuncao = '$descricaoFuncao'"
        " where idFuncao = $idFuncao;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Função prestador Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idFuncao,
  }) async {
    try {
      String sql = "delete from funcao_prestador "
        " where idFuncao = $idFuncao;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
    
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Função prestador excluido com sucesso');
          return idFuncao;
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

  Future<FuncaoPrestadorModel?> readByID({
    required int idFuncao,
  }) async {
    try {
      String sql = "select * from funcao_prestador  where idFuncao = $idFuncao;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
        print('Erro ao buscar o função prestador');
        throw ('Erro ao listar função prestador: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Função prestador não encontrado');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
          FuncaoPrestadorModel c = FuncaoPrestadorModel(
            idFuncao: int.parse(map['idFuncao']!),
            descricaoFuncao: map['descricaoFuncao']!,
            nomeFuncao: map['nomeFuncao']!,
          );

          return c;
        }
      }
    } catch (e) {
      throw('Erro ao listar função prestador: $e');
    }
  }

  Future<List<FuncaoPrestadorModel>> list() async {
    try {
        String sql = "select * from funcao_prestador";
        ControllerConnection c = ControllerConnection();
        IResultSet? r = await c.read(
          sql,
        );

      if (r == null) {
          print('Erro ao buscar o função prestador');
          throw ('Erro ao listarfunção prestadores: ResultSet is null');
        } else {
          if (r.rows.isEmpty) {
            print('Função prestador não encontrado');
            return List<FuncaoPrestadorModel>.empty();
          } else {
            List<FuncaoPrestadorModel> lista = [];
            for (var row in r.rows) {
              print('Função prestador encontrado: ${row.typedAssoc()}');
              FuncaoPrestadorModel c = FuncaoPrestadorModel(
                idFuncao: int.parse(row.assoc()['idFuncao']!),
                nomeFuncao: row.assoc()['nomeFuncao']!,
                descricaoFuncao: row.assoc()['descricaoFuncao']!,
              );
              lista.add(c);
            }
            return lista;
          }
        }
      } catch (e) {
        throw('Erro ao listar função prestador');
      }
  }

  Future<List<FuncaoPrestadorModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from funcao_prestador where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

        if (r == null) {
        print('Erro ao buscar o cliente');
        return List<FuncaoPrestadorModel>.empty();
      } else {
        if (r.rows.isEmpty) {
          print('Cliente não encontrado');
          return List<FuncaoPrestadorModel>.empty();
        } else {
          List<FuncaoPrestadorModel> lista = [];
          for (var row in r.rows) {
            print('Cliente encontrado: ${row.typedAssoc()}');
            FuncaoPrestadorModel c = FuncaoPrestadorModel(
              idFuncao: int.parse(row.assoc()['idFuncao']!),
              nomeFuncao: row.assoc()['nomeFuncao']!,
              descricaoFuncao: row.assoc()['descricaoFuncao']!,
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
