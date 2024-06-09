import 'package:shelf_plus/shelf_plus.dart';
import "../material_de_obra/material_de_obra_service.dart";
import '../models/material_de_obra_models.dart';

class MaterialDeObraRoute {
  RouterPlus router = RouterPlus();
  MaterialDeObraService materialDeObraService = MaterialDeObraService();

  MaterialDeObraRoute({required this.router});

  RouterPlus init() {
    /// List all materialDeObra
    router.get('/materialDeObras', () {
      final data = materialDeObraService.listarMaterialDeObras();
      return data;
    });

    /// Get specific materialDeObra by id
    router.get('/materialDeObra/<id>', (Request request, String id) {
      final data = materialDeObraService.buscarMaterialDeObra(int.parse(id));
      return data;
    });

    /// Add a new materialDeObras
    router.post('/materialDeObra', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        MaterialDeObraModel novoMaterialDeObra = MaterialDeObraModel.fromJson(body);

        MaterialDeObraModel? materialDeObraAdicionado =
            await materialDeObraService.criarMaterialDeObra(materialDeObraModel: novoMaterialDeObra);

        if (materialDeObraAdicionado != null) {
          return {
            'ok': 'true',
            'materialDeObraAdicionado': materialDeObraAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar material De Obra');
      }
    });

    /// delete a new materialDeObra
    router.delete('/materialDeObra/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await materialDeObraService
            .deletarMaterialDeObra(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'materialDeObra_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'materialDeObra_excluido': "Material De Obra não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar material De Obra');
      }
    });

    /// update a materialDeObras
    router.post('/materialDeObra/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        MaterialDeObraModel novoMaterialDeObra = MaterialDeObraModel.fromJson(body);

        var materialDeObraAtualizado = await materialDeObraService.atualizarMaterialDeObra(
          materialDeObraModel: novoMaterialDeObra,
          idMaterial: int.parse(
            request.params['id']!,
          ),
        );

        if (materialDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'materialDeObraAlterado': materialDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar material De Obra');
      }
    });

    /// buscar materialDeObras por qualquer campo
    router.get('/materialDeObra/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var materialDeObraAtualizado = await materialDeObraService.buscarMaterialDeObraPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (materialDeObraAtualizado != null) {
          return {
            'ok': 'true',
            'materialDeObraAlterado': materialDeObraAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar material De Obra');
      }
    });

    return router;
  }
}
