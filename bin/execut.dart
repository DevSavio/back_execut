// import 'package:execut/execut.dart' as execut;
// import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

// import 'cliente/cliente_controller.dart';
// import 'obra/obra_controller.dart';
// import 'usuario/usuario_controller.dart';
// import 'tipoMaoDeObra/tipoMaoDeObra_controller.dart';
// import 'tempo_de_obra/tempo_de_obra_controller.dart';
// import 'tipo_de_fornecedor/tipo_de_fornecedor_controller.dart';
// import 'origem_recurso/origem_recurso_controller.dart';

void main() async {

  //usuario
  //tipoMaoDeObra
  //tempoDeObra
  //tipoDeFornecedor
  //origemRecurso


}

shelf.Response _echoRequest(shelf.Request request) {
  return shelf.Response.ok(
      'Request recebida: ${request.method} ${request.url}');
}

Future<void> initShelf() async {
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addHandler(_echoRequest);
  var server = await io.serve(handler, 'localhost', 8080);

  print('Servidor iniciado em ${server.address}:${server.port}');
}
