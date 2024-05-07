import '../base/database.dart';

class ObraController {
  ObraController() {
    print('ObraController');

    // c.database();
  }

  void create() {
//     INSERT INTO obra (valorFinal, responsavelObra, dataInicio, dataFim, logradouro, complemento, idCliente, idPagamento, idTempo, idPrestador)
// VALUES (50000.00, 'João Silva', '2024-01-01', '2024-12-31', 'Rua das Flores, 123', 'Apto 45', 1, 1, 1, 1);

    String sql = """
        INSERT INTO obra ( """
        "valorFinal, responsavelObra, dataInicio, dataFim, "
        " logradouro, complemento, idCliente, idPagamento, "
        " idTempo, idPrestador) "
        "VALUES (? , ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    ControllerConnection c = ControllerConnection();
    c.create(
      sql,
    );

    print('Criado com sucesso!');
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
