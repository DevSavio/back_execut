import 'package:shelf_plus/shelf_plus.dart';
import "../pagamento/pagamento_service.dart";
import "../models/pagamento_models.dart";

class PagamentoRoute {
  RouterPlus router = RouterPlus();
  PagamentoService pagamentoService = PagamentoService();

  PagamentoRoute({required this.router});

  RouterPlus init() {
    /// List all pagamento
    router.get('/pagamentos', () {
      final data = pagamentoService.listarPagamentos();
      return data;
    });

    /// Get specific pagamento by id
    router.get('/pagamento/<id>', (Request request, String id) {
      final data = pagamentoService.buscarPagamento(int.parse(id));
      return data;
    });

    /// Add a new pagamentos
    router.post('/pagamento', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        PagamentoModel novoPagamento = PagamentoModel.fromJson(body);

        PagamentoModel? pagamentoAdicionado =
            await pagamentoService.criarPagamento(pagamentoModel: novoPagamento);

        if (pagamentoAdicionado != null) {
          return {
            'ok': 'true',
            'pagamentoAdicionado': pagamentoAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar pagamento');
      }
    });

    /// delete a new pagamento
    router.delete('/pagamento/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await pagamentoService
            .deletarPagamento(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'pagamento_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'pagamento_excluido': "Pagamento não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar pagamento');
      }
    });

    /// update a pagamentos
    router.post('/pagamento/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        PagamentoModel novoPagamento = PagamentoModel.fromJson(body);

        var pagamentoAtualizado = await pagamentoService.atualizarPagamento(
          pagamentoModel: novoPagamento,
          idPagamento: int.parse(
            request.params['id']!,
          ),
        );

        if (pagamentoAtualizado != null) {
          return {
            'ok': 'true',
            'pagamentoAlterado': pagamentoAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar pagamento');
      }
    });

    /// buscar pagamentos por qualquer campo
    router.get('/pagamento/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var pagamentoAtualizado = await pagamentoService.buscarPagamentoPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (pagamentoAtualizado != null) {
          return {
            'ok': 'true',
            'pagamentoAlterado': pagamentoAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar pagamento');
      }
    });

    return router;
  }
}
