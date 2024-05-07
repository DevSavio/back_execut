// import 'package:execut/execut.dart' as execut;
// import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

import 'cliente/cliente_controller.dart';
import 'obra/obra_controller.dart';

void main() async {
  // ObraController obraController = ObraController();
  // obraController.create();

  ClienteController clienteController = ClienteController();
  // clienteController.create(
  //   complemento: "'Apto 45'",
  //   cpfCnpj: "12345678901234",
  //   logradouro: "'Rua das Flores, 123'",
  //   nomeCliente: "'João Silva'",
  //   razaoSocial: "'JS Serviços'",
  //   telefone: "11987654321",
  // );

  clienteController.update(
    complemento: "'Apto 1010'",
    cpfCnpj: "12345678901234",
    logradouro: "'Rua das Flores, 123'",
    nomeCliente: "'João Silva'",
    razaoSocial: "'JS Serviços'",
    telefone: "11987654321",
    idCliente: 6,
  );
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
