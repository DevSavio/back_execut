import '../models/usuario_models.dart';
import 'usuario_controller.dart';

class UsuarioService {
  UsuarioController usuarioController = UsuarioController();

  Future<UsuarioModel?> criarUsuario(
      {required UsuarioModel usuarioModel}) async {
    try {
      int? insertedID = await usuarioController.create(
        cpfCnpj: usuarioModel.cpfCnpj,
        nomeUsuario: usuarioModel.nomeUsuario,
        razaoSocial: usuarioModel.razaoSocial,
        telefone: usuarioModel.telefone,
        idEndereco: usuarioModel.idEndereco
      );

      if (insertedID != null) {
        UsuarioModel? usuarioModel =
            await usuarioController.readByID(idUsuario: insertedID);
        return usuarioModel;
      } else {
        throw Exception("Erro ao criar cliente ");
      }
    } catch (e) {
      throw Exception("Erro ao criar cliente ");
    }
  }

  Future<UsuarioModel?> buscarUsuario(int idUsuario) async {
    try {
      return usuarioController.readByID(
        idUsuario: idUsuario,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> atualizarUsuario(
      {required UsuarioModel usuarioModel, required int idUsuario}) async {
    try {
      var reult = await usuarioController.update(
        cpfCnpj: usuarioModel.cpfCnpj,
        nomeUsuario: usuarioModel.nomeUsuario,
        razaoSocial: usuarioModel.razaoSocial,
        telefone: usuarioModel.telefone,
        idUsuario: idUsuario,
        idEndereco: usuarioModel.idEndereco
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

  Future<int?> deletarUsuario(int usuarioID) async {
    try {
      int? id = await usuarioController.delete(
        idUsuario: usuarioID,
      );
      if (id != null) {
        return id;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception("Erro ao excluir Usuário");
    }
  }

  Future<List<UsuarioModel>> listarUsuarios() async {
    try {
      return await usuarioController.list();
    } catch (e) {
      rethrow;
    }
  }

  dynamic buscarUsuarioPorNome({
    required String operator,
    required String value,
    required String paramter,
  }) {
    return usuarioController.search(
        operator: operator, value: value, paramter: paramter);
  }
}
