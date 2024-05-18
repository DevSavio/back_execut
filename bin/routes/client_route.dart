import 'package:shelf_plus/shelf_plus.dart';
import "../cliente/cliente_service.dart";
import "../models/cliente_models.dart";

class ClientRoute {
  RouterPlus router = RouterPlus();
  ClienteService clienteService = ClienteService();

  ClientRoute({required this.router});

  RouterPlus init() {
    /// List all cliente
    router.get('/clientes', () {
      final data = clienteService.listarClientes();
      return data;
    });

    /// Get specific cliente by id
    router.get('/cliente2/<id>', (Request request, String id) {
      final data = clienteService.buscarCliente(int.parse(id));
      return data;
    });

    /// Add a new clientes
    router.post('/cliente', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        ClienteModel novoCliente = ClienteModel.fromJson(body);

        ClienteModel? clienteAdicionado =
            await clienteService.criarClient(clienteModel: novoCliente);

        if (clienteAdicionado != null) {
          return {
            'ok': 'true',
            'clienteAdicionado': clienteAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// delete a new cliente
    router.delete('/cliente/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await clienteService
            .deletarCliente(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'cliente_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'cliente_excluido': "Cliente não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// update a clientes
    router.post('/cliente/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        ClienteModel novoCliente = ClienteModel.fromJson(body);

        var clientAtualizado = await clienteService.atualizarCliente(
          clienteModel: novoCliente,
          idCliente: int.parse(
            request.params['id']!,
          ),
        );

        if (clientAtualizado != null) {
          return {
            'ok': 'true',
            'clienteAlterado': clientAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// buscar clientes por id
    router.get('/cliente/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var clientAtualizado = await clienteService.buscarClientePorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (clientAtualizado != null) {
          return {
            'ok': 'true',
            'clienteAlterado': clientAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    return router;
  }
}
