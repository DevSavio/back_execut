import 'dart:async';
import 'package:mysql1/mysql1.dart';

Future database() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      db: 'execut',
      password: '0403'));

  // Lê a tabela
  await conn.query(
      'select * from usuario');

  // Insert some data
  var result = await conn.query(
      'select * from usuario');
  print('Lendo a linha id=${result.insertId}');

  // Query the database using a parameterized query
  var results = await conn.query(
      'select * from usuario', [result.insertId]);
  for (var row in results) {
    print(' $row');
  }

  // // Update some data
  // await conn.query('update users set age=? where name=?', [26, 'Bob']);

  // // Query again database using a parameterized query
  // var results2 = await conn.query(
  //     'select name, email, age from users where id = ?', [result.insertId]);
  // for (var row in results2) {
  //   print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
  // }

  // Finally, close the connection
  await conn.close();
}