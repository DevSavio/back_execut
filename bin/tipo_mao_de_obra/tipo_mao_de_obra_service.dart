import '../models/tipo_de_obra_models.dart';
import 'tipo_mao_de_obra_controller.dart';

class TipoDeObraService {
  TipoDeObraController tipoDeObraController = TipoDeObraController();

  Future<TipoDeObraModel?> criarTipoDeObra(
      {required TipoDeObraModel tipoDeObraModel}) async {
    try {
      int? insertedID = await tipoDeObraController.create(
        nomeTipo: tipoDeObraModel.nomeTipo,
        descricaoTipo: tipoDeObraModel.descricaoTipo,
      );

      if (insertedID != null) {
        TipoDeObraModel? tipoDeObraModel =
            await tipoDeObraController.readByID(idTipo: insertedID);
        return tipoDeObraModel;
      } else {
        throw Exception("Erro ao criar tipoDeObra ");
      }
    } catch (e) {
      throw Exception("Erro ao criar tipoDeObra ");
    }
  }

  Future<TipoDeObraModel?> buscarTipoDeObra(int idTipo) async {
    try {
      return tipoDeObraController.readByID(
        idTipo: idTipo,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarTipoDeObra(
      {required TipoDeObraModel tipoDeObraModel, required int idTipo}) async {
    try {
      var reult = await tipoDeObraController.update(
        idTipo: idTipo,
        nomeTipo: tipoDeObraModel.nomeTipo,
        descricaoTipo: tipoDeObraModel.descricaoTipo,
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

  Future<int?> deletarTipoDeObra(int tipoID) async {
    try {
      int? id = await tipoDeObraController.delete(
        idTipo: tipoID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir tipoDeObra ");
    }
  }

  Future<List<TipoDeObraModel>> listarTipoDeObras() async {
    try {
      return await tipoDeObraController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarTipoDeObraPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return tipoDeObraController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
