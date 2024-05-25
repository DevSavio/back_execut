import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/fornecedor_models.dart';

class FornecedorController {
  Future<int?> create({
    required String razaoSocial,
    required String logradouro,
    required String complemento,
    required String telefone,
    required int idTipo,
  }) async {
    try {
      String sql =
        "INSERT INTO fornecedor (razaoSocial, logradouro, complemento, telefone, idTipo)"
        " VALUES ('$razaoSocial', '$logradouro', '$complemento', '$telefone', $idTipo)";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
        sql,
      );
    
    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Fornecedor criado com sucesso!');
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
    required String razaoSocial,
    required String logradouro,
    String? complemento,
    required String telefone,
    required int idTipo,
    required int idFornecedor,
  }) async {
    try {
      String sql =
        "Update fornecedor set razaoSocial = '$razaoSocial', logradouro = '$logradouro', complemento = '$complemento', telefone = '$telefone', idTipo= $idTipo"
        " where idFornecedor = $idFornecedor;";
      ControllerConnection c = ControllerConnection();
      await c.update(
        sql,
      );
      print('Fornecedor Atualizado com sucesso');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idFornecedor,
  }) async {
    try {
      String sql = "delete from fornecedor "
        " where idFornecedor = $idFornecedor;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
        sql,
      );
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
           print('Fornecedor excluído com sucesso');
          return idFornecedor;
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

  Future<FornecedorModel?> readByID({
    required int idFornecedor,
  }) async {
    try {
      String sql = "select *  from fornecedor  where idFornecedor = $idFornecedor;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o fornecedor');
      throw ('Erro ao listar fornecedor: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Fornecedor não encontrado');
        return null;
      } else {
        Map<String, dynamic> map = r.rows.first.assoc();
          FornecedorModel c = FornecedorModel(
            idFornecedor: int.parse(map['idCliente']!),
            razaoSocial: map['razaoSocial']!,
            logradouro: map['logradouro']!,
            complemento: map['complemento'] ?? "",
            idTipo: map['idTipo']!,
            telefone: map['telefone']!,
          );

          return c;
        }
      }
    } catch (e) {
      throw ('Erro ao listar fornecedor: $e');
    }
  }

  Future<List<FornecedorModel>> list() async {
    try {
      String sql = "select *  from fornecedor";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o fornecedor');
        throw ('Erro ao listar fornecedores: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Fornecedor não encontrado');
          return List<FornecedorModel>.empty();
        } else {
          List<FornecedorModel> lista = [];
          for (var row in r.rows) {
            print('Fornecedor encontrado: ${row.typedAssoc()}');
            FornecedorModel c = FornecedorModel(
              idFornecedor:  int.parse(row.assoc()['idFornecedor']!),
              razaoSocial: row.assoc()['razaoSocial']!,
              logradouro: row.assoc()['logradouro']!,
              complemento: row.assoc()['complemento'] ?? "",
              idTipo: int.parse(row.assoc()['idTipo']!),
              telefone: row.assoc()['telefone']!,
            );
            lista.add(c);
          }
          return lista;
        }
      }
    } catch (e) {
      throw ('Erro ao listar clientes: $e');
    }
  }

  Future<List<FornecedorModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select *  from fornecedor where $paramter $operator $value";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o fornecedor');
        return List<FornecedorModel>.empty();
      } else {
        if (r.rows.isEmpty) {
          print('Fornecedor não encontrado');
          return List<FornecedorModel>.empty();
        } else {
          List<FornecedorModel> lista = [];
          for (var row in r.rows) {
            print('Fornecedor encontrado: ${row.typedAssoc()}');
            FornecedorModel c = FornecedorModel(
              idFornecedor:  int.parse(row.assoc()['idFornecedor']!),
              razaoSocial: row.assoc()['razaoSocial']!,
              logradouro: row.assoc()['logradouro']!,
              complemento: row.assoc()['complemento'] ?? "",
              idTipo: int.parse(row.assoc()['idTipo']!),
              telefone: row.assoc()['telefone']!,
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
