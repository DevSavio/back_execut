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
    print('read');
  }

  void update() {
    print('update');
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
