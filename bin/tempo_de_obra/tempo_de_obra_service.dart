import '../models/tempo_de_obra_models.dart';
import 'tempo_de_obra_controller.dart';

class TempoDeObraService {
  TempoDeObraController tempoDeObraController = TempoDeObraController();

  Future<TempoDeObraModel?> criarTempoDeObra(
      {required TempoDeObraModel tempoDeObraModel}) async {
    try {
      int? insertedID = await tempoDeObraController.create(
        nomeTempo: tempoDeObraModel.nomeTempo,
      );

      if (insertedID != null) {
        TempoDeObraModel? tempoDeObraModel =
            await tempoDeObraController.readByID(idTempo: insertedID);
        return tempoDeObraModel;
      } else {
        throw Exception("Erro ao criar tempo De Obra ");
      }
    } catch (e) {
      throw Exception("Erro ao criar tempo De Obra ");
    }
  }

  Future<TempoDeObraModel?> buscarTempoDeObra(int idTempo) async {
    try {
      return tempoDeObraController.readByID(
        idTempo: idTempo,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarTempoDeObra(
      {required TempoDeObraModel tempoDeObraModel, required int idTempoDeObra}) async {
    try {
      var reult = await tempoDeObraController.update(
        nomeTempo: tempoDeObraModel.nomeTempo,
        idTempo: tempoDeObraModel.idTempo,
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

  Future<int?> deletarTempoDeObra(int tempoID) async {
    try {
      int? id = await tempoDeObraController.delete(
        idTempo: tempoID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir tempoDeObra ");
    }
  }

  Future<List<TempoDeObraModel>> listarTempoDeObras() async {
    try {
      return await tempoDeObraController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarTempoDeObraPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return tempoDeObraController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
