import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class FornecedorController {
  Future<void> create({
    required String nomeUsuario,
    required String razaoSocial,
    required String logradouro,
    required String complemento,
    required String telefone,
    required int idTipo,
  }) async {
    String sql =
        "INSERT INTO fornecedor (razaoSocial, logradouro, complemento, telefone, idTipo)"
        " VALUES ($razaoSocial, $logradouro, $complemento, $telefone, $idTipo)";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );
    print('Fornecedor criado com sucesso!');
  }

  Future<void> update({
    required String razaoSocial,
    required String logradouro,
    required String complemento,
    required String telefone,
    required int idTipo,
    required int idFornecedor,
  }) async {
    String sql =
        "Update fornecedor set razaoSocial = $razaoSocial, logradouro = $logradouro, complemento = $complemento, telefone = $telefone, idTipo= $idTipo"
        " where idFornecedor = $idFornecedor;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Fornecedor Atualizado com sucesso');
  }

  Future<void> delete({
    required int idFornecedor,
  }) async {
    String sql = "delete from fornecedor "
        " where idFornecedor = $idFornecedor;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Fornecedor excluído com sucesso');
  }

  Future<void> readByID({
    required int idFornecedor,
  }) async {
    String sql = "select *  from usuario  where idFornecedor = $idFornecedor;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o fornecedor');
    } else {
      if (r.rows.isEmpty) {
        print('Fornecedor não encontrado');
      } else {
        for (var row in r.rows) {
          print('Fornecedor encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from fornecedor";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o fornecedor');
    } else {
      if (r.rows.isEmpty) {
        print('Fornecedor não encontrado');
      } else {
        for (var row in r.rows) {
          print('Fornecedor encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from fornecedor where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o fornecedor');
    } else {
      if (r.rows.isEmpty) {
        print('Fornecedor não encontrado');
      } else {
        for (var row in r.rows) {
          print('Fornecedor encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
