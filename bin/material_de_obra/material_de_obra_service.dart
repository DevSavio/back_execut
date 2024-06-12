import '../models/material_de_obra_models.dart';
import 'material_de_obra_controller.dart';

class MaterialDeObraService {
  MaterialDeObraController materialDeObraController = MaterialDeObraController();

  Future<MaterialDeObraModel?> criarMaterialDeObra(
      {required MaterialDeObraModel materialDeObraModel}) async {
    try {
      int? insertedID = await materialDeObraController.create(
        descricaoMaterial: materialDeObraModel.descricaoMaterial,
        nomeMaterial: materialDeObraModel.nomeMaterial,
        valor: materialDeObraModel.valor,
        idTipo: materialDeObraModel.tipo.idTipo!,
        idOrigem: materialDeObraModel.origem.idOrigem!,
        idFornecedor: materialDeObraModel.fornecedor.idFornecedor!,
      );

      if (insertedID != null) {
        MaterialDeObraModel? materialDeObraModel =
            await materialDeObraController.readByID(idMaterial: insertedID);
        return materialDeObraModel;
      } else {
        throw Exception("Erro ao criar material de obra ");
      }
    } catch (e) {
      throw Exception("Erro ao criar material de obra ");
    }
  }

  Future<MaterialDeObraModel?> buscarMaterialDeObra(int idMaterial) async {
    try {
      return materialDeObraController.readByID(
        idMaterial: idMaterial,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarMaterialDeObra(
      {required MaterialDeObraModel materialDeObraModel, required int idMaterial}) async {
    try {
      var reult = await materialDeObraController.update(
        descricaoMaterial: materialDeObraModel.descricaoMaterial,
        nomeMaterial: materialDeObraModel.nomeMaterial,
        valor: materialDeObraModel.valor,
        idMaterial: idMaterial,
        idTipo: materialDeObraModel.tipo.idTipo!,
        idOrigem: materialDeObraModel.origem.idOrigem!,
        idFornecedor: materialDeObraModel.fornecedor.idFornecedor!,
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

  Future<int?> deletarMaterialDeObra(int materialDeObraID) async {
    try {
      int? id = await materialDeObraController.delete(
        idMaterial: materialDeObraID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir material de obra ");
    }
  }

  Future<List<MaterialDeObraModel>> listarMaterialDeObras() async {
    try {
      return await materialDeObraController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarMaterialDeObraPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return materialDeObraController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
