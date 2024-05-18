import 'dart:ffi';

import 'package:mysql_client/mysql_client.dart';

import '../models/cliente_models.dart';
import 'cliente_controller.dart';

class ClienteService {
  ClienteController clienteController = ClienteController();

  // ClienteService() {}

  Future<ClienteModel?> criarClient(
      {required ClienteModel clienteModel}) async {
    try {
      int? insertedID = await clienteController.create(
        complemento: clienteModel.complemento ?? "",
        cpfCnpj: clienteModel.cpfCnpj,
        logradouro: clienteModel.logradouro,
        nomeCliente: clienteModel.nomeCliente,
        razaoSocial: clienteModel.razaoSocial,
        telefone: clienteModel.telefone ?? "",
      );

      if (insertedID != null) {
        ClienteModel? clienteModel =
            await clienteController.readByID(idCliente: insertedID);
        return clienteModel;
      } else {
        throw Exception("Erro ao criar cliente ");
      }
    } catch (e) {
      throw Exception("Erro ao criar cliente ");
    }
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
      return await clienteController.list();
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
