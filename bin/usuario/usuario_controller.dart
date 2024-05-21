import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/usuario_models.dart';

class UsuarioController {
  Future<int?> create({
    required String nomeUsuario,
    required String razaoSocial,
    required String logradouro,
    String? complemento,
    required String cpfCnpj,
    required String telefone,
  }) async {
    try {
      String sql =
        "INSERT INTO usuario (nomeCliente, razaoSocial, logradouro, complemento, cpfCnpj, telefone)"
        " VALUES ($nomeUsuario, $razaoSocial, $logradouro, $complemento, $cpfCnpj, $telefone);";
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
    required String logradouro,
    String? complemento,
    required String cpfCnpj,
    required String telefone,
    required int idUsuario,
  }) async {
    try {
      String sql =
        "Update usuario set nomeUsuario = $nomeUsuario, razaoSocial = $razaoSocial, logradouro = $logradouro, complemento = $complemento, cpfCnpj = $cpfCnpj, telefone = $telefone"
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
            idUsuario: int.parse(map['s']!),
            nomeUsuario: map['nomeUsuario']!,
            razaoSocial: map['razaoSocial']!,
            logradouro: map['logradouro'],
            complemento: map['complemento'] ?? "",
            cpfCnpj: map['cpfCnpj']!,
            telefone: map['telefone']!,
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
      String sql = "select *  from usuario";
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
                logradouro: row.assoc()['logradouro']!,
                complemento: row.assoc()['complemento'] ?? "",
                cpfCnpj: row.assoc()['cpfCnpj']!,
                telefone: row.assoc()['telefone']!,
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
              logradouro: row.assoc()['logradouro']!,
              complemento: row.assoc()['complemento'] ?? "",
              cpfCnpj: row.assoc()['cpfCnpj']!,
              telefone: row.assoc()['telefone']!,
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
