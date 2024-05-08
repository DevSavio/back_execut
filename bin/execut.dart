// import 'package:execut/execut.dart' as execut;
// import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;



// import 'cliente/cliente_controller.dart';
// import 'obra/obra_controller.dart';
// import 'usuario/usuario_controller.dart';
// import 'tipoMaoDeObra/tipoMaoDeObra_controller.dart';
import 'tipo_mao_de_obra/tipo_mao_de_obra_controller.dart';

void main() async {

  //usuario
  //tipoMaoDeObra
  //tempoDeObra

  TempoDeObraController tempoDeObraController = TempoDeObraController();

    tempoDeObraController.create(
       nomeTempo: "Curto prazo",
    );

    tempoDeObraController.readByID(
      idTempo: 1,
    );

    tempoDeObraController.update(
      nomeTempo: "",
      idTempo: 1,
    );

    tempoDeObraController.delete(
      idTempo: 1,
    );

    tempoDeObraController.list();

    tempoDeObraController.search(
        operator: "like", value: "'%Ex%'", paramter: "nomeCliente");

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
