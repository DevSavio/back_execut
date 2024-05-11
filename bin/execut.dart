import 'dart:convert';

import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_plus/shelf_plus.dart';

import 'cliente/cliente_service.dart';
import 'models/cliente_models.dart';

// import 'usuario/usuario_controller.dart';
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

  // app.get('/hello', (Request request) {
  //   print(request.url);
  //   return Response.ok('hello-world');
  // });

  app.get('/clientes', (Request request) async {
    try {
      ClienteService clienteService = ClienteService();
      List<ClienteModel> resultado = await clienteService.listarClientes();
      return {
        "sucesso": true,
        "resultado": resultado,
      };
    } catch (e) {
      return Response.internalServerError(body: {
        "erro": "Deu erro no cliente",
        "mensagem": e,
      });
    }
  });

  app.get('/cliente/<id>', (Request request, int idCliente) async {
    print(request.url);
    try {
      ClienteService clienteService = ClienteService();
      ClienteModel? resultado = await clienteService.buscarCliente(idCliente);
      if (resultado == null) {
        return {
          "sucesso": false,
          "resultado": "Deu erro no idCliente",
        };
      } else {
        return {
          "sucesso": true,
          "resultado": resultado,
        };
      }
    } catch (e) {
      return Response.internalServerError(body: {
        "erro": "Deu erro no idCliente",
        "mensagem": e,
      });
    }
  });

  app.get('/teste', (Request request) {
    ClienteModel c = ClienteModel(
      idCliente: 1,
      complemento: "'Apto 45'",
      cpfCnpj: "12345678901234",
      logradouro: "'Rua das Flores, 123'",
      nomeCliente: "'João Silva'",
      razaoSocial: "'JS Serviços'",
       telefone: "11987654321",
    );
    print(request.url);
   
  });

  var server = await io.serve(app, 'localhost', 8080);
}
