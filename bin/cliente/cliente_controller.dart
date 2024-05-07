import '../base/database.dart';

class ClienteController {
  Cliente() {
    print('Cliente');

    // c.database();
  }

  void create({
    required String nomeCliente,
    required String razaoSocial,
    required String logradouro,
    required String complemento,
    required String cpfCnpj,
    required String telefone,
  }) {
    String sql =
        "INSERT INTO cliente (nomeCliente, razaoSocial, logradouro, complemento, cpfCnpj, telefone)"
        " VALUES ($nomeCliente, $razaoSocial, $logradouro, $complemento, $cpfCnpj, $telefone);";
    ControllerConnection c = ControllerConnection();
    c.create(
      sql,
    );

    print('Cliente criado com sucesso!');
  }

  void read() {
    print('Cliente obtido com sucesso');
  }

  void update({
    required String nomeCliente,
    required String razaoSocial,
    required String logradouro,
    required String complemento,
    required String cpfCnpj,
    required String telefone,
    required int idCliente,
  }) {
    String sql =
        "Update cliente set nomeCliente = $nomeCliente, razaoSocial = $razaoSocial, logradouro = $logradouro, complemento = $complemento, cpfCnpj = $cpfCnpj, telefone = $telefone"
        " where idCliente = $idCliente;";
    ControllerConnection c = ControllerConnection();
    c.update(
      sql,
    );
    print('Cliente Atualizado com sucesso');
  }

  void delete() {
    print('delete');
  }

  void list() {
    print('list');
  }

  void search() {
    print('search');
  }
}
