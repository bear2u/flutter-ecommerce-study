import 'package:flutter/material.dart';
import 'package:shopping/src/bloc/shopping_bloc.dart';
import 'package:shopping/src/bloc/stateless_provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShoppingBloc bloc = StatelessProvider.of(context);
    print('home: $bloc');

    bloc.stringItem.listen((data) => print(data));

    return Scaffold(
      body: SafeArea(
          child: _buildList(bloc, context)
      ),
    );
  }

  _buildList(ShoppingBloc bloc, context) {
    final ratio = MediaQuery.of(context).size.height / 1400;
    print(ratio);
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 2;

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      children: List.generate(20, (index) {
        return Center(
            child: GestureDetector(
              onTap: () {
                bloc.emitItem(index);
//                Navigator.of(context).pushNamed("/detail");
              },
              child: _buildItemView(context, index),
            )
        );
      }),
    );
  }

  _buildItemView(context, index) => _BuildItemWidget();
}

class _BuildItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ShoppingBloc bloc = StatelessProvider.of(context);
    print('home - grid item: $bloc');
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                image: NetworkImage("http://image.yes24.com/goods/68799454/L"),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: double.maxFinite,
                  color: Colors.red, //0x77000000
                  child: Text('title'),
                ),
              )
            ],
          ),
          Container(
            height: 70.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Description'),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('author'),
                    Text('price')
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}