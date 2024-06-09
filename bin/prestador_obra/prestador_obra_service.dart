import '../models/prestador_obra_models.dart';
import 'prestador_obra_controller.dart';

class PrestadorObraService {
  PrestadorObraController prestadorObraController = PrestadorObraController();

  Future<PrestadorObraModel?> criarPrestadorObra(
      {required PrestadorObraModel prestadorObraModel}) async {
    try {
      int? insertedID = await prestadorObraController.create(
        idPrestador: prestadorObraModel.idPrestador,
        idObra: prestadorObraModel.idObra,
        dataInicio: prestadorObraModel.dataInicio,
        dataFim: prestadorObraModel.dataFim,
      );

      if (insertedID != null) {
        PrestadorObraModel? prestadorObraModel =
            await prestadorObraController.readByID(idPrestadorObra: insertedID);
        return prestadorObraModel;
      } else {
        throw Exception("Erro ao criar prestador obra");
      }
    } catch (e) {
      throw Exception("Erro ao criar prestador obra");
    }
  }

  Future<PrestadorObraModel?> buscarPrestadorObra(int idPrestadorObra) async {
    try {
      return prestadorObraController.readByID(
        idPrestadorObra: idPrestadorObra,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarPrestadorObra(
      {required PrestadorObraModel prestadorObraModel, required int idPrestadorObra}) async {
    try {
      var reult = await prestadorObraController.update(
        idPrestador: prestadorObraModel.idPrestador,
        idObra: prestadorObraModel.idObra,
        idPrestadorObra: idPrestadorObra,
        dataInicio: prestadorObraModel.dataInicio,
        dataFim: prestadorObraModel.dataFim
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

  Future<int?> deletarPrestadorObra(int prestadorObraID) async {
    try {
      int? id = await prestadorObraController.delete(
        idPrestadorObra: prestadorObraID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir prestador obra");
    }
  }

  Future<List<PrestadorObraModel>> listarPrestadorObras() async {
    try {
      return await prestadorObraController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarPrestadorObraPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return prestadorObraController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
