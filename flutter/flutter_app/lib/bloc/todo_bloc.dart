import 'dart:async';
import 'package:flutter_app/model/test.dart';
import 'package:flutter_app/model/todo_model.dart';
import 'package:flutter_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

enum Progress { NONE, WAITING, DONE, FAILED }

class TodoBloc {
  final _repository = Repository();
  //input
  final _todos = BehaviorSubject<List<TodoModel>>();
  final _title = BehaviorSubject<String>();
  final _content = BehaviorSubject<String>();

  //output
  Stream<List<TodoModel>> get todos => _todos.stream;
  Stream<String> get title => _title.stream;
  Stream<String> get content => _content.stream;

  Observable<bool> get validate =>
      Observable.combineLatest2(title, content, (title, content) {
        print('$title, $content');
        if (title == '' || content == '') return false;

        return true;
      });

  Observable<List<TodoModel>> _testObservable;

  TodoBloc() {
    _testObservable = _repository
        .fetchTodos()
        .doOnData((datas) => print('datas: $datas'))
        .map((list) =>
            list.map((item) => item..title = "item : ${item.title}").toList());
  }

  //push
  Function(String) get emitTitle => _title.sink.add;
  Function(String) get emitContent => _content.sink.add;
  Function(List<TodoModel>) get emitTodos => _todos.sink.add;

  Function(List<TodoModel>) get addItem => _todos.sink.add;

  submit() {
    final fAdd = _repository
        .addTodo(TodoModel(title: _title.value, content: _content.value));

    fAdd.listen((_id) {
      if (_id != null) {
        print(_id);
      }
    });
  }

  fetchTodos() async {
    _testObservable.listen((result) {
      _todos.sink.add(result);
    });
//    _todos.addStream(_repository.fetchTodos());
  }

  dispose() {
    _todos.close();
    _content.close();
  }

  void test() {
    final test = Test(name: 'kim', age: 50, birth: "1970", male: Sex.MALE);

    print('#65 test toJson: ${test.toJson()}');
    print('#65 test fromJson: ${Test.fromJson(
      {"name": 'su', "age": 50, "birth": "1970", "male": 'MALE'},
    )}');
  }
}
