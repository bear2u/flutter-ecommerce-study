import 'dart:convert';

import 'package:flutter_app/model/todo_model.dart';
import 'package:flutter_app/repository/repository.dart';
import 'package:http/http.dart' as http;

class Api implements Source{

  final url = 'http://10.0.2.2:3050/api';

  @override
  addTodo(TodoModel todoModel) async {
    print(url);
    http.Response response = await http.post(url + "/todos",
      body: todoModel.toMap(),
    ).timeout(Duration(seconds: 3));

    print(response);

    final parsedJson = json.decode(response.body);
    return parsedJson['_id'];
  }

  @override
  deleteTodo(id) {
    // TODO: implement deletetodo
    return null;
  }

  @override
  Future<List<TodoModel>> fetchTodos() {
    // TODO: implement fetchTodos
    return null;
  }

}