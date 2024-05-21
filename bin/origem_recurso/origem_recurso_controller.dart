import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/origem_recurso_models.dart';

class OrigemRecursoController {
  Future<int?> create({
    required String tipoOrigem,
    double? percentual,
  }) async {
    try {
      String sql =
        "INSERT INTO origem_recurso (tipoOrigem, percentual)"
        " VALUES ($tipoOrigem, $percentual);";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );

    if (result != null) {
      if (result.affectedRows >= BigInt.one) {
        print('Origem recurso criado com sucesso!');
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
    required String tipoOrigem,
    double? percentual,
    required int idOrigem,
  }) async {
    try {
      String sql =
        "Update origem_recurso set tipoOrigem = $tipoOrigem, percentual = $percentual"
        " where idOrigem = $idOrigem;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    
    print('Origem recurso Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idOrigem,
  }) async {
    try {
      String sql = "delete from origem_recurso "
        "where idOrigem = $idOrigem;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
   
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Origem Recurso deletado com sucesso');
          return idOrigem;
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

  Future<OrigemRecursoModel?> readByID({
    required int idOrigem,
  }) async {
    try {
      String sql = "select *  from origem_recurso  where idOrigem = $idOrigem;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar origem recurso');
      throw ('Erro ao listar origem recurso: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Origem recurso não encontrado');
        return null;
      } else {
        Map<String, dynamic> map = r.rows.first.assoc();
          OrigemRecursoModel c = OrigemRecursoModel(
            idOrigem: int.parse(map['idOrigem']!),
            tipoOrigem: map['tipoOrigem']!,
            percentual: double.parse(map['razaoSocial']),
          );

          return c;
      }
    }
    } catch (e) {
      throw('Erro ao listar Origem recurso: $e');
    }
  }

  Future<List<OrigemRecursoModel>> list() async {
    try {
      String sql = "select *  from origem_recurso";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o origem recurso');
        throw ('Erro ao listar Origem Recurso: ResultSet is null');
      } else {
        if(r.rows.isEmpty){
        print('Origem recurso não encontrado');
        return List<OrigemRecursoModel>.empty();
        } else {
          List<OrigemRecursoModel> lista = [];
            for (var row in r.rows) {
              print('Cliente encontrado: ${row.typedAssoc()}');
              OrigemRecursoModel c = OrigemRecursoModel(
                idOrigem: int.parse(row.assoc()['idOrigem']!),
                tipoOrigem: row.assoc()['tipoOrigem']!,
                percentual: double.parse(row.assoc()['percentual']!),
              );
              lista.add(c);
            }
            return lista;
        }    
      }
    } catch (e) {
      throw('Erro ao listar Origem Recurso: $e');
    }
  }
  
  Future<List<OrigemRecursoModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from origem_recurso where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
        print('Erro ao buscar o cliente');
        return List<OrigemRecursoModel>.empty();
      } else {
        if (r.rows.isEmpty) {
          print('Cliente não encontrado');
          return List<OrigemRecursoModel>.empty();
        } else {
          List<OrigemRecursoModel> lista = [];
          for (var row in r.rows) {
            print('Origem Recurso encontrado: ${row.typedAssoc()}');
            OrigemRecursoModel c = OrigemRecursoModel(
              idOrigem: int.parse(row.assoc()['idOrigem']!),
                tipoOrigem: row.assoc()['tipoOrigem']!,
                percentual: double.parse(row.assoc()['percentual']!),
            );
            lista.add(c);
          }
          return lista;
        }
      }
  }
}
