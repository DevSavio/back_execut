import '../models/custo_prestador_models.dart';
import 'custo_prestador_controller.dart';

class CustoPrestadorService {
  CustoPrestadorController custoPrestadorController = CustoPrestadorController();

  bool criarCustoPrestador() {
    custoPrestadorController.create(
      valor: 200.00,
      idFuncao: 1,
      idPrestador: 1,
    );
    return true;
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

  // Future<CustoPrestadorModel> atualizarCustoPrestador
  bool atualizarCustoPrestador() {
    custoPrestadorController.update(
        valor: 250.00,
        idFuncao: 1,
        idPrestador: 1,
        idCusto: 1,
    ); 
    return true;
  } 
  //   try {
  //     custoPrestadorController.update(
  //       valor: 250.00,
  //       idFuncao: 1,
  //       idPrestador: 1,
  //       idCusto: 1,
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  bool deletarCliente() {
    custoPrestadorController.delete(
              idCusto: 1,
    );
    return true;
  }

  Future<List<CustoPrestadorModel>> listarClientes() async {
    try {
      return await custoPrestadorController.list();
    } catch (e) {
      rethrow;
    }
  }

// Future<List<CustoPrestadorModel>> buscarCustoPrestadorPorNome
  bool buscarCustoPrestadorPorNome() {
    custoPrestadorController.search(
        operator: "like", value: "'%Jo%'", paramter: "nomeCliente");
    return true;
  }
}
