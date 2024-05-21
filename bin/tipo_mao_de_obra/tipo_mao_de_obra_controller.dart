import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/tipo_mao_de_obra_models.dart';

class TipoMaoDeObraController {
  Future<int?> create({
    required String nomeTipo,
    required String descricao,
  }) async {
    try {
      String sql =
        "INSERT INTO tipo_mao_de_obra (nomeTipo, descricao)"
        " VALUES ($nomeTipo, $descricao);";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );

    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Tipo mão de obra criado com sucesso!');
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
    required String descricao,
    required int idTipo,
  }) async {
    try {
      String sql =
        "Update tipo_mao_de_obra set nomeTipo = $nomeTipo, descricao = $descricao"
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Tipo mão de obra Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idTipo,
  }) async {
    try {
      String sql = "delete from tipo_mao_de_obra "
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
    
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Tipo mão de obra excluido com sucesso');
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

  Future<TipoMaoDeObraModel?> readByID({
    required int idTipo,
  }) async {
    try {
        String sql = "select * from tipo_mao_de_obra  where idTipo = $idTipo;";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o tipo mão de obra');
        throw ('Erro ao listar clientes: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Tipo mão de obra não encontrado');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
            TipoMaoDeObraModel c = TipoMaoDeObraModel(
              idTipo: int.parse(map['idTipo']!),
              nomeTipo: map['nomeTipo']!,
              descricao: map['descricao']!,
            );

            return c;
        }
      }
    } catch (e) {
      throw('Erro ao listar Tipo mão de obra: $e');
    }
  }

  Future<List<TipoMaoDeObraModel>> list() async {
    try {
      String sql = "select *  from tipo_mao_de_obra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo mão de obra');
      throw ('Erro ao listar tipo mão de obra: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Tipo mão de obra não encontrado');
        return List<TipoMaoDeObraModel>.empty();
      } else {
        List<TipoMaoDeObraModel> lista = [];
          for (var row in r.rows) {
            print('Cliente encontrado: ${row.typedAssoc()}');
            TipoMaoDeObraModel c = TipoMaoDeObraModel(
              idTipo: int.parse(row.assoc()['idTipo']!),
              nomeTipo: row.assoc()['nomeTipo']!,
              descricao: row.assoc()['descricao']!,
            );
            lista.add(c);
          }
          return lista;
      }
    }
    } catch (e) {
      throw ('Erro ao listar tipo mão de obra: $e');
    }
  }

  Future<List<TipoMaoDeObraModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
        try {
            String sql = "select *  from tipo_mao_de_obra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo mão de obra');
      return List<TipoMaoDeObraModel>.empty();
    } else {
      if (r.rows.isEmpty) {
        print('Tipo mão de obra não encontrado');
        return List<TipoMaoDeObraModel>.empty();
      } else {
        List<TipoMaoDeObraModel> lista = [];
          for (var row in r.rows) {
            print('Cliente encontrado: ${row.typedAssoc()}');
            TipoMaoDeObraModel c = TipoMaoDeObraModel(
              idTipo: int.parse(row.assoc()['idTipo']!),
              nomeTipo: row.assoc()['nomeTipo']!,
              descricao: row.assoc()['descricao']!,
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
