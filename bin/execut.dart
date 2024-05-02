// import 'package:execut/execut.dart' as execut;
// import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'database.dart';

void main() async{
  var handler = const shelf.Pipeline().addMiddleware(shelf.logRequests()).addHandler(_echoRequest);
  var server = await io.serve(handler, 'localhost', 8080);
  database();
  print('Servidor iniciado em ${server.address}:${server.port}');
}

shelf.Response _echoRequest(shelf.Request request) {
  return shelf.Response.ok('Request recebida: ${request.method} ${request.url}');
}
