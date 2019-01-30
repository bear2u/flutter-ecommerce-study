import 'dart:convert';

import 'package:flutter_app/model/todo_model.dart';
import 'package:flutter_app/repository/repository.dart';
import 'package:http/http.dart' as http;

class Api implements Source{

  final url = 'http://192.168.0.3:3050/api';

  @override
  addTodo(TodoModel todoModel) async {
    http.Response response = await http.post(url + "/todos",
      body: json.encode(todoModel.toMap()), headers: {
          "content-type": "application/json"
        }
    ).timeout(Duration(seconds: 3));

    print(response.body);

    final parsedJson = json.decode(response.body);
    return parsedJson['_id'];
  }

  @override
  deleteTodo(id) {
    // TODO: implement deletetodo
    return null;
  }

  @override
  Future<List<TodoModel>> fetchTodos() async {
    http.Response response = await http.get(url + "/todos",
    ).timeout(Duration(seconds: 3));

    print(response.statusCode);

    final parsedJson = json.decode(response.body);

    List<TodoModel> items = parsedJson['items']
    //List
        ?.map((js) => TodoModel.fromJson(js) )
        ?.toList()
        ?.cast<TodoModel>();

    return items;
  }

}