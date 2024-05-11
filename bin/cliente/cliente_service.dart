import '../models/cliente_models.dart';
import 'cliente_controller.dart';

class ClienteService {
  ClienteController clienteController = ClienteController();

  // ClienteService() {}

  bool criarClient() {
    clienteController.create(
      complemento: "'Apto 45'",
      cpfCnpj: "12345678901234",
      logradouro: "'Rua das Flores, 123'",
      nomeCliente: "'João Silva'",
      razaoSocial: "'JS Serviços'",
      telefone: "11987654321",
    );
    return true;
  }

  Future<ClienteModel?> buscarCliente(int idCliente) async {
    try {
      return clienteController.readByID(
        idCliente: idCliente,
      );
    } catch (e) {
      rethrow;
    }
  }

  bool atualizarCliente() {
    clienteController.update(
      complemento: "'Apto 1010'",
      cpfCnpj: "12345678901234",
      logradouro: "'Rua das Flores, 123'",
      nomeCliente: "'João Silva'",
      razaoSocial: "'JS Serviços'",
      telefone: "11987654321",
      idCliente: 8,
    );
    return true;
  }

  bool deletarCliente() {
    clienteController.delete(
      idCliente: 8,
    );
    return true;
  }

  Future<List<ClienteModel>> listarClientes() async {
    try {
      return [
        ClienteModel(
          idCliente: 1,
          nomeCliente: "João Silva",
          razaoSocial: "JS Serviços",
          logradouro: "Rua das Flores, 123",
          complemento: "Apto 45",
          cpfCnpj: "12345678901234",
          telefone: "11987654321",
        ),
        ClienteModel(
          idCliente: 2,
          nomeCliente: "Maria Souza",
          razaoSocial: "MS Serviços",
          logradouro: "Rua das Rosas, 456",
          complemento: "Apto 101",
          cpfCnpj: "12345678901234",
          telefone: "11987654321",
        ),
      ];
      // return await clienteController.list();
    } catch (e) {
      rethrow;
    }
  }

  bool buscarClientePorNome() {
    clienteController.search(
        operator: "like", value: "'%Jo%'", paramter: "nomeCliente");
    return true;
  }
}
