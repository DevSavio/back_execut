import '../models/mao_de_obra_models.dart';
import 'mao_de_obra_controller.dart';

class MaoDeObraService {
  MaoDeObraController maoDeObraController = MaoDeObraController();

  Future<MaoDeObraModel?> criarMaoDeObra(
      {required MaoDeObraModel maoDeObraModel}) async {
    try {
      int? insertedID = await maoDeObraController.create(
        descricao: maoDeObraModel.descricao,
        idPrestador: maoDeObraModel.idPrestador,
        idFuncao: maoDeObraModel.idFuncao,
        idTipo: maoDeObraModel.idTipo,
      );

      if (insertedID != null) {
        MaoDeObraModel? maoDeObraModel =
            await maoDeObraController.readByID(idMao: insertedID);
        return maoDeObraModel;
      } else {
        throw Exception("Erro ao criar maoDeObra ");
      }
    } catch (e) {
      throw Exception("Erro ao criar maoDeObra ");
    }
  }

  Future<MaoDeObraModel?> buscarMaoDeObra(int idMao) async {
    try {
      return maoDeObraController.readByID(
        idMao: idMao,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarMaoDeObra(
      {required MaoDeObraModel maoDeObraModel, required int idMao}) async {
    try {
      var reult = await maoDeObraController.update(
        descricao: maoDeObraModel.descricao,
        idFuncao: maoDeObraModel.idFuncao,
        idPrestador: maoDeObraModel.idPrestador,
        idTipo: maoDeObraModel.idTipo,
        idMao: idMao,
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

  Future<int?> deletarMaoDeObra(int maoDeObraID) async {
    try {
      int? id = await maoDeObraController.delete(
        idMao: maoDeObraID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir mao De Obra ");
    }
  }

  Future<List<MaoDeObraModel>> listarMaoDeObras() async {
    try {
      return await maoDeObraController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarMaoDeObraPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return maoDeObraController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
