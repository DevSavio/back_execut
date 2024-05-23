import 'package:shelf_plus/shelf_plus.dart';
import "../obra/obra_service.dart";
import "../models/obra_models.dart";

class ObraRoute {
  RouterPlus router = RouterPlus();
  ObraService obraService = ObraService();

  ObraRoute({required this.router});

  RouterPlus init() {
    /// List all obra
    router.get('/obras', () {
      final data = obraService.listarObras();
      return data;
    });

    /// Get specific obra by id
    router.get('/obra2/<id>', (Request request, String id) {
      final data = obraService.buscarObra(int.parse(id));
      return data;
    });

    /// Add a new obras
    router.post('/obra', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        ObraModel novoObra = ObraModel.fromJson(body);

        ObraModel? obraAdicionado =
            await obraService.criarObra(obraModel: novoObra);

        if (obraAdicionado != null) {
          return {
            'ok': 'true',
            'obraAdicionado': obraAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar obra');
      }
    });

    /// delete a new obra
    router.delete('/obra/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await obraService
            .deletarObra(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'obra_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'obra_excluido': "Obra não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar obra');
      }
    });

    /// update a obras
    router.post('/obra/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        ObraModel novoObra = ObraModel.fromJson(body);

        var obraAtualizado = await obraService.atualizarObra(
          obraModel: novoObra,
          idObra: int.parse(
            request.params['id']!,
          ),
        );

        if (obraAtualizado != null) {
          return {
            'ok': 'true',
            'obraAlterado': obraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar obra');
      }
    });

    /// buscar obras por qualquer campo
    router.get('/obra/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var obraAtualizado = await obraService.buscarObraPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (obraAtualizado != null) {
          return {
            'ok': 'true',
            'obraAlterado': obraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar obra');
      }
    });

    return router;
  }
}
