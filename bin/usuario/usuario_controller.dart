import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class UsuarioController {
  Future<void> create({
    required String nomeUsuario,
    required String razaoSocial,
    required String logradouro,
    required String complemento,
    required String cpfCnpj,
    required String telefone,
  }) async {
    String sql =
        "INSERT INTO usuario (nomeCliente, razaoSocial, logradouro, complemento, cpfCnpj, telefone)"
        " VALUES ($nomeUsuario, $razaoSocial, $logradouro, $complemento, $cpfCnpj, $telefone);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );

    print('Usuário criado com sucesso!');
  }

  Future<void> update({
    required String nomeUsuario,
    required String razaoSocial,
    required String logradouro,
    required String complemento,
    required String cpfCnpj,
    required String telefone,
    required int idUsuario,
  }) async {
    String sql =
        "Update usuario set nomeUsuario = $nomeUsuario, razaoSocial = $razaoSocial, logradouro = $logradouro, complemento = $complemento, cpfCnpj = $cpfCnpj, telefone = $telefone"
        " where idUsuario = $idUsuario;";
    ControllerConnection c = ControllerConnection();
    await c.update(
      sql,
    );
    print('Usuário Atualizado com sucesso');
  }

  Future<void> delete({
    required int idUsuario,
  }) async {
    String sql = "delete from usuario "
        " where idUsuario = $idUsuario;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Usuario excluido com sucesso');
  }

  Future<void> readByID({
    required int idUsuario,
  }) async {
    String sql = "select *  from usuario  where idUsuario = $idUsuario;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o usuário');
    } else {
      if (r.rows.isEmpty) {
        print('Usuário não encontrado');
      } else {
        for (var row in r.rows) {
          print('Usuário encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from usuario";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o usuário');
    } else {
      if (r.rows.isEmpty) {
        print('Usuário não encontrado');
      } else {
        for (var row in r.rows) {
          print('Usuário encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from usuario where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o usuário');
    } else {
      if (r.rows.isEmpty) {
        print('Usuário não encontrado');
      } else {
        for (var row in r.rows) {
          print('Usuário encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
