import 'package:shelf_plus/shelf_plus.dart';
import "../models/tipo_de_fornecedor_models.dart";
import "../tipo_de_fornecedor/tipo_de_fornecedor_service.dart";

class TipoDeFornecedorRoute {
  RouterPlus router = RouterPlus();
  TipoDeFornecedorService tipoDeFornecedorService = TipoDeFornecedorService();

  TipoDeFornecedorRoute({required this.router});

  RouterPlus init() {
    /// List all tipoDeFornecedor
    router.get('/tipoDeFornecedores', () {
      final data = tipoDeFornecedorService.listarTipoDeFornecedores();
      return data;
    });

    /// Get specific tipoDeFornecedor by id
    router.get('/tipoDeFornecedor/<id>', (Request request, String id) {
      final data = tipoDeFornecedorService.buscarTipoDeFornecedor(int.parse(id));
      return data;
    });

    /// Add a new tipoDeFornecedors
    router.post('/tipoDeFornecedor', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TipoDeFornecedorModel novoTipoDeFornecedor = TipoDeFornecedorModel.fromJson(body);

        TipoDeFornecedorModel? tipoDeFornecedorAdicionado =
            await tipoDeFornecedorService.criarTipoDeFornecedor(tipoDeFornecedorModel: novoTipoDeFornecedor);

        if (tipoDeFornecedorAdicionado != null) {
          return {
            'ok': 'true',
            'tipoDeFornecedorAdicionado': tipoDeFornecedorAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoDeFornecedor');
      }
    });

    /// delete a new tipoDeFornecedor
    router.delete('/tipoDeFornecedor/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await tipoDeFornecedorService
            .deletarTipoDeFornecedor(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'tipoDeFornecedor_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'tipoDeFornecedor_excluido': "Cliente não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoDeFornecedor');
      }
    });

    /// update a tipoDeFornecedors
    router.post('/tipoDeFornecedor/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        TipoDeFornecedorModel novoTipoDeFornecedor = TipoDeFornecedorModel.fromJson(body);

        var tipoDeFornecedorAtualizado = await tipoDeFornecedorService.atualizarTipoDeFornecedor(
          tipoDeFornecedorModel: novoTipoDeFornecedor,
          idTipo: int.parse(
            request.params['id']!,
          ),
        );

        if (tipoDeFornecedorAtualizado != null) {
          return {
            'ok': 'true',
            'tipoDeFornecedorAlterado': tipoDeFornecedorAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoDeFornecedor');
      }
    });

    /// buscar tipoDeFornecedors por qualquer campo
    router.get('/tipoDeFornecedor/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var tipoDeFornecedorAtualizado = await tipoDeFornecedorService.buscarTipoDeFornecedorPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (tipoDeFornecedorAtualizado != null) {
          return {
            'ok': 'true',
            'tipoDeFornecedorAlterado': tipoDeFornecedorAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar tipoDeFornecedor');
      }
    });

    return router;
  }
}
