import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/funcao_prestador_models.dart';
import '../models/mao_de_obra_models.dart';
import '../models/prestador_models.dart';
import '../models/tipo_mao_de_obra_models.dart';

class MaoDeObraController {
  Future<int?> create({
    String? descricao,
    required int idTipo, //tipo_de_mão_obra
    required int idFuncao, //funcao_prestador
    required int idPrestador, //prestador
  }) async {
    try {
      String sql =
        "INSERT INTO mao_de_obra (descricao, idTipo, idFuncao, idPrestador)"
        " VALUES ('$descricao', $idTipo, $idFuncao, $idPrestador);";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );
    
    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Mão de Obra criado com sucesso!');
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
    String? descricao,
    required int idTipo,
    required int idFuncao,
    required int idPrestador,
    required int idMao,
  }) async {
    try {
      String sql =
        "Update mao_de_obra set descricao = '$descricao', idTipo = $idTipo, idTipo = $idTipo, idPrestador = $idPrestador, idFuncao = $idFuncao"
        " where idMao = $idMao;";
    ControllerConnection c = ControllerConnection(); 
    await c.update(
      sql,
    );
    print('Mão de Obra Atualizado com sucesso');
    return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<int?> delete({
    required int idMao,
  }) async {
    try {
      String sql = "delete from mao_de_obra "
        " where idMao = $idMao;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
    
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Mão de Obra excluído com sucesso');
          return idMao;
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

  Future<MaoDeObraModel?> readByID({required int idMao}) async {
      try {
        String sql = "select * from mao_de_obra  where idMao = $idMao;";
        ControllerConnection c = ControllerConnection();
        IResultSet? r = await c.read(
          sql,
        );

        if (r == null) {
          print('Erro ao buscar Mão de Obra');
          throw ('Erro ao listar Mão de Obra: ResultSet is null');
        } else {
          if (r.rows.isEmpty) {
            print('Mão de Obra não encontrado');
            return null;
          } else {
            Map<String, dynamic> map = r.rows.first.assoc();
              MaoDeObraModel c = MaoDeObraModel(
                idMao: int.parse(map['idMao']!),
                descricao: map['descricao'],
                funcao: FuncaoPrestadorModel(
                  idFuncao: int.parse(map['idFuncao']),
                  nomeFuncao: map['nomeFuncao'],
                descricaoFuncao: map['descricaoFuncao']),
                prestador: PrestadorModel(
                  idPrestador: int.parse(map['idPrestador']), 
                  nomePrestador: map['nomePrestador'], 
                  funcao: map['funcao']),
                tipo: TipoMaoDeObraModel(
                  idTipo: int.parse(map['idTipo']),
                  descricao: map['descricao']!,
                  nomeTipo: map['nomeTipo']!
                ),
              );
              return c;
          }
        }
      } catch (e) {
        throw('Erro ao listar mão de obra: $e');
      }
    }
  
  Future<List<MaoDeObraModel>> list() async {
    try {
      String sql = """
                    SELECT 
                      mOBRA.idMao, 
                      mOBRA.descricao AS "maoDescricao", 
                      mOBRA.idTipo, 
                      tpMOBRA.nomeTipo, 
                      tpMOBRA.descricao AS "tipoMaoDescricao", 
                      mOBRA.idPrestador, 
                      pres.nomePrestador, 
                      pres.tipoPrestador, 
                      pres.cpfCnpj, 
                      pres.telefone, 
                      mOBRA.idFuncao, 
                      fPres.nomeFuncao, 
                      fPres.descricaoFuncao 
                        FROM mao_de_obra AS mOBRA 
                          INNER JOIN tipo_mao_de_obra AS tpMOBRA ON mOBRA.idTipo = tpMOBRA.idTipo 
                          INNER JOIN prestador AS pres ON mOBRA.idPrestador = pres.idPrestador 
                          INNER JOIN funcao_prestador AS fPres ON mOBRA.idFuncao = fPres.idFuncao;
                      """;
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o Mão de Obra');
      throw('Erro ao listar mão de obra: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Mão de Obra não encontrado');
        return List<MaoDeObraModel>.empty();
      } else {
        List<MaoDeObraModel> lista = [];
          for (var row in r.rows) {
            print('Mão de Obra encontrado: ${row.typedAssoc()}');
            MaoDeObraModel c = MaoDeObraModel(
              idMao: int.parse(row.assoc()['idMao']!),
              descricao: row.assoc()['maoDescricao']!,
              funcao: FuncaoPrestadorModel(
                idFuncao: int.parse(row.assoc()['idFuncao']!),
                nomeFuncao: row.assoc()['nomeFuncao']!,
                  descricaoFuncao: row.assoc()['descricaoFuncao']!),
              prestador: PrestadorModel(
                idPrestador: int.parse(row.assoc()['idPrestador']!), 
                nomePrestador: row.assoc()['nomePrestador']!,
                tipoPrestador: row.assoc()['tipoPrestador']!,
                cpfCnpj: row.assoc()['cpfCnpj'],
                telefone: row.assoc()['telefone']!,
                funcao: FuncaoPrestadorModel(
                idFuncao: int.parse(row.assoc()['idFuncao']!),
                nomeFuncao: row.assoc()['nomeFuncao']!,
                descricaoFuncao: row.assoc()['descricaoFuncao']!),
              ),
              tipo: TipoMaoDeObraModel(
                idTipo: int.parse(row.assoc()['idTipo']!),
                  descricao: row.assoc()['tipoMaoDescricao']!,
                  nomeTipo: row.assoc()['nomeTipo']!),
            );
            lista.add(c);
          }
          return lista;
      }
    }
    } catch (e) {
      throw ('Erro ao listar mão de obra: $e');
    }
  }

  Future<List<MaoDeObraModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from mao_de_obra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar Mão de Obra');
      return List<MaoDeObraModel>.empty();
    } else {
      if (r.rows.isEmpty) {
        print('Mão de Obra não encontrado');
        return List<MaoDeObraModel>.empty();
      } else {
        List<MaoDeObraModel> lista = [];
          for (var row in r.rows) {
            print('Mão de Obra encontrado: ${row.typedAssoc()}');
            MaoDeObraModel c = MaoDeObraModel(
              idMao: int.parse(row.assoc()['idMao']!),
              descricao: row.assoc()['descricao']!,
              funcao: FuncaoPrestadorModel(
                idFuncao: int.parse(row.assoc()['idFuncao']!),
                nomeFuncao: row.assoc()['nomeFuncao']!,
                  descricaoFuncao: row.assoc()['descricaoFuncao']!),
              prestador: PrestadorModel(
                idPrestador: int.parse(row.assoc()['idPrestador']!), 
                nomePrestador: row.assoc()['nomePrestador']!,
                tipoPrestador: row.assoc()['tipoPrestador']!,
                cpfCnpj: row.assoc()['cpfCnpj'],
                telefone: row.assoc()['telefone']!,
                funcao: FuncaoPrestadorModel(
                idFuncao: int.parse(row.assoc()['idFuncao']!),
                nomeFuncao: row.assoc()['nomeFuncao']!,
                descricaoFuncao: row.assoc()['descricaoFuncao']!),
              ),
              tipo: TipoMaoDeObraModel(
                idTipo: int.parse(row.assoc()['idTipo']!),
                descricao: row.assoc()['descricao']!,
                  nomeTipo: row.assoc()['nomeTipo']!),
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
