

import '../models/endereco_models.dart';
import 'endereco_controller.dart';

class EnderecoService {
  EnderecoController enderecoController = EnderecoController();

  Future<EnderecoModel?> criarEndereco(
      {required EnderecoModel enderecoModel}) async {
    try {
      int? insertedID = await enderecoController.create(
        logradouro: enderecoModel.logradouro,
        complemento: enderecoModel.complemento,
        cidade: enderecoModel.cidade,
        estado: enderecoModel.estado,
      );

      if (insertedID != null) {
        EnderecoModel? enderecoModel =
            await enderecoController.readByID(idEndereco: insertedID);
        return enderecoModel;
      } else {
        throw Exception("Erro ao criar endereço");
      }
    } catch (e) {
      throw Exception("Erro ao criar endereço");
    }
  }

  Future<EnderecoModel?> buscarEndereco(int idEndereco) async {
    try {
      return enderecoController.readByID(
        idEndereco: idEndereco,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarEndereco(
      {required EnderecoModel enderecoModel, required int idEndereco}) async {
    try {
      var reult = await enderecoController.update(
        logradouro: enderecoModel.logradouro,
        cidade: enderecoModel.cidade,
        estado: enderecoModel.estado,
        complemento: enderecoModel.complemento,
        idEndereco: idEndereco
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

  Future<int?> deletarEndereco(int enderecoID) async {
    try {
      int? id = await enderecoController.delete(
        idEndereco: enderecoID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir endereço");
    }
  }

  Future<List<EnderecoModel>> listarEnderecos() async {
    try {
      return await enderecoController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarEnderecoPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return enderecoController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
