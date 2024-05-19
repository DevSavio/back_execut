import 'package:shelf_plus/shelf_plus.dart';
import '../custo_prestador/custo_prestador_service.dart';
import '../models/custo_prestador_models.dart';

class CustoPrestadorRoute {
  RouterPlus router = RouterPlus();
 CustoPrestadorService custoPrestadorService = CustoPrestadorService();

  CustoPrestadorRoute({required this.router});

  RouterPlus init() {
    /// List all custo_prestador
    router.get('/custo_prestadores', () {
      final data = custoPrestadorService.listarCustoPrestador();
      return data;
    });

    /// Get specific custo_prestador by id
    router.get('/custo_prestador2/<id>', (Request request, String id) {
      final data = custoPrestadorService.buscarCustoPrestador(int.parse(id));
      return data;
    });

    /// Add a new custo_prestador
    router.post('/custo_prestador', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        CustoPrestadorModel novoCustoPrestador = CustoPrestadorModel.fromJson(body);

        CustoPrestadorModel? custoPrestadorAdicionado =
            await custoPrestadorService.criarCustoPrestador(custoPrestadorModel: novoCustoPrestador);

        if (custoPrestadorAdicionado != null) {
          return {
            'ok': 'true',
            'custoPrestadorAdicionado': custoPrestadorAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar custo prestador');
      }
    });

    /// delete a new custo_prestador
    router.delete('/custo_prestador/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await custoPrestadorService
            .deletarCustoPrestador(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'custo_prestador_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'custo_prestador_excluido': "Custo Prestador não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar custo prestador');
      }
    });

    /// update a custo_prestador
    router.post('/custo_prestador/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        CustoPrestadorModel novoCustoPrestador = CustoPrestadorModel.fromJson(body);

        var custoPrestadorAtualizado = await custoPrestadorService.atualizarCustoPrestador(
          custoPrestadorModel: novoCustoPrestador,
          idCusto: int.parse(
            request.params['id']!,
          ),
        );

        if (custoPrestadorAtualizado != null) {
          return {
            'ok': 'true',
            'custoPrestadorAlterado': custoPrestadorAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// buscar clientes por qualquer campo
    router.get('/custo_prestador/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var custoPrestadorAtualizado = await custoPrestadorService.buscarCustoPrestadorPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (custoPrestadorAtualizado != null) {
          return {
            'ok': 'true',
            'custoPrestadorAlterado': custoPrestadorAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    return router;
  }
}
