// ignore_for_file: unnecessary_null_comparison

import 'package:shelf_plus/shelf_plus.dart';
import "../models/tipo_de_obra_models.dart";
import "../tipo_mao_de_obra/tipo_mao_de_obra_service.dart";

class TipoDeObraRoute {
  RouterPlus router = RouterPlus();
  TipoDeObraService tipoDeObraService = TipoDeObraService();

  TipoDeObraRoute({required this.router});

  RouterPlus init() {
    /// List all tipoMaoDeObra
    router.get('/tipoDeObras', () {
      final data = tipoDeObraService.listarTipoDeObras();
      return data;
    });

    /// Get specific tipoMaoDeObra by id
    router.get('/tipoMaoDeObra2/<id>', (Request request, String id) {
      final data = tipoDeObraService.buscarTipoDeObra(int.parse(id));
      return data;
    });

    /// Add a new tipoMaoDeObras
    router.post('/tipoMaoDeObra', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TipoDeObraModel novoTipoDeObra = TipoDeObraModel.fromJson(body);

        TipoDeObraModel? tipoDeObraAdicionado =
            await tipoDeObraService.criarTipoDeObra(tipoDeObraModel: novoTipoDeObra);

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
    router.delete('/tipoDeObra/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await tipoDeObraService
            .deletarTipoDeObra(int.parse(request.params['id']!));
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
    router.post('/tipoDeObra/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TipoDeObraModel novoTipoDeObra = TipoDeObraModel.fromJson(body);

        var tipoDeObraAtualizado = await tipoDeObraService.atualizarTipoDeObra(
          tipoDeObraModel: novoTipoDeObra,
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
    router.get('/tipoDeObra/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var tipoDeObraAtualizado = await tipoDeObraService.buscarTipoDeObraPorNome(
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
        return Response.internalServerError(body: 'Erro ao criar tipoDeObra');
      }
    });

    return router;
  }
}
