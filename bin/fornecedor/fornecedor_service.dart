import '../models/fornecedor_models.dart';
import 'fornecedor_controller.dart';

class FornecedorService {
  FornecedorController fornecedorController = FornecedorController();

  Future<FornecedorModel?> criarFornecedor(
    {required FornecedorModel fornecedorModel}) async {
    try {
      int? insertedID = await fornecedorController.create(
        complemento: fornecedorModel.complemento ?? "",
        logradouro: fornecedorModel.logradouro,
        razaoSocial: fornecedorModel.razaoSocial,
        telefone: fornecedorModel.telefone,
        idTipo: fornecedorModel.idTipo,
      );

      if (insertedID != null) {
        FornecedorModel? fornecedorModel =
            await fornecedorController.readByID(idFornecedor: insertedID);
        return fornecedorModel;
      } else {
        throw Exception("Erro ao criar fornecedor");
      }
    } catch (e) {
      throw Exception("Erro ao criar fornecedor");
    }
  }

  Future<bool> atualizarFornecedor(
    {required FornecedorModel fornecedorModel, required int idFornecedor}) async {
    try {
      var result = await fornecedorController.update(
        complemento: fornecedorModel.complemento ?? "",
        razaoSocial: fornecedorModel.razaoSocial, 
        logradouro: fornecedorModel.logradouro, 
        telefone: fornecedorModel.telefone, 
        idTipo: fornecedorModel.idTipo, 
        idFornecedor: idFornecedor,
        );

        if (result) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FornecedorModel>> listarFornecedores() async{
    try {
      return await fornecedorController.list();
    } catch (e) {
      rethrow;
    }
  }

  Future<FornecedorModel?> buscarFornecedor(int idFornecedor) {
    try {
      return fornecedorController.readByID(
        idFornecedor: idFornecedor,
      );
    } catch (e) {
      rethrow;
    }
  }

   dynamic buscarFornecedorPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return fornecedorController.search(
        operator: operator, value: value, paramter: paramter);
  }

  Future<int?> deletarFornecedor(int idFornecedor) async {
    try {
      int? id = await fornecedorController.delete(
        idFornecedor: idFornecedor,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir fornecedor ");
    }
  }
}
