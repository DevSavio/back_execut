import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/usuario_models.dart';

class UsuarioController {
  Future<int?> create({
    required String nomeUsuario,
    required String razaoSocial,
    required String cpfCnpj,
    required String telefone,
    required int idEndereco
  }) async {
    try {
      String sql =
        "INSERT INTO usuario (nomeCliente, razaoSocial, idEndereco, cpfCnpj, telefone)"
        " VALUES ('$nomeUsuario', '$razaoSocial', '$idEndereco', '$cpfCnpj', '$telefone');";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );

    if (result != null) {
      if (result.affectedRows >= BigInt.one) {
        print('Usuário criado com sucesso!');
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
    required String nomeUsuario,
    required String razaoSocial,
    required String cpfCnpj,
    required String telefone,
    required int idUsuario,
    required int idEndereco
  }) async {
    try {
      String sql =
        "Update usuario set nomeUsuario = '$nomeUsuario', razaoSocial = '$razaoSocial', cpfCnpj = '$cpfCnpj', telefone = '$telefone', endereco = '$idEndereco'"
        " where idUsuario = $idUsuario;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Usuário Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idUsuario,
  }) async {
    try {
      String sql = "delete from usuario "
        " where idUsuario = $idUsuario;";
      ControllerConnection c = ControllerConnection();
      IResultSet? i = await c.delete(
        sql,
      );
      
      if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Usuario excluido com sucesso');
          return idUsuario;
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

  Future<UsuarioModel?> readByID({
    required int idUsuario,
  }) async {
    try {
      String sql = "select *  from usuario  where idUsuario = $idUsuario;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o usuário');
      throw ('Erro ao listar usuários: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Usuário não encontrado');
        return null;
      } else {
        Map<String, dynamic> map = r.rows.first.assoc();
          UsuarioModel c = UsuarioModel(
            idUsuario: int.parse(map['idUsuario']!),
            nomeUsuario: map['nomeUsuario']!,
            razaoSocial: map['razaoSocial']!,
            cpfCnpj: map['cpfCnpj']!,
            telefone: map['telefone']!,
            idEndereco: int.parse(map['idEndereco']!),
          );

          return c;
      }
    }
    } catch (e) {
      throw('Erro ao listar usuários: $e');
    }
  }

  Future<List<UsuarioModel>> list() async {
    try {
      String sql = "select * from usuario";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o usuário');
        throw ('Erro ao listar usuários: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Usuário não encontrado');
          return List<UsuarioModel>.empty();
        } else {
          List<UsuarioModel> lista = [];
            for (var row in r.rows) {
              print('Usuário encontrado: ${row.typedAssoc()}');
              UsuarioModel c = UsuarioModel(
                idUsuario: int.parse(row.assoc()['idUsuario']!),
                nomeUsuario: row.assoc()['nomeUsuario']!,
                razaoSocial: row.assoc()['razaoSocial']!,
                cpfCnpj: row.assoc()['cpfCnpj']!,
                telefone: row.assoc()['telefone']!,
                idEndereco: int.parse(row.assoc()['idEndereco']!),
              );
              lista.add(c);
            }
            return lista;
        }
      }
    } catch (e) {
      throw('Erro ao listar usuários: $e');
    }
  }

  Future<List<UsuarioModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from usuario where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
        print('Erro ao buscar o usuário');
        return List<UsuarioModel>.empty();
      } else {
        if (r.rows.isEmpty) {
          print('Usuário não encontrado');
          return List<UsuarioModel>.empty();
        } else {
          List<UsuarioModel> lista = [];
          for (var row in r.rows) {
            print('Usuário encontrado: ${row.typedAssoc()}');
            UsuarioModel c = UsuarioModel(
              idUsuario: int.parse(row.assoc()['idUsuario']!),
              nomeUsuario: row.assoc()['nomeUsuario']!,
              razaoSocial: row.assoc()['razaoSocial']!,
              cpfCnpj: row.assoc()['cpfCnpj']!,
              telefone: row.assoc()['telefone']!,
              idEndereco: int.parse(row.assoc()['idEndereco']!)
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
