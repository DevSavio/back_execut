import 'package:shelf_plus/shelf_plus.dart';

import '../models/origem_recurso_models.dart';
import '../origem_recurso/origem_recurso_service.dart';

class OrigemRecursoRoute {
  RouterPlus router = RouterPlus();
  OrigemRecursoService origemRecursoService = OrigemRecursoService();

  OrigemRecursoRoute({required this.router});

  RouterPlus init() {
    /// List all origemRecurso
    router.get('/origemRecurso', () {
      final data = origemRecursoService.listarOrigemRecurso();
      return data;
    });

    /// Get specific origemRecurso by id
    router.get('/origemRecurso/<id>', (Request request, String id) {
      final data = origemRecursoService.buscarOrigemRecurso(int.parse(id));
      return data;
    });

    /// Add a new origemRecursos
    router.post('/origemRecurso', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        OrigemRecursoModel novoOrigemRecurso = OrigemRecursoModel.fromJson(body);

        OrigemRecursoModel? origemRecursoAdicionado =
            await origemRecursoService.criarOrigemRecurso(origemRecursoModel: novoOrigemRecurso);

        if (origemRecursoAdicionado != null) {
          return {
            'ok': 'true',
            'origemRecursoAdicionado': origemRecursoAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// delete a new origemRecurso
    router.delete('/origemRecurso/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await origemRecursoService
            .deletarOrigemRecurso(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'cliente_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'cliente_excluido': "Cliente não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// update a origemRecurso
    router.post('/origemRecurso/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        OrigemRecursoModel novoOrigemRecurso = OrigemRecursoModel.fromJson(body);

        var origemRecursoAtualizado = await origemRecursoService.atualizarOrigemRecurso(
          origemRecursoModel: novoOrigemRecurso,
          idOrigem: int.parse(
            request.params['id']!,
          ),
        );

        if (origemRecursoAtualizado != null) {
          return {
            'ok': 'true',
            'origemRecursoAlterado': origemRecursoAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar origem recurso');
      }
    });

    /// buscar origemRecurso por qualquer campo
    router.get('/origemRecurso/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var origemRecursoAtualizado = await origemRecursoService.buscarOrigemRecursoPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (origemRecursoAtualizado != null) {
          return {
            'ok': 'true',
            'origemRecursoAlterado': origemRecursoAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar origem recurso');
      }
    });

    return router;
  }
}
