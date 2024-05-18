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

  Future<bool> atualizarCliente(
      {required ClienteModel clienteModel, required int idCliente}) async {
    try {
      var reult = await clienteController.update(
        complemento: clienteModel.complemento ?? "",
        cpfCnpj: clienteModel.cpfCnpj,
        logradouro: clienteModel.logradouro,
        nomeCliente: clienteModel.nomeCliente,
        razaoSocial: clienteModel.razaoSocial,
        telefone: clienteModel.telefone ?? "",
        idCliente: idCliente,
      );

      if (reult) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> deletarCliente(int clienteID) async {
    try {
      int? id = await clienteController.delete(
        idCliente: clienteID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir cliente ");
    }
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
