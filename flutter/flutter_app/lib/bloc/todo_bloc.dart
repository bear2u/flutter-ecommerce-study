import 'dart:async';
import 'package:flutter_app/model/todo_model.dart';
import 'package:flutter_app/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc {
  final _repository = Repository();
  //input
  final _item = BehaviorSubject<List<TodoModel>>();
  final _title = BehaviorSubject<String>();
  final _content = BehaviorSubject<String>();

  //output
  Stream<List<TodoModel>> get item => _item.stream;
  Stream<String> get sTtitle => _title.stream;
  Stream<String> get sContent => _content.stream;
  
  Observable<bool> get validate => Observable.combineLatest2(sTtitle, sContent
    , (title, content) {
      print('$title, $content');
      if(title == '' || content == '' )
        return false;

      return true;
   });

  //push
  Function(String) get title => _title.sink.add;
  Function(String) get content => _content.sink.add;

  //push
  Function(List<TodoModel>) get addItem => _item.sink.add;


  TodoBloc() {
    _title.doOnData((value) => print(value));
  }

  submit() {

    final fAdd = _repository.addTodo(TodoModel(title: _title.value, content: _content.value));

    fAdd
      .listen((result) {
        print(result);
      });

  }

  dispose(){
    _item.close();
    _content.close();
  }

}