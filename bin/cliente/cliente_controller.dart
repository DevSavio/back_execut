import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/cliente_models.dart';

class ClienteController {
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

  Future<List<ClienteModel>> list() async {
    try {
      String sql = "select *  from cliente";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o cliente');
      throw('Erro ao listar clientes: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Cliente não encontrado');
        return List<ClienteModel>.empty();
      } else {
        List<ClienteModel> lista = [];
        for (var row in r.rows) {
          print('Cliente encontrado: ${row.typedAssoc()}');
          ClienteModel c = ClienteModel(
            idCliente: int.parse(row.assoc()['idCliente']!), 
            nomeCliente: row.assoc()['nomeCliente']!, 
            razaoSocial: row.assoc()['razaoSocial']!, 
            logradouro: row.assoc()['logradouro']??"", 
            cpfCnpj: row.assoc()['cpfCnpj']!);
          lista.add(c);
        }
        return lista;
      }
    }
    
    } catch (e) {
      throw('Erro ao listar clientes: $e');
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
