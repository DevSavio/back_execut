import 'package:shelf_plus/shelf_plus.dart';
import "../models/tipo_mao_de_obra_models.dart";
import "../tipo_mao_de_obra/tipo_mao_de_obra_service.dart";

class TipoMaoDeObraRoute {
  RouterPlus router = RouterPlus();
  TipoMaoDeObraService tipoMaoDeObraService = TipoMaoDeObraService();

  TipoMaoDeObraRoute({required this.router});

  RouterPlus init() {
    /// List all tipoMaoDeObra
    router.get('/tipoMaoDeObras', () {
      final data = tipoMaoDeObraService.listarTipoMaoDeObras();
      return data;
    });

    /// Get specific tipoMaoDeObra by id
    router.get('/tipoMaoDeObra2/<id>', (Request request, String id) {
      final data = tipoMaoDeObraService.buscarTipoMaoDeObra(int.parse(id));
      return data;
    });

    /// Add a new tipoMaoDeObras
    router.post('/tipoMaoDeObra', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TipoMaoDeObraModel novoTipoMaoDeObra = TipoMaoDeObraModel.fromJson(body);

        TipoMaoDeObraModel? tipoMaoDeObraAdicionado =
            await tipoMaoDeObraService.criarTipoMaoDeObra(tipoMaoDeObraModel: novoTipoMaoDeObra);

        if (tipoMaoDeObraAdicionado != null) {
          return {
            'ok': 'true',
            'tipoMaoDeObraAdicionado': tipoMaoDeObraAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoMaoDeObra');
      }
    });

    /// delete a new tipoMaoDeObra
    router.delete('/tipoMaoDeObra/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await tipoMaoDeObraService
            .deletarTipoMaoDeObra(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'tipoMaoDeObra_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'tipoMaoDeObra_excluido': "Tipo mão de obra não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoMaoDeObra');
      }
    });

    /// update a tipoMaoDeObras
    router.post('/tipoMaoDeObra/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TipoMaoDeObraModel novoTipoMaoDeObra = TipoMaoDeObraModel.fromJson(body);

        var tipoMaoDeObraAtualizado = await tipoMaoDeObraService.atualizarTipoMaoDeObra(
          tipoMaoDeObraModel: novoTipoMaoDeObra,
          idTipo: int.parse(
            request.params['id']!,
          ),
        );

        if (tipoMaoDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'tipoMaoDeObraAlterado': tipoMaoDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoMaoDeObra');
      }
    });

    /// buscar tipoMaoDeObras por qualquer campo
    router.get('/tipoMaoDeObra/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var tipoMaoDeObraAtualizado = await tipoMaoDeObraService.buscarTipoMaoDeObraPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (tipoMaoDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'tipoMaoDeObraAlterado': tipoMaoDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoMaoDeObra');
      }
    });

    return router;
  }
}
