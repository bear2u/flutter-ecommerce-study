import 'package:flutter/material.dart';
import 'package:shopping/src/bloc/shopping_bloc.dart';
import 'package:shopping/src/bloc/stateless_provider.dart';
import 'package:shopping/src/detail.dart';
import 'package:shopping/src/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StatelessProvider<ShoppingBloc>(
        bloc: ShoppingBloc(),
        child: Home(),
      ),
      routes: <String, WidgetBuilder>{
        "/detail": (context) => Detail()
      },
    );
  }
}

