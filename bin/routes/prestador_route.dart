import 'package:shelf_plus/shelf_plus.dart';
import '../models/prestador_models.dart';
import '../prestador/prestador_service.dart';

class PrestadorRoute {
  RouterPlus router = RouterPlus();
  PrestadorService prestadorService = PrestadorService();

  PrestadorRoute({required this.router});

  RouterPlus init() {
    /// List all prestador
    router.get('/prestadores', () {
      final data = prestadorService.listarPrestador();
      return data;
    });

    /// Get specific prestador by id
    router.get('/prestador/<id>', (Request request, String id) {
      final data = prestadorService.buscarPrestador(int.parse(id));
      return data;
    });

    /// Add a new prestadores
    router.post('/prestador', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        PrestadorModel novoPrestador = PrestadorModel.fromJson(body);

        PrestadorModel? prestadorAdicionado =
            await prestadorService.criarPrestador(prestadorModel: novoPrestador);

        if (prestadorAdicionado != null) {
          return {
            'ok': 'true',
            'prestadorAdicionado': prestadorAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// delete a new prestador
    router.delete('/prestador/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await prestadorService
            .deletarPrestador(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'cliente_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'cliente_excluido': "Cliente não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// update a prestadores
    router.post('/prestador/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        PrestadorModel novoPrestador = PrestadorModel.fromJson(body);

        var prestadorAtualizado = await prestadorService.atualizarPrestador(
          prestadorModel: novoPrestador,
          idPrestador: int.parse(
            request.params['id']!,
          ),
        );

        if (prestadorAtualizado != null) {
          return {
            'ok': 'true',
            'clienteAlterado': prestadorAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// buscar prestador por qualquer campo
    router.get('/prestador/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var prestadorAtualizado = await prestadorService.buscarPrestadorPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (prestadorAtualizado != null) {
          return {
            'ok': 'true',
            'clienteAlterado': prestadorAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });
    
    return router;
  }
}
