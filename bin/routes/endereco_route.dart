import 'package:shelf_plus/shelf_plus.dart';
import "../endereco/endereco_service.dart";
import "../models/endereco_models.dart";

class EnderecoRoute {
  RouterPlus router = RouterPlus();
  EnderecoService enderecoService = EnderecoService();

  EnderecoRoute({required this.router});

  RouterPlus init() {
    /// List all cliente
    router.get('/enderecos', () {
      final data = enderecoService.listarEnderecos();
      return data;
    });

    /// Get specific cliente by id
    router.get('/endereco/<id>', (Request request, String id) {
      final data = enderecoService.buscarEndereco(int.parse(id));
      return data;
    });

    /// Add a new clientes
    router.post('/endereco', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        EnderecoModel novoEndereco = EnderecoModel.fromJson(body);

        EnderecoModel? enderecoAdicionado =
            await enderecoService.criarEndereco(enderecoModel: novoEndereco);

        if (enderecoAdicionado != null) {
          return {
            'ok': 'true',
            'enderecoAdicionado': enderecoAdicionado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// delete a new cliente
    router.delete('/endereco/<id>', (Request request, String id) async {
      try {
        var objetoRetorno = await enderecoService
            .deletarEndereco(int.parse(request.params['id']!));
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

    /// update a clientes
    router.post('/endereco/<id>', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        EnderecoModel novoEndereco = EnderecoModel.fromJson(body);

        var enderecoAtualizado = await enderecoService.atualizarEndereco(
          enderecoModel: novoEndereco,
          idEndereco: int.parse(
            request.params['id']!,
          ),
        );

        if (enderecoAtualizado != null) {
          return {
            'ok': 'true',
            'clienteAlterado': enderecoAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    /// buscar clientes por qualquer campo
    router.get('/endereco/buscar_por_campo', (Request request) async {
      try {
        dynamic body = await request.body.asJson;

        var enderecoAtualizado = await enderecoService.buscarEnderecoPorNome(
          operator: body['operator'],
          paramter: body['paramter'],
          value: body['value'],
        );

        if (enderecoAtualizado != null) {
          return {
            'ok': 'true',
            'clienteAlterado': enderecoAtualizado,
          };
        }
      } catch (e) {
        return Response.internalServerError(body: 'Erro ao criar cliente');
      }
    });

    return router;
  }
}
