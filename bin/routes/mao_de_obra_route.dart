import 'package:shelf_plus/shelf_plus.dart';
import "../mao_de_obra/mao_de_obra_service.dart";
import '../models/mao_de_obra_models.dart';

class MaoDeObraRoute {
  RouterPlus router = RouterPlus();
  MaoDeObraService maoDeObraService = MaoDeObraService();

  MaoDeObraRoute({required this.router});

  RouterPlus init() {
    /// List all maoDeObra
    router.get('/maoDeObras', () {
      final data = maoDeObraService.listarMaoDeObras();
      return data;
    });

    /// Get specific maoDeObra by id
    router.get('/maoDeObra/<id>', (Request request, String id) {
      final data = maoDeObraService.buscarMaoDeObra(int.parse(id));
      return data;
    });

    /// Add a new maoDeObras
    router.post('/maoDeObra', (Request request) async {
      try {
       dynamic body = await request.body.asJson;

        MaoDeObraModel novoMaoDeObra = MaoDeObraModel.fromJson(body);

        MaoDeObraModel? maoDeObraAdicionado =
            await maoDeObraService.criarMaoDeObra(maoDeObraModel: novoMaoDeObra);

        if (maoDeObraAdicionado != null) {
          return {
            'ok': 'true',
            'maoDeObraAdicionado': maoDeObraAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar mão de obra');
      }
    });

    /// delete a new maoDeObra
    router.delete('/maoDeObra/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await maoDeObraService
            .deletarMaoDeObra(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'maoDeObra_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'maoDeObra_excluido': "Mão de obra não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar mão de obra');
      }
    });

    /// update a maoDeObras
    router.post('/maoDeObra/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        MaoDeObraModel novoMaoDeObra = MaoDeObraModel.fromJson(body);

        var maoDeObraAtualizado = await maoDeObraService.atualizarMaoDeObra(
          maoDeObraModel: novoMaoDeObra,
          idMao: int.parse(
            request.params['id']!,
          ),
        );

        if (maoDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'maoDeObraAlterado': maoDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar mão de obra');
      }
    });

    /// buscar maoDeObras por qualquer campo
    router.get('/maoDeObra/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var maoDeObraAtualizado = await maoDeObraService.buscarMaoDeObraPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (maoDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'maoDeObraAlterado': maoDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar mão de obra');
      }
    });

    return router;
  }
}
