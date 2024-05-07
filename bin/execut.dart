import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'cliente/cliente_service.dart';

void main() async {
  var app = Router();

  app.get('/hello', (Request request) {
    return Response.ok('hello-world');
  });

  app.get('/clientes', (Request request) {
    // return Response.ok('hello');

    ClienteService clienteService = ClienteService();
    clienteService.listarClientes();
  });

  app.get('/clientes/<id>', (Request request, int idCliente) {
    // return Response.ok('hello');

    ClienteService clienteService = ClienteService();
    clienteService.buscarCliente(idCliente);

    return Response.ok('hello');
  });

  var server = await io.serve(app, 'localhost', 8080);
}
