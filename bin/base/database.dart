import 'dart:async';
import 'package:mysql1/mysql1.dart';

class ControllerConnection {
  late MySqlConnection conn;

  ControllerConnection();

  Future<void> initConexao() async {
    try {
      conn = await MySqlConnection.connect(
        ConnectionSettings(
          host: '192.168.1.15',
          port: 3306,
          user: 'root',
          db: 'execut',
          password: '0403',
        ),
      );
    } catch (e) {
      print("Erro ao inicializar a conexão: $e");
    }
  }

  Future<Results?> create(String sql) async {
    try {
      await initConexao();
      Results r = await conn.query(sql);
      conn.close();
      if (r.insertId != null) {
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

  Future<Results?> update(String sql) async {
    try {
      await initConexao();
      Results r = await conn.query(sql);
      conn.close();
      return r;
    } catch (e) {
      print("Erro ao atualizar: $e");
      return null;
    }
  }

  Future<Results?> delete(String sql) async {
    try {
      await initConexao();
      Results r = await conn.query(sql);
      conn.close();
      return r;
    } catch (e) {
      print("Erro ao deletar: $e");
      return null;
    }
  }

  Future<Results?> read(String sql) async {
    try {
      await initConexao();
      Results r = await conn.query(sql);
      conn.close();
      return r;
    } catch (e) {
      print("Erro ao listar: $e");
      return null;
    }
  }

  // Future database() async {
  //   try {
  //     // Open a connection (testdb should already exist)

  //     // Lê a tabela
  //     await conn.query('select * from usuario');

  //     // Insert some data
  //     var result = await conn.query('select * from usuario');
  //     print('Lendo a linha id=${result.toList()}');

  //     // Query the database using a parameterized query
  //     var results =
  //         await conn.query('select * from usuario', [result.toList()]);
  //     for (var row in results) {
  //       print(' $row');
  //     }

  //     // // Update some data
  //     // await conn.query('update users set age=? where name=?', [26, 'Bob']);

  //     // // Query again database using a parameterized query
  //     // var results2 = await conn.query(
  //     //     'select name, email, age from users where id = ?', [result.insertId]);
  //     // for (var row in results2) {
  //     //   print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
  //     // }

  //     // Finally, close the connection
  //     await conn.close();
  //   } catch (e) {
  //     print("Erro: $e");
  //   }
  // }
}
