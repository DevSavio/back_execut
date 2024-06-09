import '../models/prestador_models.dart';
import 'prestador_controller.dart';

class PrestadorService {
  PrestadorController prestadorController = PrestadorController();

  Future<PrestadorModel?> criarPrestador(
      {required PrestadorModel prestadorModel}) async {
    try {
      int? insertedID = await prestadorController.create(
        tipoPrestador: prestadorModel.tipoPrestador ?? "",
        cpfCnpj: prestadorModel.cpfCnpj ?? "",
        telefone: prestadorModel.telefone ?? "",
        nomePrestador: prestadorModel.nomePrestador,
        idFuncao: prestadorModel.idFuncao,
      );

      if (insertedID != null) {
        PrestadorModel? prestadorModel =
            await prestadorController.readByID(idPrestador: insertedID);
        return prestadorModel;
      } else {
        throw Exception("Erro ao criar Prestador");
      }
    } catch (e) {
      throw Exception("Erro ao criar Prestador");
    }
  }

  Future<PrestadorModel?> buscarPrestador(int idPrestador) async {
    try {
      return prestadorController.readByID(
        idPrestador: idPrestador,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarPrestador(
      {required PrestadorModel prestadorModel, required int idPrestador}) async {
    try {
      var reult = await prestadorController.update(
        tipoPrestador: prestadorModel.tipoPrestador ?? "",
        cpfCnpj: prestadorModel.cpfCnpj ?? "",
        telefone: prestadorModel.telefone ?? "",
        nomePrestador: prestadorModel.nomePrestador,
        idFuncao: prestadorModel.idFuncao,
        idPrestador: idPrestador,
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

  Future<int?> deletarPrestador(int prestadorID) async {
    try {
      int? id = await prestadorController.delete(
        idPrestador: prestadorID,
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

  Future<List<PrestadorModel>> listarPrestador() async {
    try {
      return await prestadorController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarPrestadorPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return prestadorController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
