import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/cliente_models.dart';
import '../models/endereco_models.dart';

class ClienteController {
  Future<int?> create(
      {required String nomeCliente,
      required String razaoSocial,
      required String cpfCnpj,
      required String telefone,
      required int idEndereco}) async {
    try {
      String sql =
          "INSERT INTO cliente (nomeCliente, razaoSocial, cpfCnpj, telefone, idEndereco)"
          " VALUES ('$nomeCliente', '$razaoSocial','$cpfCnpj', '$telefone', '$idEndereco');";
      ControllerConnection c = ControllerConnection();
      IResultSet? result = await c.create(
        sql,
      );

      if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Cliente criado com sucesso!');
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

  Future<int?> createClienteEndereco({
    required String nomeCliente,
    required String razaoSocial,
    required String cpfCnpj,
    required String telefone,
    required String logradouro,
    required String complemento,
    required String cidade,
    required String estado,
  }) async {
    try {
      EnderecoController enderecoController = EnderecoController();
      int? inserted = await enderecoController.create(
          logradouro: logradouro,
          complemento: complemento,
          cidade: cidade,
          estado: estado);
      String sql =
          "INSERT INTO cliente (nomeCliente, razaoSocial, cpfCnpj, telefone, idEndereco)"
          " VALUES ('$nomeCliente', '$razaoSocial','$cpfCnpj', '$telefone', '$inserted');";
      ControllerConnection c = ControllerConnection();
      IResultSet? result = await c.create(
        sql,
      );

      if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Cliente criado com sucesso!');
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

  Future<bool> update(
      {required String nomeCliente,
      required String razaoSocial,
      required String cpfCnpj,
      required String telefone,
      required int idCliente,
      required int idEndereco}) async {
    try {
      String sql = "Update cliente set nomeCliente = '$nomeCliente', "
          " razaoSocial = '$razaoSocial', endereco = '$idEndereco', cpfCnpj = '$cpfCnpj', telefone = '$telefone'"
          " where idCliente = $idCliente;";
      ControllerConnection c = ControllerConnection();

      await c.update(
        sql,
      );

      print('Cliente Atualizado com sucesso');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idCliente,
  }) async {
    try {
      String sql = "delete from cliente "
          " where idCliente = $idCliente;";
      ControllerConnection c = ControllerConnection();
      IResultSet? i = await c.delete(
        sql,
      );
      if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Cliente deletado com sucesso');
          return idCliente;
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

  Future<ClienteModel?> readByID({
    required int idCliente,
  }) async {
    try {
      String sql =
          "select c.idCliente, c.nomeCliente, c.razaoSocial , c.cpfCnpj, c.telefone, e.id, e.logradouro, e.complemento, e.cidade, e.estado from cliente  as c inner join endereco as e on  e.id =  c.idEndereco where idCliente = $idCliente;";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o cliente');
        throw ('Erro ao listar clientes: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Cliente não encontrado');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
          ClienteModel c = ClienteModel(
            idCliente: int.parse(map['idCliente']!),
            nomeCliente: map['nomeCliente']!,
            razaoSocial: map['razaoSocial']!,
            cpfCnpj: map['cpfCnpj']!,
            telefone: map['telefone']!,
            endereco: EnderecoModel(
              idEndereco: int.parse(map['id']!),
              logradouro: map['logradouro']!,
              complemento: map['complemento']!,
              cidade: map['cidade']!,
              estado: map['estado']!,
            ),
          );

          return c;
        }
      }
    } catch (e) {
      throw ('Erro ao listar clientes: $e');
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
        throw ('Erro ao listar clientes: ResultSet is null');
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
              cpfCnpj: row.assoc()['cpfCnpj']!,
              telefone: row.assoc()['telefone']!,
              endereco: EnderecoModel(
                idEndereco: int.parse(row.assoc()['idEndereco']!),
                logradouro: row.assoc()['logradouro']!,
                complemento: row.assoc()['complemento']!,
                cidade: row.assoc()['cidade']!,
                estado: row.assoc()['estado']!,
              ),
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

  Future<List<ClienteModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from cliente where $paramter $operator $value";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o cliente');
        return List<ClienteModel>.empty();
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
              cpfCnpj: row.assoc()['cpfCnpj']!,
              telefone: row.assoc()['telefone']!,
              endereco: EnderecoModel(
                idEndereco: int.parse(row.assoc()['idEndereco']!),
                logradouro: row.assoc()['logradouro']!,
                complemento: row.assoc()['complemento']!,
                cidade: row.assoc()['cidade']!,
                estado: row.assoc()['estado']!,
              ),
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
