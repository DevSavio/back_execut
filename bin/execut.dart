import 'dart:io';

import 'package:shelf_plus/shelf_plus.dart';
import 'routes/client_route.dart';
import 'routes/custo_prestador_route.dart';
import 'routes/endereco_route.dart';
import 'routes/fornecedor_route.dart';
import 'routes/funcao_prestador_route.dart';
import 'routes/mao_de_obra_route.dart';
import 'routes/obra_route.dart';
import 'routes/origem_recurso_route.dart';
import 'routes/pagamento_route.dart';
import 'routes/prestador_obra_route.dart';
import 'routes/prestador_route.dart';
import 'routes/tipo_de_fornecedor_route.dart';
import 'routes/tipo_de_obra_route.dart';
import 'routes/tipo_mao_de_obra_route.dart';
import 'routes/usuario_route.dart';
import 'routes/material_de_obra_route.dart';

void main() => shelfRun(init);

//void main() => shelfRun(init, defaultBindPort: 8085);

//void main() => shelfRun(init, defaultBindPort: 8085, defaultBindAddress: "78.142.242.131");

Handler init() {
  var app = Router().plus;

  /// Serve index page of frontend
  app.get('/', () => File('frontend/page.html'));

  app = ClientRoute(router: app).init();
  app = CustoPrestadorRoute(router: app).init();
  app = EnderecoRoute(router: app).init();
  app = FornecedorRoute(router: app).init();
  app = FuncaoPrestadorRoute(router: app).init();
  app = MaoDeObraRoute(router: app).init();
  app = MaterialDeObraRoute(router: app).init();
  app = ObraRoute(router: app).init();
  app = OrigemRecursoRoute(router: app).init();
  app = PagamentoRoute(router: app).init();
  app = PrestadorObraRoute(router: app).init();
  app = PrestadorRoute(router: app).init();
  app = TipoDeFornecedorRoute(router: app).init();
  app = TipoDeObraRoute(router: app).init();
  app = TipoMaoDeObraRoute(router: app).init();
  app = UsuarioRoute(router: app).init();

  // /// Update an existing person by id
  // app.put('/person/<id>', (Request request, String id) async {
  //   final data = <Person>[
  //     Person(firstName: 'John', lastName: 'Doe', age: 42),
  //     Person(firstName: 'Jane', lastName: 'Doe', age: 43),
  //   ];
  //   data.removeWhere((person) => person.id == id);
  //   var person = await request.body.as(Person.fromJson);
  //   person.id = id;
  //   data.add(person);
  //   return {'ok': 'true'};
  // });

  // /// Remove a specific person by id
  // app.delete('/person/<id>', (Request request, String id) {
  //   final data = <Person>[
  //     Person(firstName: 'John', lastName: 'Doe', age: 42),
  //     Person(firstName: 'Jane', lastName: 'Doe', age: 43),
  //   ];
  //   data.removeWhere((person) => person.id == id);
  //   return {'ok': 'true'};
  // });

  return app;
}
