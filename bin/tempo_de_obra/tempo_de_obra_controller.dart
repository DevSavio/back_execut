import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/tempo_de_obra_models.dart';

class TempoDeObraController {
  Future<int?> create({
    required String nomeTempo,
  }) async {
    try {
      String sql =
        "INSERT INTO tempo_de_obra (nomeTempo)"
        " VALUES ($nomeTempo);";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );

    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Tempo de obra criado com sucesso!');
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
    required String nomeTempo,
    required int idTempo,
  }) async {
    try {
      String sql =
        "Update tempo_de_obra set nomeTempo = $nomeTempo"
        " where idTempo = $idTempo;";
      ControllerConnection c = ControllerConnection();
      await c.update(
        sql,
      );
      print('Tempo de obra Atualizado com sucesso');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idTempo,
  }) async {
    try {
      String sql = "delete from tempo_de_obra "
        " where idTempo = $idTempo;";
      ControllerConnection c = ControllerConnection();
      IResultSet? i = await c.delete(
        sql,
      );
      
      if (i != null) {
          if (i.affectedRows >= BigInt.one) {
            print('Tempo mão de obra excluido com sucesso');
            return idTempo;
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

  Future<TempoDeObraModel?> readByID({
    required int idTempo,
  }) async {
      try {
        String sql = "select *  from tempo_de_obra  where idTempo = $idTempo;";
        ControllerConnection c = ControllerConnection();
        IResultSet? r = await c.read(
          sql,
        );

        if (r == null) {
          print('Erro ao buscar o tempo de obra');
          throw ('Erro ao listar tempo de obra: ResultSet is null');
        } else {
          if (r.rows.isEmpty) {
            print('Tempo de obra não encontrado');
            return null;
          } else {
            Map<String, dynamic> map = r.rows.first.assoc();
            TempoDeObraModel c = TempoDeObraModel(
              idTempo: int.parse(map['idTempo']!),
              nomeTempo: map['nomeTempo']!,
            );

            return c;
          }
        } 
      }catch (e) {
        throw ('Erro ao listar tempo de obra: $e');
      }
    }

  Future<List<TempoDeObraModel>> list() async {
    try {
      String sql = "select * from tempo_de_obra";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
          print('Erro ao buscar o tempo de obra');
          throw ('Erro ao listar tempo de obras: ResultSet is null');
        } else {
          if (r.rows.isEmpty) {
            print('Tempo de obra não encontrado');
            return List<TempoDeObraModel>.empty();
          } else {
            List<TempoDeObraModel> lista = [];
            for (var row in r.rows) {
              print('Tempo de obra encontrado: ${row.typedAssoc()}');
              TempoDeObraModel c = TempoDeObraModel(
                idTempo: int.parse(row.assoc()['idTempo']!),
                nomeTempo: row.assoc()['nomeTempo']!,
              );
              lista.add(c);
            }
            return lista;
          }
      }
    } catch (e) {
      throw('Erro ao listar tempo de obra');
    }
  }

  Future<List<TempoDeObraModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
     try {
        String sql = "select *  from tempo_de_obra where $paramter $operator $value";
        ControllerConnection c = ControllerConnection();
        IResultSet? r = await c.read(
          sql,
        );

      if (r == null) {
        print('Erro ao buscar o tempo de obra');
        throw ('Erro ao listar tempo de obras: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Tempo de obra não encontrado');
          return List<TempoDeObraModel>.empty();
        } else {
          List<TempoDeObraModel> lista = [];
          for (var row in r.rows) {
            print('Tempo de obra encontrado: ${row.typedAssoc()}');
            TempoDeObraModel c = TempoDeObraModel(
              idTempo: int.parse(row.assoc()['idTempo']!),
              nomeTempo: row.assoc()['nomeTempo']!,
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
