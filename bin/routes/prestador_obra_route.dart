import 'package:shelf_plus/shelf_plus.dart';

import '../models/prestador_obra_models.dart';
import '../prestador_obra/prestador_obra_service.dart';

class PrestadorObraRoute {
  RouterPlus router = RouterPlus();
  PrestadorObraService prestadorObraService = PrestadorObraService();

  PrestadorObraRoute({required this.router});

  RouterPlus init() {
    /// List all prestadorObra
    router.get('/prestadorObras', () {
      final data = prestadorObraService.listarPrestadorObras();
      return data;
    });

    /// Get specific prestadorObra by id
    router.get('/prestadorObra2/<id>', (Request request, String id) {
      final data = prestadorObraService.buscarPrestadorObra(int.parse(id));
      return data;
    });

    /// Add a new prestadorObras
    router.post('/prestadorObra', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        PrestadorObraModel novoPrestadorObra = PrestadorObraModel.fromJson(body);

        PrestadorObraModel? prestadorObraAdicionado =
            await prestadorObraService.criarPrestadorObra(prestadorObraModel: novoPrestadorObra);

        if (prestadorObraAdicionado != null) {
          return {
            'ok': 'true',
            'prestadorObraAdicionado': prestadorObraAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar prestadorObra');
      }
    });

    /// delete a new prestadorObra
    router.delete('/prestadorObra/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await prestadorObraService
            .deletarPrestadorObra(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'prestadorObra_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'prestadorObra_excluido': "PrestadorObra não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar prestadorObra');
      }
    });

    /// update a prestadorObras
    router.post('/prestadorObra/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        PrestadorObraModel novoPrestadorObra = PrestadorObraModel.fromJson(body);

        var prestadorObraAtualizado = await prestadorObraService.atualizarPrestadorObra(
          prestadorObraModel: novoPrestadorObra,
          idPrestadorObra: int.parse(
            request.params['id']!,
          ),
        );

        if (prestadorObraAtualizado != null) {
          return {
            'ok': 'true',
            'prestadorObraAlterado': prestadorObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar prestadorObra');
      }
    });

    /// buscar prestadorObras por qualquer campo
    router.get('/prestadorObra/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var prestadorObraAtualizado = await prestadorObraService.buscarPrestadorObraPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (prestadorObraAtualizado != null) {
          return {
            'ok': 'true',
            'prestadorObraAlterado': prestadorObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar prestadorObra');
      }
    });

    return router;
  }
}
