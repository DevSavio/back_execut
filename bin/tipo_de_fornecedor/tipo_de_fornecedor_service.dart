import '../models/tipo_de_fornecedor_models.dart';
import 'tipo_de_fornecedor_controller.dart';

class TipoDeFornecedorService {
  TipoDeFornecedorController tipoDeFornecedorController = TipoDeFornecedorController();

  Future<TipoDeFornecedorModel?> criarTipoDeFornecedor(
      {required TipoDeFornecedorModel tipoDeFornecedorModel}) async {
    try {
      int? insertedID = await tipoDeFornecedorController.create(
        nomeTipo: tipoDeFornecedorModel.nomeTipo,
        descricao: tipoDeFornecedorModel.descricao,
      );

      if (insertedID != null) {
        TipoDeFornecedorModel? tipoDeFornecedorModel =
            await tipoDeFornecedorController.readByID(idTipo: insertedID);
        return tipoDeFornecedorModel;
      } else {
        throw Exception("Erro ao criar tipo de fornecedor ");
      }
    } catch (e) {
      throw Exception("Erro ao criar tipo de fornecedor ");
    }
  }

  Future<TipoDeFornecedorModel?> buscarTipoDeFornecedor(int idTipo) async {
    try {
      return tipoDeFornecedorController.readByID(
        idTipo: idTipo,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarTipoDeFornecedor(
      {required TipoDeFornecedorModel tipoDeFornecedorModel, required int idTipo}) async {
    try {
      var reult = await tipoDeFornecedorController.update(
        nomeTipo: tipoDeFornecedorModel.nomeTipo,
        descricao: tipoDeFornecedorModel.descricao,
        idTipo: idTipo,
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

  Future<int?> deletarTipoDeFornecedor(int clienteID) async {
    try {
      int? id = await tipoDeFornecedorController.delete(
        idTipo: clienteID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir tipo de fornecedor ");
    }
  }

  Future<List<TipoDeFornecedorModel>> listarTipoDeFornecedores() async {
    try {
      return await tipoDeFornecedorController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarTipoDeFornecedorPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return tipoDeFornecedorController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
