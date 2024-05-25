import '../models/origem_recurso_models.dart';
import 'origem_recurso_controller.dart';

class OrigemRecursoService {
  OrigemRecursoController origemRecursoController = OrigemRecursoController();

  Future<OrigemRecursoModel?> criarOrigemRecurso(
      {required OrigemRecursoModel origemRecursoModel}) async {
    try {
      int? insertedID = await origemRecursoController.create(
        tipoOrigem: origemRecursoModel.tipoOrigem,
        percentual: origemRecursoModel.percentual,
      );

      if (insertedID != null) {
        OrigemRecursoModel? origemRecursoModel =
            await origemRecursoController.readByID(idOrigem: insertedID);
        return origemRecursoModel;
      } else {
        throw Exception("Erro ao criar cliente ");
      }
    } catch (e) {
      throw Exception("Erro ao criar cliente ");
    }
  }

  Future<OrigemRecursoModel?> buscarOrigemRecurso(int idOrigem) async {
    try {
      return origemRecursoController.readByID(
        idOrigem: idOrigem,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarOrigemRecurso(
      {required OrigemRecursoModel origemRecursoModel, required int idCliente}) async {
    try {
      var reult = await origemRecursoController.update(
        idOrigem: origemRecursoModel.idOrigem,
        tipoOrigem: origemRecursoModel.tipoOrigem,
        percentual: origemRecursoModel.percentual,
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

  Future<int?> deletarOrigemRecurso(int origemID) async {
    try {
      int? id = await origemRecursoController.delete(
        idOrigem: origemID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir Origem Recurso");
    }
  }

  Future<List<OrigemRecursoModel>> listarOrigemRecurso() async {
    try {
      return await origemRecursoController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarOrigemRecursoPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return origemRecursoController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
