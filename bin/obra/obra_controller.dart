import 'package:mysql_client/mysql_client.dart';
import '../base/database.dart';
import '../models/cliente_models.dart';
import '../models/endereco_models.dart';
import '../models/funcao_prestador_models.dart';
import '../models/obra_models.dart';
import '../models/pagamento_models.dart';
import '../models/prestador_models.dart';

class ObraController {
  Future<int?> create(
      {required double valorFinal,
      required String responsavelObra,
      required DateTime dataInicio,
      required DateTime dataFim,
      required int idCliente,
      required int idPagamento,
      required int idPrestador,
      required int idEndereco}) async {
    try {
      String sql =
          "INSERT INTO obra (responsavelObra, dataInicio, dataFim, idCliente, idPagamento, idPrestador, idEndereco)"
          " VALUES ('$responsavelObra', $dataInicio, $dataFim, $idCliente, $idPagamento, $idPrestador, $idEndereco)";
      ControllerConnection c = ControllerConnection();
      IResultSet? result = await c.create(
        sql,
      );

      if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Obra criado com sucesso!');
          return result.lastInsertID.toInt();
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> update(
      {required double valorFinal,
      required String responsavelObra,
      required DateTime dataInicio,
      required DateTime dataFim,
      required int idCliente,
      required int idPagamento,
      required int idPrestador,
      required int idObra,
      required int idEndereco}) async {
    try {
      String sql =
          "Update obra set responsavelObra = '$responsavelObra', dataInicio = $dataInicio, dataFim = $dataFim, idPrestador= $idPrestador, valorFinal = $valorFinal, idCliente = $idCliente, idPagamento = $idPagamento, idPrestador = $idPrestador, idObra = $idObra, idEndereco = $idEndereco"
          " where idObra = $idObra;";
      ControllerConnection c = ControllerConnection();
      await c.update(
        sql,
      );
      print('Obra Atualizado com sucesso');
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idObra,
  }) async {
    try {
      String sql = "delete from obra "
          " where idObra = $idObra;";
      ControllerConnection c = ControllerConnection();
      IResultSet? i = await c.delete(
        sql,
      );

      if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Obra excluído com sucesso');
          return idObra;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<ObraModel?> readByID({
    required int idObra,
  }) async {
    try {
      String sql = "select * from obra  where idObra = $idObra;";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o obra');
        throw ('Erro ao listar obras: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Obra não encontrado');
          return null;
        } else {
          Map<String, dynamic> map = r.rows.first.assoc();
          ObraModel c = ObraModel(
            idObra: int.parse(map['idObra']!),
            valorFinal: double.parse(map['valorFinal']!),
            responsavelObra: map['responsavelObra']!,
            dataFim: DateTime.parse(map['dataFim']!),
            dataInicio: DateTime.parse(map['dataInicio']!),
            cliente: ClienteModel(
                idCliente: int.parse(map['idCliente']!),
                cpfCnpj: map['cpfCnpj']!,
                razaoSocial: map['razaoSocial']!,
                nomeCliente: map['nomeCliente']!,
                telefone: map['telefone']!,
                endereco: EnderecoModel(
                  logradouro: map['logradouro']!,
                  complemento: map['complemento']!,
                  cidade: map['cidade']!,
                  estado: map['estado']!,
                  idEndereco: int.parse(map['idEndereco']!),
                )),
            pagamento: PagamentoModel(
              tipoPagamento: map['tipoPagamento']!,
              moeda: map['moeda']!,
              idPagamento: int.parse(map['idPagamento']!),
            ),
            prestador: PrestadorModel(
              idPrestador: int.parse(map['idPrestador']!),
              nomePrestador: map['nomePrestador']!,
              funcao: FuncaoPrestadorModel(
                nomeFuncao: map['nomeFuncao']!,
                descricaoFuncao: map['descricaoFuncao']!,
                idFuncao: int.parse(map['idFuncao']!),
              ),
            ),
            endereco: EnderecoModel(
                logradouro: map['logradouro']!,
                complemento: map['complemento']!,
                cidade: map['cidade']!,
                estado: map['estado']!,
                idEndereco: int.parse(map['idEndereco']!)),
          );

          return c;
        }
      }
    } catch (e) {
      throw ('Erro ao listar obras: $e');
    }
  }

  Future<List<ObraModel>> list() async {
    try {
      String sql = """
select * from obra 
inner join cliente on obra.idCliente = cliente.idCliente 
inner join endereco on endereco.id = cliente.idEndereco  
inner join prestador on obra.idPrestador = prestador.idPrestador  
inner join funcao_prestador on funcao_prestador.idFuncao = prestador.idFuncao 
inner join pagamento on pagamento.idPagamento = obra.idPagamento
""";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o obra');
        throw ('Erro ao listar obras: ResultSet is null');
      } else {
        if (r.rows.isEmpty) {
          print('Obra não encontrado');
          return List<ObraModel>.empty();
        } else {
          List<ObraModel> lista = [];
          for (var row in r.rows) {
            print('Obra encontrado: ${row.typedAssoc()}');
            ObraModel c = ObraModel(
              dataFim: DateTime.parse(row.assoc()['dataFim']!),
              dataInicio: DateTime.parse(row.assoc()['dataInicio']!),
              responsavelObra: row.assoc()['responsavelObra']!,
              valorFinal: double.parse(row.assoc()['valorFinal']!),
              idObra: int.parse(row.assoc()['idObra']!),
              cliente: ClienteModel(
                  idCliente: int.parse(row.assoc()['idCliente']!),
                  cpfCnpj: row.assoc()['cpfCnpj']!,
                  razaoSocial: row.assoc()['razaoSocial']!,
                  nomeCliente: row.assoc()['nomeCliente']!,
                  telefone: row.assoc()['telefone']!,
                  endereco: EnderecoModel(
                    logradouro: row.assoc()['logradouro']!,
                    complemento: row.assoc()['complemento']!,
                    cidade: row.assoc()['cidade']!,
                    estado: row.assoc()['estado']!,
                    idEndereco: int.parse(row.assoc()['idEndereco']!),
                  )),
              pagamento: PagamentoModel(
                tipoPagamento: row.assoc()['tipoPagamento']!,
                moeda: row.assoc()['moeda']!,
                idPagamento: int.parse(row.assoc()['idPagamento']!),
              ),
              prestador: PrestadorModel(
                idPrestador: int.parse(row.assoc()['idPrestador']!),
                nomePrestador: row.assoc()['nomePrestador']!,
                funcao: FuncaoPrestadorModel(
                  nomeFuncao: row.assoc()['nomeFuncao']!,
                  descricaoFuncao: row.assoc()['descricaoFuncao']!,
                  idFuncao: int.parse(row.assoc()['idFuncao']!),
                ),
              ),
              endereco: EnderecoModel(
                  logradouro: row.assoc()['logradouro']!,
                  complemento: row.assoc()['complemento']!,
                  cidade: row.assoc()['cidade']!,
                  estado: row.assoc()['estado']!,
                  idEndereco: int.parse(row.assoc()['idEndereco']!)),
            );
            lista.add(c);
          }
          return lista;
        }
      }
    } catch (e) {
      throw ('Erro ao listar obras: $e');
    }
  }

  Future<List<ObraModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from obra where $paramter $operator $value";
      ControllerConnection c = ControllerConnection();
      IResultSet? r = await c.read(
        sql,
      );

      if (r == null) {
        print('Erro ao buscar o obra');
        return List<ObraModel>.empty();
      } else {
        if (r.rows.isEmpty) {
          print('Obra não encontrado');
          return List<ObraModel>.empty();
        } else {
          List<ObraModel> lista = [];
          for (var row in r.rows) {
            print('Obra encontrado: ${row.typedAssoc()}');
            ObraModel c = ObraModel(
              dataFim: DateTime.parse(row.assoc()['dataFim']!),
              dataInicio: DateTime.parse(row.assoc()['dataInicio']!),
              responsavelObra: row.assoc()['responsavelObra']!,
              valorFinal: double.parse(row.assoc()['valorFinal']!),
              idObra: int.parse(row.assoc()['idObra']!),
              cliente: ClienteModel(
                  idCliente: int.parse(row.assoc()['idCliente']!),
                  cpfCnpj: row.assoc()['cpfCnpj']!,
                  razaoSocial: row.assoc()['razaoSocial']!,
                  nomeCliente: row.assoc()['nomeCliente']!,
                  telefone: row.assoc()['telefone']!,
                  endereco: EnderecoModel(
                    logradouro: row.assoc()['logradouro']!,
                    complemento: row.assoc()['complemento']!,
                    cidade: row.assoc()['cidade']!,
                    estado: row.assoc()['estado']!,
                    idEndereco: int.parse(row.assoc()['idEndereco']!),
                  )),
              pagamento: PagamentoModel(
                tipoPagamento: row.assoc()['tipoPagamento']!,
                moeda: row.assoc()['moeda']!,
                idPagamento: int.parse(row.assoc()['idPagamento']!),
              ),
              prestador: PrestadorModel(
                idPrestador: int.parse(row.assoc()['idPrestador']!),
                nomePrestador: row.assoc()['nomePrestador']!,
                funcao: FuncaoPrestadorModel(
                  nomeFuncao: row.assoc()['nomeFuncao']!,
                  descricaoFuncao: row.assoc()['descricaoFuncao']!,
                  idFuncao: int.parse(row.assoc()['idFuncao']!),
                ),
              ),
              endereco: EnderecoModel(
                  logradouro: row.assoc()['logradouro']!,
                  complemento: row.assoc()['complemento']!,
                  cidade: row.assoc()['cidade']!,
                  estado: row.assoc()['estado']!,
                  idEndereco: int.parse(row.assoc()['idEndereco']!)),
            );
            lista.add(c);
          }
          return lista;
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
