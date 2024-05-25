import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/material_de_obra_models.dart';

class MaterialDeObraController {
  Future<int?> create({
    required String nomeMaterial,
    String? descricaoMaterial,
    required double valor,
    required int idTipo,
    required int idOrigem,
    required int idFornecedor,
  }) async {
    try {
      String sql =
        "INSERT INTO material_de_obra (nomeMaterial, descricaoMaterial, valor, idTipo, idOrigem, idFornecedor)"
        " VALUES ('$nomeMaterial', '$descricaoMaterial', $valor, $idTipo, $idOrigem, $idFornecedor);";
    ControllerConnection c = ControllerConnection();
    IResultSet? result = await c.create(
      sql,
    );
    
    if (result != null) {
        if (result.affectedRows >= BigInt.one) {
          print('Material de Obra criado com sucesso!');
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
    required String nomeMaterial,
    String? descricaoMaterial,
    required double valor,
    required int idTipo,
    required int idOrigem,
    required int idFornecedor,
    required int idMaterial,
  }) async {
   try {
      String sql =
        "Update material_de_obra set nomeMaterial = '$nomeMaterial', descricaoMaterial = '$descricaoMaterial', valor = $valor, idTipo = $idTipo, idOrigem = $idOrigem, idFornecedor = $idFornecedor"
        " where idMaterial = $idMaterial;";
    ControllerConnection c = ControllerConnection(); 
    await c.update(
      sql,
    );
    print('Material de Obra Atualizado com sucesso');
    return true;
   } catch (e) {
     rethrow;
   }
  }

  Future<int?> delete({
    required int idMaterial,
  }) async {
    try {
      String sql = "delete from material_de_obra "
        " where idMaterial = $idMaterial;";
    ControllerConnection c = ControllerConnection();
    IResultSet? i = await c.delete(
      sql,
    );
    
    if (i != null) {
        if (i.affectedRows >= BigInt.one) {
          print('Material de Obra excluído com sucesso');
          return idMaterial;
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

  Future<MaterialDeObraModel?> readByID({
    required int idMaterial,
  }) async {
    try {
      String sql = "select * from material_de_obra where idMaterial = $idMaterial;";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar Material de Obra');
      throw('Erro ao listar material de obras: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Material de Obra não encontrado');
        return null;
      } else {
        Map<String, dynamic> map = r.rows.first.assoc();
          MaterialDeObraModel c = MaterialDeObraModel(
            idMaterial: int.parse(map['idMaterial']!),
            descricaoMaterial: map['descricaoMaterial'] ?? "",
            nomeMaterial: map['nomeMaterial']!,
            valor: double.parse(map['valor']),
            idTipo: int.parse(map['idTipo']!),
            idOrigem: int.parse(map['idOrigem']!),
            idFornecedor: int.parse(map['idFornecedor']!),
          );

          return c;
      }
    }
    } catch (e) {
      throw('Erro ao listar material de obras: $e');
    }
  }

  Future<List<MaterialDeObraModel>> list() async {
    try {
        String sql = "select * from material_de_obra";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o Material de Obra');
      throw('Erro ao listar material de obras: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Material de Obra não encontrado');
        return List<MaterialDeObraModel>.empty();
      } else {
        List<MaterialDeObraModel> lista = [];
        for (var row in r.rows) {
          print('Material de Obra encontrado: ${row.assoc()}');
          MaterialDeObraModel c = MaterialDeObraModel(
            idMaterial: int.parse(row.assoc()['idMaterial']!),
            descricaoMaterial: row.assoc()['idMaterial'] ?? "",
            nomeMaterial: row.assoc()['nomeMaterial']!,
            idFornecedor: int.parse(row.assoc()['idFornecedor']!),
            idOrigem: int.parse(row.assoc()['idOrigem']!),
            idTipo: int.parse(row.assoc()['idTipo']!),
            valor: double.parse(row.assoc()['valor']!),
          );
          lista.add(c);
        }
        return lista;
      }
    }
    } catch (e) {
      throw('Erro ao listar material de obra: $e');
    }
  }

  Future<List<MaterialDeObraModel>> search(
      {String paramter = '', String value = '', String operator = ''}) async {
    try {
      String sql = "select * from material_de_obra where $paramter $operator $value";
    ControllerConnection c = ControllerConnection();
    IResultSet? r = await c.read(
      sql,
    );

    if (r == null) {
      print('Erro ao buscar o Material de Obra');
      throw('Erro ao listar material de obras: ResultSet is null');
    } else {
      if (r.rows.isEmpty) {
        print('Material de Obra não encontrado');
        return List<MaterialDeObraModel>.empty();
      } else {
        List<MaterialDeObraModel> lista = [];
        for (var row in r.rows) {
          print('Material de Obra encontrado: ${row.assoc()}');
          MaterialDeObraModel c = MaterialDeObraModel(
            idMaterial: int.parse(row.assoc()['idMaterial']!),
            descricaoMaterial: row.assoc()['descricaoMaterial'] ?? "",
            nomeMaterial: row.assoc()['nomeMaterial']!,
            idFornecedor: int.parse(row.assoc()['idFornecedor']!),
            idOrigem: int.parse(row.assoc()['idOrigem']!),
            idTipo: int.parse(row.assoc()['idTipo']!),
            valor: double.parse(row.assoc()['valor']!),
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
