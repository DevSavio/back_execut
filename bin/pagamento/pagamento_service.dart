import '../models/pagamento_models.dart';
import 'pagamento_controller.dart';

class PagamentoService {
  PagamentoController pagamentoController = PagamentoController();

  Future<PagamentoModel?> criarPagamento(
      {required PagamentoModel pagamentoModel}) async {
    try {
      int? insertedID = await pagamentoController.create(
        tipoPagamento: pagamentoModel.tipoPagamento,
        moeda: pagamentoModel.moeda,
      );

      if (insertedID != null) {
        PagamentoModel? pagamentoModel =
            await pagamentoController.readByID(idPagamento: insertedID);
        return pagamentoModel;
      } else {
        throw Exception("Erro ao criar pagamento");
      }
    } catch (e) {
      throw Exception("Erro ao criar pagamento");
    }
  }

  Future<PagamentoModel?> buscarPagamento(int idPagamento) async {
    try {
      return pagamentoController.readByID(
        idPagamento: idPagamento,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarPagamento(
      {required PagamentoModel pagamentoModel, required int idPagamento}) async {
    try {
      var reult = await pagamentoController.update(
       tipoPagamento: pagamentoModel.tipoPagamento,
       moeda: pagamentoModel.moeda,
       idPagamento: idPagamento,
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

  Future<int?> deletarPagamento(int pagamentoID) async {
    try {
      int? id = await pagamentoController.delete(
        idPagamento: pagamentoID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir cliente ");
    }
  }

  Future<List<PagamentoModel>> listarPagamentos() async {
    try {
      return await pagamentoController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarPagamentoPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return pagamentoController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
