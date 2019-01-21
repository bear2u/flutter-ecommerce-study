import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/todo_bloc.dart';

class TodoProvider extends InheritedWidget {
  TodoBloc bloc = TodoBloc();

  TodoProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static TodoBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(TodoProvider) as TodoProvider)
        .bloc;
  }
}
