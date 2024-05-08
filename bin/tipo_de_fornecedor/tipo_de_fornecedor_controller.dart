import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class TipoDeFornecedorController {
  Future<void> create({
    required String nomeTipo,
    required String descricao,
  }) async {
    String sql =
        "INSERT INTO tipo_de_fornecedor (nomeTipo, descricao)"
        " VALUES ($nomeTipo, $descricao);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );

    print('Tipo de fornecedor criado com sucesso!');
  }

  Future<void> update({
    required String nomeTipo,
    required String descricao,
    required int idTipo,
  }) async {
    String sql =
        "Update tipo_de_fornecedor set nomeTipo = $nomeTipo, descricao = $descricao"
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Tipo de fornecedor Atualizado com sucesso');
  }

  Future<void> delete({
    required int idTipo,
  }) async {
    String sql = "delete from tipo_de_fornecedor "
        " where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Tipo de fornecedor excluído com sucesso');
  }

  Future<void> readByID({
    required int idTipo,
  }) async {
    String sql = "select *  from tipo_de_fornecedor  where idTipo = $idTipo;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo de fornecedor');
    } else {
      if (r.rows.isEmpty) {
        print('Tipo de fornecedor não encontrado');
      } else {
        for (var row in r.rows) {
          print('Tipo de fornecedor encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from tipo_de_fornecedor";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo de fornecedor');
    } else {
      if (r.rows.isEmpty) {
        print('Tipo de fornecedor não encontrado');
      } else {
        for (var row in r.rows) {
          print('Tipo de fornecedor encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from tipo_de_fornecedor where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o tipo de fornecedor');
    } else {
      if (r.rows.isEmpty) {
        print('Tipo de fornecedor não encontrado');
      } else {
        for (var row in r.rows) {
          print('Tipo de fornecedor encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
