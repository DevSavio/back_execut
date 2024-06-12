import 'package:mysql_client/mysql_client.dart';

import '../base/database.dart';
import '../models/endereco_models.dart';
import '../models/fornecedor_models.dart';
import '../models/material_de_obra_models.dart';
import '../models/origem_recurso_models.dart';
import '../models/tipo_de_fornecedor_models.dart';
import '../models/tipo_de_obra_models.dart';

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
            tipo: TipoDeObraModel(
              nomeTipo: map['nomeTipo']!,
              idTipo: int.parse(map['idTipo']!),
              descricaoTipo: map['descricaoTipo']!
            ),
            origem: OrigemRecursoModel(
              tipoOrigem: map['tipoOrigem']!,
              valor: double.parse(map['valor']!),
              idOrigem: int.parse(map['idOrigem']!),
            ),
            fornecedor: FornecedorModel(
              razaoSocial: map['razaoSocial']!,
              telefone: map['telefone']!,
              idFornecedor: int.parse(map['idFornecedor']!),
              tipo: TipoDeFornecedorModel(
                nomeTipo: map['nomeTipo']!, 
                descricao: map['descricao']!,
                idTipo: int.parse(map['idTipo']!),
                ),
              endereco: EnderecoModel(
                cidade: map['cidade']!, 
                complemento: map['complemento']!, 
                estado: map['estado']!, 
                logradouro: map['logradouro']!, 
                idEndereco: int.parse(map['idEndereco']!),
                ) 
            ),
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
            valor: double.parse(row.assoc()['valor']!),
            tipo: TipoDeObraModel(
              nomeTipo: row.assoc()['nomeTipo']!,
              idTipo: int.parse(row.assoc()['idTipo']!),
              descricaoTipo: row.assoc()['descricaoTipo']!
            ),
            origem: OrigemRecursoModel(
              tipoOrigem: row.assoc()['tipoOrigem']!,
              valor: double.parse(row.assoc()['valor']!),
              idOrigem: int.parse(row.assoc()['idOrigem']!),
            ),
            fornecedor: FornecedorModel(
              razaoSocial: row.assoc()['razaoSocial']!,
              telefone: row.assoc()['telefone']!,
              idFornecedor: int.parse(row.assoc()['idFornecedor']!),
              tipo: TipoDeFornecedorModel(
                nomeTipo: row.assoc()['nomeTipo']!, 
                descricao: row.assoc()['descricao']!,
                idTipo: int.parse(row.assoc()['idTipo']!),
                ),
              endereco: EnderecoModel(
                cidade: row.assoc()['cidade']!, 
                complemento: row.assoc()['complemento']!, 
                estado: row.assoc()['estado']!, 
                logradouro: row.assoc()['logradouro']!, 
                idEndereco: int.parse(row.assoc()['idEndereco']!),
                ) 
            ),
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
            valor: double.parse(row.assoc()['valor']!),
            tipo: TipoDeObraModel(
              nomeTipo: row.assoc()['nomeTipo']!,
              idTipo: int.parse(row.assoc()['idTipo']!),
              descricaoTipo: row.assoc()['descricaoTipo']!
            ),
            origem: OrigemRecursoModel(
              tipoOrigem: row.assoc()['tipoOrigem']!,
              valor: double.parse(row.assoc()['valor']!),
              idOrigem: int.parse(row.assoc()['idOrigem']!),
            ),
            fornecedor: FornecedorModel(
              razaoSocial: row.assoc()['razaoSocial']!,
              telefone: row.assoc()['telefone']!,
              idFornecedor: int.parse(row.assoc()['idFornecedor']!),
              tipo: TipoDeFornecedorModel(
                nomeTipo: row.assoc()['nomeTipo']!, 
                descricao: row.assoc()['descricao']!,
                idTipo: int.parse(row.assoc()['idTipo']!),
                ),
              endereco: EnderecoModel(
                cidade: row.assoc()['cidade']!, 
                complemento: row.assoc()['complemento']!, 
                estado: row.assoc()['estado']!, 
                logradouro: row.assoc()['logradouro']!, 
                idEndereco: int.parse(row.assoc()['idEndereco']!),
                ) 
            ),
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
