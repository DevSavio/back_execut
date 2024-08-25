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
      String sql =
          "select idCliente, nomeCliente, razaoSocial, cpfCnpj, telefone, endereco.id as 'idEndereco', endereco.logradouro, endereco.complemento, endereco.cidade, endereco.estado from cliente left join endereco on cliente.idCliente = endereco.id";
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
            var x = row.assoc();
            ClienteModel cli = ClienteModel(
              idCliente: int.parse(x['idCliente']!),
              nomeCliente: x['nomeCliente']!,
              razaoSocial: x['razaoSocial']!,
              cpfCnpj: x['cpfCnpj']!,
              telefone: x['telefone']!,
              endereco: EnderecoModel(
                idEndereco: int.parse(x['idEndereco']!),
                logradouro: x['logradouro'],
                complemento: x['complemento'],
                cidade: x['cidade'],
                estado: x['estado'],
              ),
            );
            lista.add(cli);
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
      String sql =
          "select idCliente, nomeCliente, razaoSocial, cpfCnpj, telefone, endereco.logradouro, endereco.complemento, endereco.cidade, endereco.estado from cliente inner join endereco on cliente.idCliente = endereco.id where $paramter $operator $value";
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
            var x = row.assoc();
            ClienteModel c = ClienteModel(
              idCliente: int.parse(x['idCliente']!),
              nomeCliente: x['nomeCliente']!,
              razaoSocial: x['razaoSocial']!,
              cpfCnpj: x['cpfCnpj']!,
              telefone: x['telefone']!,
              endereco: EnderecoModel(
                idEndereco: int.parse(x['idEndereco']!),
                logradouro: x['logradouro']!,
                complemento: x['complemento']!,
                cidade: x['cidade']!,
                estado: x['estado']!,
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
