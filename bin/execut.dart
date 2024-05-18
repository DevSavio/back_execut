import 'dart:io';

import 'package:shelf_plus/shelf_plus.dart';
import 'cliente/cliente_service.dart';

import 'person.dart';

void main() => shelfRun(init);

Handler init() {
  var app = Router().plus;

  /// Serve index page of frontend
  app.get('/', () => File('frontend/page.html'));

  /// List all persons
  app.get('/clientes', () {
    ClienteService c = ClienteService();
    final data = c.listarClientes();
    return data;
  });

  /// Get specific person by id
  app.get('/person/<id>', (Request request, String id) {
    final data = <Person>[
      Person(firstName: 'John', lastName: 'Doe', age: 42),
      Person(firstName: 'Jane', lastName: 'Doe', age: 43),
    ];
    return data.where((person) => person.id == id);
  });

  /// Add a new person
  app.post('/person', (Request request) async {
    var newPerson = await request.body.as(Person.fromJson);
    final data = <Person>[
      Person(firstName: 'John', lastName: 'Doe', age: 42),
      Person(firstName: 'Jane', lastName: 'Doe', age: 43),
    ];
    data.add(newPerson);
    return {'ok': 'true', 'person': newPerson.toJson()};
  });

  /// Update an existing person by id
  app.put('/person/<id>', (Request request, String id) async {
    final data = <Person>[
      Person(firstName: 'John', lastName: 'Doe', age: 42),
      Person(firstName: 'Jane', lastName: 'Doe', age: 43),
    ];
    data.removeWhere((person) => person.id == id);
    var person = await request.body.as(Person.fromJson);
    person.id = id;
    data.add(person);
    return {'ok': 'true'};
  });

  /// Remove a specific person by id
  app.delete('/person/<id>', (Request request, String id) {
    final data = <Person>[
      Person(firstName: 'John', lastName: 'Doe', age: 42),
      Person(firstName: 'Jane', lastName: 'Doe', age: 43),
    ];
    data.removeWhere((person) => person.id == id);
    return {'ok': 'true'};
  });

  return app;
}
