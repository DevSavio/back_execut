import 'cliente_controller.dart';

class ClienteService {
  ClienteController clienteController = ClienteController();

  ClienteService() {}

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

  bool buscarCliente(int idCliente) {
    clienteController.readByID(
      idCliente: idCliente,
    );
    return true;
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

  bool listarClientes() {
    clienteController.list();
    return true;
  }

  bool buscarClientePorNome() {
    clienteController.search(
        operator: "like", value: "'%Jo%'", paramter: "nomeCliente");
    return true;
  }
}
