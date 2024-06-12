// ignore_for_file: unnecessary_null_comparison

import 'package:shelf_plus/shelf_plus.dart';

import '../models/tipo_mao_de_obra_models.dart';
import '../tipo_mao_de_obra/tipo_mao_de_obra_service.dart';

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
    router.get('/tipoMaoDeObra/<id>', (Request request, String id) {
      final data = tipoMaoDeObraService.buscarTipoMaoDeObra(int.parse(id));
      return data;
    });

    /// Add a new tipoMaoDeObras
    router.post('/tipoMaoDeObra', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TipoMaoDeObraModel novoTipoMaoDeObra = TipoMaoDeObraModel.fromJson(body);

        TipoMaoDeObraModel? tipoDeObraAdicionado =
            await tipoMaoDeObraService.criarTipoMaoDeObra(tipoMaoDeObraModel: novoTipoMaoDeObra);

        if (tipoDeObraAdicionado != null) {
          return {
            'ok': 'true',
            'tipoDeObraAdicionado': tipoDeObraAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoDeObra');
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
            'tipoDeObra_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'tipoDeObra_excluido': "Tipo de obra não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoDeObra');
      }
    });

    /// update a tipoMaoDeObras
    router.post('/tipoMaoDeObra/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TipoMaoDeObraModel novoTipoMaoDeObra = TipoMaoDeObraModel.fromJson(body);

        var tipoDeObraAtualizado = await tipoMaoDeObraService.atualizarTipoMaoDeObra(
          tipoMaoDeObraModel: novoTipoMaoDeObra,
          idTipo: int.parse(
            request.params['id']!,
          ),
        );

        if (tipoDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'tipoDeObraAlterado': tipoDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoDeObra');
      }
    });

    /// buscar tipoMaoDeObras por qualquer campo
    router.get('/tipoMaoDeObra/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var tipoDeObraAtualizado = await tipoMaoDeObraService.buscarTipoMaoDeObraPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (tipoDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'tipoDeObraAlterado': tipoDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoMaoDeObra');
      }
    });

    return router;
  }
}
