import 'package:flutter/material.dart';
import 'package:shopping/src/bloc/shopping_bloc.dart';
import 'package:shopping/src/bloc/stateless_provider.dart';

class Detail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ShoppingBloc bloc = StatelessProvider.of(context);
    print('detail : $bloc');
    return Scaffold(
      appBar: AppBar(),
      body: Text('detail'),
    );
  }
}