import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/pagamento_models.dart';

class PagamentoController {
  Future<int?> create({
    required String tipoPagamento,
    required String moeda,
  }) async {
    try {
      String sql =
        "INSERT INTO pagamento (tipoPagamento, moeda)"
        " VALUES ($tipoPagamento, $moeda);";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );
    
    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Pagamento criado com sucesso!');
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
    required String tipoPagamento,
    required String moeda,
    required int idPagamento,
  }) async {
    try {
      String sql =
        "Update pagamento set tipoPagamento = $tipoPagamento, moeda = $moeda"
        " where idPagamento = $idPagamento;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Pagamento Atualizado com sucesso');
     return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idPagamento
  }) async {
    try {
      String sql = "delete from pagamento"
        " where idPagamento = $idPagamento;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
    
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Pagamento deletado com sucesso');
          return idPagamento;
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

  Future<PagamentoModel?> readByID({
    required int idPagamento,
  }) async {
   try {
      String sql = "select * from pagamento where idPagamento = $idPagamento;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar pagamento');
      throw ('Erro ao listar pagamentos: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Pagamento não encontrado');
        return null;
      } else {
        Map<String, dynamic> map = r.rows.first.assoc();
          PagamentoModel c = PagamentoModel(
            idPagamento: int.parse(map['idPagamento']!),
            tipoPagamento: map['tipoPagamento']!,
            moeda: map['moeda']!,
          );

          return c;
      }
    }
   } catch (e) {
     throw('Erro ao listar pagamentos: $e');
   }
  }

  Future<List<PagamentoModel>> list() async {
    try {
          String sql = "select * from pagamento";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o pagamento');
      throw ('Erro ao listar pagamentos: ResultSet is null');
    } else {
      List<PagamentoModel> lista = [];
        for (var row in r.rows) {
          print('Cliente encontrado: ${row.typedAssoc()}');
          PagamentoModel c = PagamentoModel(
            idPagamento: int.parse(row.assoc()['idPagamento']!),
            tipoPagamento: row.assoc()['tipoPagamento']!,
            moeda: row.assoc()['moeda']!,
          );
          lista.add(c);
        }
        return lista;
    }
    } catch (e) {
      throw('Erro ao listar pagamentos: $e');
    }
  }

  Future<List<PagamentoModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select *  from pagamento where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o pagamento');
      return List<PagamentoModel>.empty();
    } else {
      if (r.rows.isEmpty) {
        print('Pagamento não encontrado');
        return List<PagamentoModel>.empty();
      } else {
        List<PagamentoModel> lista = [];
          for (var row in r.rows) {
            print('Cliente encontrado: ${row.typedAssoc()}');
            PagamentoModel c = PagamentoModel(
              idPagamento: int.parse(row.assoc()['idPagamento']!),
              tipoPagamento: row.assoc()['tipoPagamento']!,
              moeda: row.assoc()['moeda']!,
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
