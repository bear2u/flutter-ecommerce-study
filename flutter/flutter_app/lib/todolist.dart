import 'package:flutter/material.dart';
import 'package:flutter_app/blc/todo_bloc.dart';
import 'package:flutter_app/blc/todo_provider.dart';
import 'package:flutter_app/todo_model.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    TodoBloc bloc = TodoProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('TodoList'),
      ),
      body: _buildListWidget(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("/write");
          }
      ),
    );
  }
}

class _buildListWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = TodoProvider.of(context);

    return StreamBuilder(
      stream: bloc.item,
      builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {

        print('snapshot : $snapshot');
        if(snapshot.data == null)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return _buildListBuilder(snapshot.data);
      },
    );
  }

  Widget _buildListBuilder(List<TodoModel> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, idx) => ListTile(
          title: Text(list[idx].title),
          subtitle: Text(list[idx].content),
        ));
  }
}
