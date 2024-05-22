import 'package:shelf_plus/shelf_plus.dart';
import "../models/tempo_de_obra_models.dart";
import "../tempo_de_obra/tempo_de_obra_service.dart";

class TempoDeObraRoute {
  RouterPlus router = RouterPlus();
  TempoDeObraService tempoDeObraService = TempoDeObraService();

  TempoDeObraRoute({required this.router});

  RouterPlus init() {
    /// List all tempoDeObra
    router.get('/tempoDeObras', () {
      final data = tempoDeObraService.listarTempoDeObras();
      return data;
    });

    /// Get specific tempoDeObra by id
    router.get('/tempoDeObra2/<id>', (Request request, String id) {
      final data = tempoDeObraService.buscarTempoDeObra(int.parse(id));
      return data;
    });

    /// Add a new tempoDeObras
    router.post('/tempoDeObra', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TempoDeObraModel novoTempoDeObra = TempoDeObraModel.fromJson(body);

        TempoDeObraModel? tempoDeObraAdicionado =
            await tempoDeObraService.criarTempoDeObra(tempoDeObraModel: novoTempoDeObra);

        if (tempoDeObraAdicionado != null) {
          return {
            'ok': 'true',
            'tempo De Obra Adicionado': tempoDeObraAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tempoDeObra');
      }
    });

    /// delete a new tempoDeObra
    router.delete('/tempoDeObra/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await tempoDeObraService
            .deletarTempoDeObra(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'tempoDeObra_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'tempoDeObra_excluido': "Tempo De Obra não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tempo De Obra');
      }
    });

    /// update a tempoDeObras
    router.post('/tempoDeObra/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TempoDeObraModel novoTempoDeObra = TempoDeObraModel.fromJson(body);

        var tempoDeObraAtualizado = await tempoDeObraService.atualizarTempoDeObra(
          tempoDeObraModel: novoTempoDeObra,
          idTempoDeObra: int.parse(
            request.params['id']!,
          ),
        );

        if (tempoDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'tempoDeObra Alterado': tempoDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tempoDeObra');
      }
    });

    /// buscar tempoDeObras por qualquer campo
    router.get('/tempoDeObra/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var tempoDeObraAtualizado = await tempoDeObraService.buscarTempoDeObraPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (tempoDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'tempoDeObraAlterado': tempoDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tempoDeObra');
      }
    });

    return router;
  }
}
