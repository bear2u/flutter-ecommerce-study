import 'package:flutter/material.dart';
import 'package:shopping/src/bloc/bloc.dart';

class StatelessProvider<T extends Bloc> extends InheritedWidget {
  final T bloc;

  StatelessProvider({this.bloc, Widget child})
      : assert(bloc != null),
        assert(child != null),
        super(child: child) {
    print('bloc #1 $bloc');
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return oldWidget != this;
  }

  static T of<T extends Bloc>(BuildContext context) {
    final type = _typeOf<StatelessProvider<T>>();
    print('bloc #2 $type');
    return (context.inheritFromWidgetOfExactType(type) as StatelessProvider<T>)?.bloc;
  }

  static Type _typeOf<T>() => T;
}