import 'package:shelf_plus/shelf_plus.dart';

import '../models/usuario_models.dart';
import '../usuario/usuario_service.dart';

class UsuarioRoute {
  RouterPlus router = RouterPlus();
  UsuarioService usuarioService = UsuarioService();

  UsuarioRoute({required this.router});

  RouterPlus init() {
    /// List all usuario
    router.get('/usuarios', () {
      final data = usuarioService.listarUsuarios();
      return data;
    });

    /// Get specific usuario by id
    router.get('/usuario/<id>', (Request request, String id) {
      final data = usuarioService.buscarUsuario(int.parse(id));
      return data;
    });

    /// Add a new usuarios
    router.post('/usuario', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        UsuarioModel novoUsuario = UsuarioModel.fromJson(body);

        UsuarioModel? usuarioAdicionado =
            await usuarioService.criarUsuario(usuarioModel: novoUsuario);

        if (usuarioAdicionado != null) {
          return {
            'ok': 'true',
            'usuarioAdicionado': usuarioAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar usuario');
      }
    });

    /// delete a new usuario
    router.delete('/usuario/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await usuarioService
            .deletarUsuario(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'usuario_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'usuario_excluido': "Usuario não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar usuario');
      }
    });

    /// update a usuarios
    router.post('/usuario/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        UsuarioModel novoUsuario = UsuarioModel.fromJson(body);

        var usuarioAtualizado = await usuarioService.atualizarUsuario(
          usuarioModel: novoUsuario,
          idUsuario: int.parse(
            request.params['id']!,
          ),
        );

        if (usuarioAtualizado != null) {
          return {
            'ok': 'true',
            'usuarioAlterado': usuarioAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar usuario');
      }
    });

    /// buscar usuarios por qualquer campo
    router.get('/usuario/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var usuarioAtualizado = await usuarioService.buscarUsuarioPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (usuarioAtualizado != null) {
          return {
            'ok': 'true',
            'usuarioAlterado': usuarioAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar usuario');
      }
    });

    return router;
  }
}
