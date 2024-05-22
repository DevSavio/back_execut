import 'package:shelf_plus/shelf_plus.dart';
import "../funcao_prestador/funcao_prestador_service.dart";
import "../models/funcao_prestador_models.dart";

class FuncaoPrestadorRoute {
  RouterPlus router = RouterPlus();
  FuncaoPrestadorService funcaoPrestadorService = FuncaoPrestadorService();

  FuncaoPrestadorRoute({required this.router});

  RouterPlus init() {
    /// List all funcaoPrestador
    router.get('/funcaoPrestadores', () {
      final data = funcaoPrestadorService.listarFuncaoPrestador();
      return data;
    });

    /// Get specific funcaoPrestador by id
    router.get('/funcaoPrestador2/<id>', (Request request, String id) {
      final data = funcaoPrestadorService.buscarFuncaoPrestador(int.parse(id));
      return data;
    });

    /// Add a new funcaoPrestadors
    router.post('/funcaoPrestadores', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        FuncaoPrestadorModel novoFuncaoPrestador = FuncaoPrestadorModel.fromJson(body);

        FuncaoPrestadorModel? funcaoPrestadorAdicionado =
            await funcaoPrestadorService.criarFuncaoPrestador(funcaoPrestadorModel: novoFuncaoPrestador);

        if (funcaoPrestadorAdicionado != null) {
          return {
            'ok': 'true',
            'funcaoPrestadorAdicionado': funcaoPrestadorAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar funcaoPrestador');
      }
    });

    /// delete a new funcaoPrestador
    router.delete('/funcaoPrestador/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await funcaoPrestadorService
            .deletarFuncaoPrestador(int.parse(request.params['id']!));
        print(objetoRetorno);

        if (objetoRetorno != null) {
          return {
            'ok': 'true',
            'funcaoPrestador_excluido ': objetoRetorno,
          };
        } else {
          return {
            'ok': 'false',
            'funcaoPrestador_excluido': "Cliente não encontrado",
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar funcaoPrestador');
      }
    });

    /// update a funcaoPrestadors
    router.post('/funcaoPrestador/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        FuncaoPrestadorModel novoFuncaoPrestador = FuncaoPrestadorModel.fromJson(body);

        var criarFuncaoPrestador = await funcaoPrestadorService.atualizarFuncaoPrestador(
          funcaoPrestadorModel: novoFuncaoPrestador,
          idCliente: int.parse(
            request.params['id']!,
          ),
        );

        if (criarFuncaoPrestador != null) {
          return {
            'ok': 'true',
            'funcaoPrestadorAlterado': criarFuncaoPrestador,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar funcaoPrestador');
      }
    });

    /// buscar funcaoPrestadors por qualquer campo
    router.get('/funcaoPrestador/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var criarFuncaoPrestador = await funcaoPrestadorService.buscarFuncaoPrestadorPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (criarFuncaoPrestador != null) {
          return {
            'ok': 'true',
            'funcaoPrestadorAlterado': criarFuncaoPrestador,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar funcaoPrestador');
      }
    });

    return router;
  }
}
