import 'package:shelf/shelf_io.dart' as io;

import 'package:shelf_plus/shelf_plus.dart';

import 'cliente/cliente_service.dart';
import 'models/cliente_models.dart';
import 'usuario/usuario_controller.dart';

// import 'cliente/cliente_controller.dart';
// import 'obra/obra_controller.dart';
// import 'usuario/usuario_controller.dart';
// import 'tipo_mao_de_obra/bin/tipo_mao_de_obra/tipo_mao_de_obra_controller.dart';
// import 'tempo_de_obra/tempo_de_obra_controller.dart';
// import 'tipo_de_fornecedor/tipo_de_fornecedor_controller.dart';
// import 'origem_recurso/origem_recurso_controller.dart';
// import 'pagamento/pagamento_controller.dart';
// import 'funcao_prestador/funcao_prestador_controller.dart';
// import 'fornecedor/fornecedor_controller.dart';
// import 'prestador/prestador_controller.dart';
// import 'custo_prestador/custo_prestador_controller.dart';

  //usuario
  //tipoMaoDeObra
  //tempoDeObra
  //tipoDeFornecedor
  //origemRecurso
  //pagamento
  //funcaoPrestador
  //fornecedor
  //prestador
  //custo_prestador


void main() async {
  var app = Router().plus;

  app.get('/hello', (Request request) {
    print(request.url);
    return Response.ok('hello-world');
  });

  app.get('/clientes', (Request request) async {
   try {
      // return Response.ok('hello');

    ClienteService clienteService = ClienteService();
    List<ClienteModel> resultado = await clienteService.listarClientes();
    return {
      "sucesso": true,
      "resultado": resultado,
    };
   } catch (e) {
     return Response.internalServerError(
      body: {
        "erro": "Deu erro no cliente",
        "mensagem": e,        
      }
    );
   }
  });

  app.get('/clientes/<id>', (Request request, int idCliente) {
    // return Response.ok('hello');

    ClienteService clienteService = ClienteService();
    clienteService.buscarCliente(idCliente);

    return Response.ok('hello');
  });

  var server = await io.serve(app, 'localhost', 8080);
}
