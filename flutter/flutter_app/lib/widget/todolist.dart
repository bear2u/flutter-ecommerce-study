import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/todo_bloc.dart';
import 'package:flutter_app/bloc/todo_provider.dart';
import 'package:flutter_app/model/todo_model.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = TodoProvider.of(context);
    bloc.fetchTodos();

    return Scaffold(
      appBar: AppBar(
        title: Text('TodoList'),
      ),
      body: _ListWidget(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("/write");
          }
      ),
    );
  }
}

class _ListWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = TodoProvider.of(context);

    return StreamBuilder(
      stream: bloc.todos,
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
