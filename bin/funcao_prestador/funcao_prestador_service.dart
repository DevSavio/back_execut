import '../models/funcao_prestador_models.dart';
import 'funcao_prestador_controller.dart';

class FuncaoPrestadorService {
  FuncaoPrestadorController funcaoPrestadorController = FuncaoPrestadorController();

  Future<FuncaoPrestadorModel?> criarFuncaoPrestador(
      {required FuncaoPrestadorModel funcaoPrestadorModel}) async {
    try {
      int? insertedID = await funcaoPrestadorController.create(
        nomeFuncao: funcaoPrestadorModel.nomeFuncao,
        descricaoFuncao: funcaoPrestadorModel.descricaoFuncao,
      );

      if (insertedID != null) {
        FuncaoPrestadorModel? funcaoPrestadorModel =
            await funcaoPrestadorController.readByID(idFuncao: insertedID);
        return funcaoPrestadorModel;
      } else {
        throw Exception("Erro ao criar função prestador ");
      }
    } catch (e) {
      throw Exception("Erro ao criar função prestador ");
    }
  }

  Future<FuncaoPrestadorModel?> buscarFuncaoPrestador(int idFuncao) async {
    try {
      return funcaoPrestadorController.readByID(
        idFuncao: idFuncao,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarFuncaoPrestador(
      {required FuncaoPrestadorModel funcaoPrestadorModel, required int idFuncao}) async {
    try {
      var reult = await funcaoPrestadorController.update(
        nomeFuncao: funcaoPrestadorModel.nomeFuncao,
        descricaoFuncao: funcaoPrestadorModel.descricaoFuncao,
        idFuncao: idFuncao,
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

  Future<int?> deletarFuncaoPrestador(int funcaoID) async {
    try {
      int? id = await funcaoPrestadorController.delete(
        idFuncao: funcaoID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir função prestador ");
    }
  }

  Future<List<FuncaoPrestadorModel>> listarFuncaoPrestador() async {
    try {
      return await funcaoPrestadorController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarFuncaoPrestadorPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return funcaoPrestadorController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
