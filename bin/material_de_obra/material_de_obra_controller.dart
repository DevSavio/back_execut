import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';

class MaterialDeObraController {
  Future<void> create({
    required String nomeMaterial,
    required String descricaoMaterial,
    required double valor,
    required int idTipo,
    required int idOrigem,
    required int idFornecedor,
  }) async {
    String sql =
        "INSERT INTO material_de_obra (nomeMaterial, descricaoMaterial, valor, idTipo, idOrigem, idFornecedor)"
        " VALUES ($nomeMaterial, $descricaoMaterial, $valor, $idTipo, $idOrigem, $idFornecedor);";
    ControllerConnection c = ControllerConnection();
    await c.create(
      sql,
    );
    print('Material de Obra criado com sucesso!');
  }

  Future<void> update({
    required String nomeMaterial,
    required String descricaoMaterial,
    required double valor,
    required int idTipo,
    required int idOrigem,
    required int idFornecedor,
    required int idMaterial,
  }) async {
    String sql =
        "Update material_de_obra set nomeMaterial = $nomeMaterial, descricaoMaterial = $descricaoMaterial, valor = $valor, idTipo = $idTipo, idOrigem = $idOrigem, idFornecedor = $idFornecedor"
        " where idMaterial = $idMaterial;";
    ControllerConnection c = ControllerConnection(); 
    await c.update(
      sql,
    );
    print('Origem recurso Atualizado com sucesso');
  }

  Future<void> delete({
    required int idMaterial,
  }) async {
    String sql = "delete from material_de_obra "
        " where idMaterial = $idMaterial;";
    ControllerConnection c = ControllerConnection();
    await c.delete(
      sql,
    );
    print('Origem recurso excluído com sucesso');
  }

  Future<void> readByID({
    required int idMaterial,
  }) async {
    String sql = "select *  from material_de_obra  where idMaterial = $idMaterial;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar Material de Obra');
    } else {
      if (r.rows.isEmpty) {
        print('Material de Obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Material de Obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> list() async {
    String sql = "select *  from material_de_obra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o Material de Obra');
    } else {
      if (r.rows.isEmpty) {
        print('Material de Obra não encontrado');
      } else {
        for (var row in r.rows) {
          print('Material de Obra encontrado: ${row.assoc()}');
        }
      }
    }
  }

  Future<void> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    String sql = "select *  from material_de_obra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o origem recurso');
    } else {
      if (r.rows.isEmpty) {
        print('Origem recurso não encontrado');
      } else {
        for (var row in r.rows) {
          print('Origem recurso encontrado: ${row.assoc()}');
        }
      }
    }
  }
}
