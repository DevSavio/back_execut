import 'package:mysql_client/mysql_client.dart';
import '../base/database.dart';
import '../models/endereco_models.dart';

class EnderecoController {
  Future<int?> create({
    required String logradouro,
    required String complemento,
    required String cidade,
    required String estado,
  }) async {
    try {
      String sql =
          "INSERT INTO endereco (logradouro, complemento, cidade, estado)"
          " VALUES ('$logradouro', '$complemento', '$cidade', '$estado');";
      ControllerConnection c = ControllerConnection();
      IResultSet? result = await c.create(
        sql,
      );

      if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Endereço criado com sucesso!');
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
      {required String logradouro,
    required String complemento,
    required String cidade,
    required String estado,
      required int idEndereco}) async {
    try {
      String sql = "Update endereco set logradouro = '$logradouro', "
          " endereco = '$estado', complemento = '$complemento', cidade = '$cidade'"
          " where idEndereco = $idEndereco;";
      ControllerConnection c = ControllerConnection();

      await c.update(
        sql,
      );

      print('Endereço Atualizado com sucesso');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idEndereco,
  }) async {
    try {
      String sql = "delete from endereco "
          " where idEndereco = $idEndereco;";
      ControllerConnection c = ControllerConnection();
      IResultSet? i = await c.delete(
        sql,
      );
      if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Endereço deletado com sucesso');
          return idEndereco;
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

  Future<EnderecoModel?> readByID({
    required int idEndereco,
  }) async {
    try {
      String sql = "select * from endereco where idEndereco = $idEndereco;";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o endereço');
        throw ('Erro ao listar endereços: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Endereço não encontrado');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
          EnderecoModel c = EnderecoModel(
            idEndereco: int.parse(map['idEndereco']!),
            logradouro: map['logradouro']!,
            estado: map['estado']!,
            complemento: map['complemento']!,
            cidade: map['cidade']!,
          );

          return c;
        }
      }
    } catch (e) {
      throw ('Erro ao listar endereços: $e');
    }
  }

  Future<List<EnderecoModel>> list() async {
    try {
      String sql = "select * from endereco";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o endereço');
        throw ('Erro ao listar endereços: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Endereço não encontrado');
          return List<EnderecoModel>.empty();
        } else {
          List<EnderecoModel> lista = [];
          for (var row in r.rows) {
            print('Endereço encontrado: ${row.typedAssoc()}');
            EnderecoModel c = EnderecoModel(
              idEndereco: int.parse(row.assoc()['idEndereco']!),
              logradouro: row.assoc()['logradouro']!,
              estado: row.assoc()['estado']!,
              complemento: row.assoc()['complemento']!,
              cidade: row.assoc()['cidade']!,
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

  Future<List<EnderecoModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from endereco where $paramter $operator $value";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o endereço');
        return List<EnderecoModel>.empty();
      } else {
        if (r.rows.isEmpty) {
          print('Endereço não encontrado');
          return List<EnderecoModel>.empty();
        } else {
          List<EnderecoModel> lista = [];
          for (var row in r.rows) {
            print('Endereço encontrado: ${row.typedAssoc()}');
            EnderecoModel c = EnderecoModel(
              idEndereco: int.parse(row.assoc()['idEndereco']!),
              logradouro: row.assoc()['logradouro']!,
              estado: row.assoc()['estado']!,
              complemento: row.assoc()['complemento']!,
              cidade: row.assoc()['cidade']!,
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
