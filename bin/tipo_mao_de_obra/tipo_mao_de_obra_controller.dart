import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/tipo_de_obra_models.dart';

class TipoDeObraController {
  Future<int?> create({
    required String nomeTipo,
    required String descricaoTipo,
  }) async {
    try {
      String sql =
        "INSERT INTO tipo_de_obra (nomeTipo, descricao)"
        " VALUES ('$nomeTipo', '$descricaoTipo');";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );

    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Tipo de obra criado com sucesso!');
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
    required String nomeTipo,
    required String descricaoTipo,
    required int idTipo,
  }) async {
    try {
      String sql =
        "Update tipo_de_obra set nomeTipo = '$nomeTipo', descricaoTipo = '$descricaoTipo'"
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Tipo de obra Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idTipo,
  }) async {
    try {
      String sql = "delete from tipo_de_obra "
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
    
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Tipo de obra excluido com sucesso');
          return idTipo;
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

  Future<TipoDeObraModel?> readByID({
    required int idTipo,
  }) async {
    try {
        String sql = "select * from tipo_de_obra  where idTipo = $idTipo;";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o tipo de obra');
        throw ('Erro ao listar tipo de obra: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Tipo de obra não encontrado');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
            TipoDeObraModel c = TipoDeObraModel(
              idTipo: int.parse(map['idTipo']!),
              nomeTipo: map['nomeTipo']!,
              descricaoTipo: map['descricaoTipo']!,
            );

            return c;
        }
      }
    } catch (e) {
      throw('Erro ao listar Tipo de obra: $e');
    }
  }

  Future<List<TipoDeObraModel>> list() async {
    try {
      String sql = "select *  from tipo_de_obra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo de obra');
      throw ('Erro ao listar tipo de obra: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Tipo de obra não encontrado');
        return List<TipoDeObraModel>.empty();
      } else {
        List<TipoDeObraModel> lista = [];
          for (var row in r.rows) {
            print('Tipo de obra encontrado: ${row.typedAssoc()}');
            TipoDeObraModel c = TipoDeObraModel(
              idTipo: int.parse(row.assoc()['idTipo']!),
              nomeTipo: row.assoc()['nomeTipo']!,
              descricaoTipo: row.assoc()['descricaoTipo']!,
            );
            lista.add(c);
          }
          return lista;
      }
    }
    } catch (e) {
      throw ('Erro ao listar tipo de obra: $e');
    }
  }

  Future<List<TipoDeObraModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
        try {
            String sql = "select *  from tipo_de_obra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo de obra');
      return List<TipoDeObraModel>.empty();
    } else {
      if (r.rows.isEmpty) {
        print('Tipo de obra não encontrado');
        return List<TipoDeObraModel>.empty();
      } else {
        List<TipoDeObraModel> lista = [];
          for (var row in r.rows) {
            print('Tipo de obra encontrado: ${row.typedAssoc()}');
            TipoDeObraModel c = TipoDeObraModel(
              idTipo: int.parse(row.assoc()['idTipo']!),
              nomeTipo: row.assoc()['nomeTipo']!,
              descricaoTipo: row.assoc()['descricaoTipo']!,
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
