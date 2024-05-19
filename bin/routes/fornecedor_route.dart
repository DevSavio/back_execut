import 'package:shelf_plus/shelf_plus.dart';
import "../fornecedor/fornecedor_service.dart";
import '../models/fornecedor_models.dart';

class FornecedorRoute {
  RouterPlus router = RouterPlus();
  FornecedorService fornecedorService = FornecedorService();

  FornecedorRoute({required this.router});

  RouterPlus init() {
    /// List all
    router.get('/fornecedores', () {
      final data = fornecedorService.listarFornecedores();
      return data;
    });

    /// Get specific fornecedor by id
    router.get('/fornecedor2/<id>', (Request request, String id) {
      final data = fornecedorService.buscarFornecedor(int.parse(id));
      return data;
    });

    /// Add a new fornecedor
    router.post('/fornecedor', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        FornecedorModel novoFornecedor = FornecedorModel.fromJson(body);

        FornecedorModel? fornecedorAdicionado =
            await fornecedorService.criarFornecedor(fornecedorModel: novoFornecedor);

        if (fornecedorAdicionado != null) {
          return {
            'ok': 'true',
            'fornecedorAdicionado': fornecedorAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar fornecedor');
      }
    });

    /// delete a new fornecedor
    router.delete('/fornecedor/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await fornecedorService
            .deletarFornecedor(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'fornecedor_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'fornecedor_excluido': "Fornecedor não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar fornecedor');
      }
    });

    /// update a fornecedor
    router.post('/fornecedor/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        FornecedorModel novoFornecedor = FornecedorModel.fromJson(body);

        var fornecedorAtualizado = await fornecedorService.atualizarFornecedor(
          fornecedorModel: novoFornecedor,
          idFornecedor: int.parse(
            request.params['id']!,
          ),
        );

        if (fornecedorAtualizado != null) {
          return {
            'ok': 'true',
            'fornecedorAlterado': fornecedorAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// buscar fornecedor por qualquer campo
    router.get('/cliente/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var fornecedorAtualizado = await fornecedorService.buscarFornecedorPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (fornecedorAtualizado != null) {
          return {
            'ok': 'true',
            'clienteAlterado': fornecedorAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    return router;
  }
}
