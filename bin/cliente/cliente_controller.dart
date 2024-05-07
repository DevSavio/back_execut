import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class ClienteController {
  Cliente() {
    print('Cliente');

    // c.database();
  }

  Future<void> create({
    required String nomeCliente,
    required String razaoSocial,
    required String logradouro,
    required String complemento,
    required String cpfCnpj,
    required String telefone,
  }) async {
    String sql =
        "INSERT INTO cliente (nomeCliente, razaoSocial, logradouro, complemento, cpfCnpj, telefone)"
        " VALUES ($nomeCliente, $razaoSocial, $logradouro, $complemento, $cpfCnpj, $telefone);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );

    print('Cliente criado com sucesso!');
  }

  Future<void> update({
    required String nomeCliente,
    required String razaoSocial,
    required String logradouro,
    required String complemento,
    required String cpfCnpj,
    required String telefone,
    required int idCliente,
  }) async {
    String sql =
        "Update cliente set nomeCliente = $nomeCliente, razaoSocial = $razaoSocial, logradouro = $logradouro, complemento = $complemento, cpfCnpj = $cpfCnpj, telefone = $telefone"
        " where idCliente = $idCliente;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Cliente Atualizado com sucesso');
  }

  Future<void> delete({
    required int idCliente,
  }) async {
    String sql = "delete from cliente "
        " where idCliente = $idCliente;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Cliente excluido com sucesso');
  }

  Future<void> readByID({
    required int idCliente,
  }) async {
    String sql = "select *  from cliente  where idCliente = $idCliente;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o cliente');
    } else {
      if (r.rows.isEmpty) {
        print('Cliente não encontrado');
      } else {
        for (var row in r.rows) {
          print('Cliente encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from cliente";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o cliente');
    } else {
      if (r.rows.isEmpty) {
        print('Cliente não encontrado');
      } else {
        for (var row in r.rows) {
          print('Cliente encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from cliente where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o cliente');
    } else {
      if (r.rows.isEmpty) {
        print('Cliente não encontrado');
      } else {
        for (var row in r.rows) {
          print('Cliente encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
