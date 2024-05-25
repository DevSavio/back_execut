import 'dart:async';
import 'package:mysql_client/mysql_client.dart';

class ControllerConnection {
  late MySQLConnection conn;

  ControllerConnection();

  Future<void> initConexao() async {
    try {
      conn = await MySQLConnection.createConnection(
        host: 'localhost',
        port: 3306,
        userName: 'root',
        databaseName: 'execut',
        password: '0403',
      );

      // conn = await MySQLConnection.createConnection(
      //   host: 'localhost',
      //   port: 32774,
      //   userName: 'root',
      //   databaseName: 'execut',
      //   password: 'root',
      // );

      await conn.connect();
    } catch (e) {
      print("Erro ao inicializar a conexão: $e");
    }
  }

  Future<IResultSet?> create(String sql) async {
    try {
      await initConexao();
      IResultSet r = await conn.execute(sql);
      conn.close();
      if (r.affectedRows.bitLength > 0) {
        print("Inserido com sucesso!");
        return r;
      } else {
        print("Erro ao inserir!");
        return null;
      }
    } catch (e) {
      print("Erro ao inserir: $e");
      return null;
    }
  }

  Future<IResultSet?> update(String sql) async {
    try {
      await initConexao();
      IResultSet r = await conn.execute(sql);
      conn.close();
      return r;
    } catch (e) {
      print("Erro ao atualizar: $e");
      return null;
    }
  }

  Future<IResultSet?> delete(String sql) async {
    try {
      await initConexao();
      IResultSet r = await conn.execute(sql);
      conn.close();
      return r;
    } catch (e) {
      print("Erro ao deletar: $e");
      return null;
    }
  }

  Future<IResultSet?> read(String sql) async {
    try {
      await initConexao();
      var result = await conn.execute(sql);
      conn.close();
      return result;
    } catch (e) {
      print("Erro ao listar: $e");
      return null;
    }
  }
}
