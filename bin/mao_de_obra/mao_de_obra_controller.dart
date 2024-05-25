import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/mao_de_obra_models.dart';

class MaoDeObraController {
  Future<int?> create({
    String? descricao,
    required int idTipo,
    required int idFuncao,
    required int idPrestador,
  }) async {
    try {
      String sql =
        "INSERT INTO mao_de_obra (descricao, idTipo, idFuncao, idPrestador)"
        " VALUES ('$descricao', $idTipo, $idFuncao, $idPrestador);";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );
    
    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Mão de Obra criado com sucesso!');
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
    String? descricao,
    required int idTipo,
    required int idFuncao,
    required int idPrestador,
    required int idMao,
  }) async {
    try {
      String sql =
        "Update mao_de_obra set descricao = '$descricao', idTipo = $idTipo, idTipo = $idTipo, idPrestador = $idPrestador, idFuncao = $idFuncao"
        " where idMao = $idMao;";
    ControllerConnection c = ControllerConnection(); 
    await c.update(
      sql,
    );
    print('Mão de Obra Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idMao,
  }) async {
    try {
      String sql = "delete from mao_de_obra "
        " where idMao = $idMao;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
    
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Mão de Obra excluído com sucesso');
          return idMao;
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

  Future<MaoDeObraModel?> readByID({
    required int idMao
  }) async {
      try {
        String sql = "select * from mao_de_obra  where idMao = $idMao;";
        ControllerConnection c = ControllerConnection();
        IResultSet? r = await c.read(
          sql,
        );

        if (r == null) {
          print('Erro ao buscar Mão de Obra');
          throw ('Erro ao listar Mão de Obra: ResultSet is null');
        } else {
          if (r.rows.isEmpty) {
            print('Mão de Obra não encontrado');
            return null;
          } else {
            Map<String, dynamic> map = r.rows.first.assoc();
              MaoDeObraModel c = MaoDeObraModel(
                idMao: int.parse(map['idMao']!),
                descricao: map['descricao'],
                idFuncao: int.parse(map['idFuncao']!),
                idPrestador: int.parse(map['idPrestador']),
                idTipo: int.parse(map['idTipo']!),
              );
              return c;
          }
        }
      } catch (e) {
        throw('Erro ao listar mão de obra: $e');
      }
    }
  
  Future<List<MaoDeObraModel>> list() async {
    try {
      String sql = "select * from mao_de_obra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o Mão de Obra');
      throw('Erro ao listar mão de obra: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Mão de Obra não encontrado');
        return List<MaoDeObraModel>.empty();
      } else {
        List<MaoDeObraModel> lista = [];
          for (var row in r.rows) {
            print('Mão de Obra encontrado: ${row.typedAssoc()}');
            MaoDeObraModel c = MaoDeObraModel(
              idMao: int.parse(row.assoc()['idMao']!),
              descricao: row.assoc()['descricao']!,
              idPrestador: int.parse(row.assoc()['idPrestador']!),
              idFuncao: int.parse(row.assoc()['idFuncao']!),
              idTipo: int.parse(row.assoc()['idTipo']!),
            );
            lista.add(c);
          }
          return lista;
      }
    }
    } catch (e) {
      throw('Erro ao listar mão de obra: $e');
    }
  }

  Future<List<MaoDeObraModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from mao_de_obra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar Mão de Obra');
      return List<MaoDeObraModel>.empty();
    } else {
      if (r.rows.isEmpty) {
        print('Mão de Obra não encontrado');
        return List<MaoDeObraModel>.empty();
      } else {
        List<MaoDeObraModel> lista = [];
          for (var row in r.rows) {
            print('Mão de Obra encontrado: ${row.typedAssoc()}');
            MaoDeObraModel c = MaoDeObraModel(
              idMao: int.parse(row.assoc()['idMao']!),
              descricao: row.assoc()['descricao']!,
              idPrestador: int.parse(row.assoc()['idPrestador']!),
              idFuncao: int.parse(row.assoc()['idFuncao']!),
              idTipo: int.parse(row.assoc()['idTipo']!),
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
