import '../models/cliente_models.dart';
import 'cliente_controller.dart';

class ClienteService {
  ClienteController clienteController = ClienteController();

  Future<ClienteModel?> criarClient(
      {required ClienteModel clienteModel}) async {
    try {
      int? insertedID = await clienteController.create(
        cpfCnpj: clienteModel.cpfCnpj,
        nomeCliente: clienteModel.nomeCliente,
        razaoSocial: clienteModel.razaoSocial,
        telefone: clienteModel.telefone ?? "",
        idEndereco: clienteModel.endereco.idEndereco!,
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

  Future<ClienteModel?> criarClienteEndereco(
      {required ClienteModel clienteModel}) async {
    try {
      int? insertedID = await clienteController.createClienteEndereco(
          cpfCnpj: clienteModel.cpfCnpj,
          nomeCliente: clienteModel.nomeCliente,
          razaoSocial: clienteModel.razaoSocial,
          telefone: clienteModel.telefone ?? "",
          cidade: clienteModel.endereco.cidade!,
          complemento: clienteModel.endereco.complemento!,
          estado: clienteModel.endereco.estado!,
          logradouro: clienteModel.endereco.logradouro!);

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
        cpfCnpj: clienteModel.cpfCnpj,
        nomeCliente: clienteModel.nomeCliente,
        razaoSocial: clienteModel.razaoSocial,
        telefone: clienteModel.telefone ?? "",
        idCliente: idCliente,
        idEndereco: clienteModel.endereco.idEndereco!,
      );

      if (reult) {
        return true;
      } else {
        return false;
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

  dynamic buscarClientePorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return clienteController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
