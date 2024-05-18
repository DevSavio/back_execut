import 'dart:io';

import 'package:shelf_plus/shelf_plus.dart';
import 'routes/client_route.dart';
import 'routes/fornecedor_route.dart';

void main() => shelfRun(init);

Handler init() {
  var app = Router().plus;

  /// Serve index page of frontend
  app.get('/', () => File('frontend/page.html'));

  app = ClientRoute(router: app).init();

  app = FornecedorRoute(router: app).init();

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
