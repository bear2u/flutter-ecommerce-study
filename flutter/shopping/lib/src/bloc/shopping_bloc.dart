import 'dart:async';

import 'package:shopping/src/bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class ShoppingBloc implements Bloc {

  //step1 - stream
  final _item = PublishSubject<int>();
  final _stringItem = PublishSubject<String>();

  //step2 - listen
  Stream<int> get item => _item.stream;
  Stream<String> get stringItem => _stringItem.stream;

  //step3 emit
  Function(int) get emitItem => _item.sink.add;


  ShoppingBloc() {
    _item.stream.transform(_stringTransformer()).pipe(_stringItem);
  }

  @override
  void dispose() {
    _item.close();
    _stringItem.close();
  }

  StreamTransformer<int, String> _stringTransformer() => StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      final result = 'item $data';
      sink.add(result);
    }
  );
}