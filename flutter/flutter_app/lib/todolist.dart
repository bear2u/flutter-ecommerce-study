import 'package:flutter/material.dart';
import 'package:flutter_app/write.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final list = ['a', 'b', 'c'];
    return Scaffold(
      appBar: AppBar(
        title: Text('TodoList'),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, idx) => ListTile(
                title: Text(list[idx]),
              )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("/write");
          }
      ),
    );
  }
}
