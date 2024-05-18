import 'package:shelf_plus/shelf_plus.dart';
import "../cliente/cliente_service.dart";

class ClientRoute {
  RouterPlus router = RouterPlus();
  ClientRoute({required this.router});

  void init() {
    /// List all cliente
    router.get('/clientes', () {
      ClienteService c = ClienteService();
      final data = c.listarClientes();
      return data;
    });

    /// Get specific cliente by id
    router.get('/clientes/<id>', (Request request, String id) {
      ClienteService c = ClienteService();
      final data = c.buscarCliente(int.parse(id));
      return data;
    });
  }
}
