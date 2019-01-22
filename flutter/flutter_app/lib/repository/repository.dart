import 'package:flutter_app/model/todo_model.dart';
import 'package:flutter_app/repository/api.dart';
import 'package:rxdart/rxdart.dart';

class Repository {
  final sources = <Source>[
    Api(),
  ];

   Observable<dynamic> addTodo(TodoModel todoModel) {
    return Observable.fromFuture(sources[0].addTodo(todoModel));
  }

  Stream<List<TodoModel>> fetchTodos() {
    final result = sources[0].fetchTodos();
    return Observable.fromFuture(result);
  }
}

abstract class Source{
  addTodo(TodoModel todoModel);
  deleteTodo(id);
  Future<List<TodoModel>> fetchTodos();
}