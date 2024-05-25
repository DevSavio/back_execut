import 'package:mysql_client/mysql_client.dart';
import '../base/database.dart';
import '../models/obra_models.dart';

class ObraController {
  Future<int?> create({
    required double valorFinal,
    required String responsavelObra,
    required DateTime dataInicio,
    required DateTime dataFim,
    required String logradouro,
    required String complemento,
    required int idCliente,
    required int idPagamento,
    required int idTempo,
    required int idPrestador,
  }) async {
    try {
      String sql =
        "INSERT INTO obra (responsavelObra, dataInicio, dataFim, logradouro,complemento, idCliente, idPagamento, idTempo, idPrestador)"
        " VALUES ('$responsavelObra', $dataInicio, $dataFim, '$logradouro', '$complemento', $idCliente, $idPagamento, $idTempo,  $idPrestador)";
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

  Future<bool> update({
    required double valorFinal,
    required String responsavelObra,
    required DateTime dataInicio,
    required DateTime dataFim,
    required String logradouro,
    required String complemento,
    required int idCliente,
    required int idPagamento,
    required int idTempo,
    required int idPrestador,
    required int idObra,
  }) async {
    try {
      String sql =
        "Update obra set responsavelObra = '$responsavelObra', dataInicio = $dataInicio, dataFim = $dataFim, logradouro = '$logradouro', idPrestador= $idPrestador, valorFinal = $valorFinal, complemento = '$complemento', idCliente = $idCliente, idPagamento = $idPagamento, idTempo = $idTempo, idPrestador = $idPrestador, idObra = $idObra"
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
            idCliente: int.parse(map['idCliente']!),
            logradouro: map['logradouro'] ?? "",
            idPagamento: int.parse(map['idPagamento']!),
            idTempo: int.parse(map['idTempo']!),
            idPrestador: int.parse(map['idPrestador']!),
            complemento: map['complemento']!
          );

          return c;
      }
    }
    } catch (e) {
      throw('Erro ao listar obras: $e');
    }
  }

  Future<List<ObraModel>> list() async {
    try {
      String sql = "select * from obra";
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
              idCliente: int.parse(row.assoc()['idCliente']!),
              idPagamento: int.parse(row.assoc()['idPagamento']!),
              valorFinal: double.parse(row.assoc()['valorFinal']!),
              logradouro: row.assoc()['logradouro'] ?? "",
              idPrestador: int.parse(row.assoc()['idPrestador']!),
              idTempo: int.parse(row.assoc()['idTempo']!),
              idObra: int.parse(row.assoc()['idObra']!),
              complemento: row.assoc()['complemento']!
            );
            lista.add(c);
          }
          return lista;
      }
    }
    } catch (e) {
      throw('Erro ao listar obras: $e');
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
              idCliente: int.parse(row.assoc()['idCliente']!),
              idPagamento: int.parse(row.assoc()['idPagamento']!),
              valorFinal: double.parse(row.assoc()['valorFinal']!),
              logradouro: row.assoc()['logradouro'] ?? "",
              idPrestador: int.parse(row.assoc()['idPrestador']!),
              idTempo: int.parse(row.assoc()['idTempo']!),
              idObra: int.parse(row.assoc()['idObra']!),
              complemento: row.assoc()['complemento']!,
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
