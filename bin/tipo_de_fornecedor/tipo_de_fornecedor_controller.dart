import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/tipo_de_fornecedor_models.dart';

class TipoDeFornecedorController {
  Future<int?> create({
    required String nomeTipo,
    required String descricao,
  }) async {
    try {
      String sql =
        "INSERT INTO tipo_de_fornecedor (nomeTipo, descricao)"
        " VALUES ('$nomeTipo', '$descricao');";
      ControllerConnection c = ControllerConnection();
      IResultSet? result = await c.create(
        sql,
      );

      if (result != null) {
          if (result.affectedRows >= BigInt.one) {
            print('Tipo de fornecedor criado com sucesso!');
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
        "Update tipo_de_fornecedor set nomeTipo = '$nomeTipo', descricao = '$descricao'"
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Tipo de fornecedor Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idTipo,
  }) async {
    try {
      String sql = "delete from tipo_de_fornecedor "
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
    
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Tipo de fornecedor excluído com sucesso');
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

  Future<TipoDeFornecedorModel?> readByID({
    required int idTipo,
  }) async {
    String sql = "select * from tipo_de_fornecedor  where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
        print('Erro ao buscar o Tipo de fornecedor');
        throw ('Erro ao listar Tipo de fornecedores: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Tipo de fornecedor não encontrado');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
          TipoDeFornecedorModel c = TipoDeFornecedorModel(
            idTipo: int.parse(map['idTipo']!),
            nomeTipo: map['nomeTipo']!,
            descricao: map['descricao']!
          );

          return c;
        }
      }
  }

  Future<List<TipoDeFornecedorModel>> list() async {
    try {
      String sql = "select * from tipo_de_fornecedor";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

          if (r == null) {
        print('Erro ao buscar o Tipo de fornecedor');
        throw ('Erro ao listar Tipo de fornecedores: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Tipo de fornecedor não encontrado');
          return List<TipoDeFornecedorModel>.empty();
        } else {
          List<TipoDeFornecedorModel> lista = [];
          for (var row in r.rows) {
            print('Tipo de fornecedor encontrado: ${row.typedAssoc()}');
            TipoDeFornecedorModel c = TipoDeFornecedorModel(
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
      throw('Erro ao listar Tipo de Fornecedor: $e');
    }
  }

  Future<List<TipoDeFornecedorModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select *  from tipo_de_fornecedor where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
        print('Erro ao buscar o Tipo de fornecedor');
        return List<TipoDeFornecedorModel>.empty();
      } else {
        if (r.rows.isEmpty) {
          print('Tipo de fornecedor não encontrado');
          return List<TipoDeFornecedorModel>.empty();
        } else {
          List<TipoDeFornecedorModel> lista = [];
          for (var row in r.rows) {
            print('Tipo de fornecedor encontrado: ${row.typedAssoc()}');
            TipoDeFornecedorModel c = TipoDeFornecedorModel(
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
