import '../models/tipo_mao_de_obra_models.dart';
import 'tipo_mao_de_obra_controller.dart';

class TipoMaoDeObraService {
  TipoMaoDeObraController tipoMaoDeObraController = TipoMaoDeObraController();

  Future<TipoMaoDeObraModel?> criarTipoMaoDeObra(
      {required TipoMaoDeObraModel tipoMaoDeObraModel}) async {
    try {
      int? insertedID = await tipoMaoDeObraController.create(
        nomeTipo: tipoMaoDeObraModel.nomeTipo,
        descricao: tipoMaoDeObraModel.descricao,
      );

      if (insertedID != null) {
        TipoMaoDeObraModel? tipoMaoDeObraModel =
            await tipoMaoDeObraController.readByID(idTipo: insertedID);
        return tipoMaoDeObraModel;
      } else {
        throw Exception("Erro ao criar tipoMaoDeObra ");
      }
    } catch (e) {
      throw Exception("Erro ao criar tipoMaoDeObra ");
    }
  }

  Future<TipoMaoDeObraModel?> buscarTipoMaoDeObra(int idTipo) async {
    try {
      return tipoMaoDeObraController.readByID(
        idTipo: idTipo,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarTipoMaoDeObra(
      {required TipoMaoDeObraModel tipoMaoDeObraModel, required int idTipo}) async {
    try {
      var reult = await tipoMaoDeObraController.update(
        idTipo: tipoMaoDeObraModel.idTipo,
        nomeTipo: tipoMaoDeObraModel.nomeTipo,
        descricao: tipoMaoDeObraModel.descricao,
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

  Future<int?> deletarTipoMaoDeObra(int tipoID) async {
    try {
      int? id = await tipoMaoDeObraController.delete(
        idTipo: tipoID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir tipoMaoDeObra ");
    }
  }

  Future<List<TipoMaoDeObraModel>> listarTipoMaoDeObras() async {
    try {
      return await tipoMaoDeObraController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarTipoMaoDeObraPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return tipoMaoDeObraController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
