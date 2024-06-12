import '../models/custo_prestador_models.dart';
import 'custo_prestador_controller.dart';

class CustoPrestadorService {
  CustoPrestadorController custoPrestadorController =
      CustoPrestadorController();

  Future<CustoPrestadorModel?> criarCustoPrestador(
      {required CustoPrestadorModel custoPrestadorModel}) async {
    try {
      int? insertedID = await custoPrestadorController.create(
        valor: custoPrestadorModel.valor,
        idPrestador: custoPrestadorModel.prestador.idPrestador!,
        idFuncao: custoPrestadorModel.funcao.idFuncao!,
      );

      if (insertedID != null) {
        CustoPrestadorModel? custoPrestadorModel =
            await custoPrestadorController.readByID(idCusto: insertedID);
        return custoPrestadorModel;
      } else {
        throw Exception("Erro ao criar cliente ");
      }
    } catch (e) {
      throw Exception("Erro ao criar cliente ");
    }
  }

  Future<CustoPrestadorModel?> buscarCustoPrestador(int idCusto) async {
    try {
      return custoPrestadorController.readByID(
        idCusto: idCusto,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarCustoPrestador(
    {required CustoPrestadorModel custoPrestadorModel, required int idCusto}) async {
    try {
      var result = await custoPrestadorController.update(
        valor: custoPrestadorModel.valor,
       idPrestador: custoPrestadorModel.prestador.idPrestador!,
        idFuncao: custoPrestadorModel.funcao.idFuncao!,
        idCusto: idCusto,
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
   
  Future<int?> deletarCustoPrestador(int custoID) async {
    try {
      int? id = await custoPrestadorController.delete(
        idCusto: custoID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir custo prestador");
    }
  }

  Future<List<CustoPrestadorModel>> listarCustoPrestador() async {
    try {
      return await custoPrestadorController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarCustoPrestadorPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return custoPrestadorController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
