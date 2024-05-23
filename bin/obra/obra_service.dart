import '../models/obra_models.dart';
import 'obra_controller.dart';

class ObraService {
  ObraController obraController = ObraController();

  Future<ObraModel?> criarObra(
      {required ObraModel obraModel}) async {
    try {
      int? insertedID = await obraController.create(
        complemento: obraModel.complemento,
        dataFim: obraModel.dataFim,
        dataInicio: obraModel.dataInicio,
        responsavelObra: obraModel.responsavelObra,
        logradouro: obraModel.logradouro,
        valorFinal: obraModel.valorFinal,
        idCliente: obraModel.idCliente,
        idPagamento: obraModel.idPagamento,
        idPrestador: obraModel.idPrestador,
        idTempo: obraModel.idTempo,
      );

      if (insertedID != null) {
        ObraModel? obraModel =
            await obraController.readByID(idObra: insertedID);
        return obraModel;
      } else {
        throw Exception("Erro ao criar obra ");
      }
    } catch (e) {
      throw Exception("Erro ao criar obra ");
    }
  }

  Future<ObraModel?> buscarObra(int idObra) async {
    try {
      return obraController.readByID(
        idObra: idObra,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarObra(
      {required ObraModel obraModel, required int idObra}) async {
    try {
      var reult = await obraController.update(
       complemento: obraModel.complemento,
        dataFim: obraModel.dataFim,
        dataInicio: obraModel.dataInicio,
        responsavelObra: obraModel.responsavelObra,
        logradouro: obraModel.logradouro,
        valorFinal: obraModel.valorFinal,
        idCliente: obraModel.idCliente,
        idPagamento: obraModel.idPagamento,
        idPrestador: obraModel.idPrestador,
        idTempo: obraModel.idTempo,
        idObra: obraModel.idObra,
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

  Future<int?> deletarObra(int obraID) async {
    try {
      int? id = await obraController.delete(
        idObra: obraID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir obra ");
    }
  }

  Future<List<ObraModel>> listarObras() async {
    try {
      return await obraController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarObraPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return obraController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
