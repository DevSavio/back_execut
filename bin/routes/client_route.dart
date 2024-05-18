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
    router.get('/clientes/<id>', (Request request, String id) {
      final data = clienteService.buscarCliente(int.parse(id));
      return data;
    });

    /// Get specific cliente by id
    router.get('/clientes2/<id>', (Request request, String id) {
      final data = clienteService.buscarCliente(int.parse(id));
      return data;
    });

    /// Add a new person
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

    return router;
  }
}
