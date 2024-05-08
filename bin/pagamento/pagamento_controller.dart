import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class PagamentoController {
  Future<void> create({
    required String tipoPagamento,
    required String moeda,
  }) async {
    String sql =
        "INSERT INTO pagamento (tipoPagamento, moeda)"
        " VALUES ($tipoPagamento, $moeda);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );
    print('Pagamento criado com sucesso!');
  }

  Future<void> update({
    required String tipoPagamento,
    required String moeda,
    required int idPagamento,
  }) async {
    String sql =
        "Update pagamento set tipoPagamento = $tipoPagamento, moeda = $moeda"
        " where idPagamento = $idPagamento;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Pagamento Atualizado com sucesso');
  }

  Future<void> delete({
    required int idPagamento
  }) async {
    String sql = "delete from pagamento"
        " where idPagamento = $idPagamento;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Pagamento excluído com sucesso');
  }

  Future<void> readByID({
    required int idPagamento,
  }) async {
    String sql = "select *  from pagamento  where idPagamento = $idPagamento;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar pagamento');
    } else {
      if (r.rows.isEmpty) {
        print('Pagamento não encontrado');
      } else {
        for (var row in r.rows) {
          print('Pagamento encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from pagamento";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o pagamento');
    } else {
      if (r.rows.isEmpty) {
        print('Pagamento não encontrado');
      } else {
        for (var row in r.rows) {
          print('Pagamento encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from pagamento where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o pagamento');
    } else {
      if (r.rows.isEmpty) {
        print('Pagamento não encontrado');
      } else {
        for (var row in r.rows) {
          print('Pagamento encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
