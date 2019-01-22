import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/todo_bloc.dart';
import 'package:flutter_app/bloc/todo_provider.dart';

class Write extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = TodoProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
        child: _buildForm(context, bloc),
      ),
    );
  }

  _buildForm(BuildContext context, TodoBloc bloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextField(
          onChanged: bloc.emitTitle,
          decoration: InputDecoration(
            labelText: '타이틀을 입력해주세요'
          ),
        ),
        TextField(
          onChanged: bloc.emitContent,
          decoration: InputDecoration(
              labelText: '내용을 입력해주세요'
          ),
        ),
        StreamBuilder(
          stream: bloc.validate,
          builder: (context, AsyncSnapshot<bool> snapshot) {
            Function f = () {
              bloc.submit();
              Navigator.of(context).pop();
            };

            if(snapshot.data == null || !snapshot.data) {
              f = null;
            }
            print(snapshot);
            return RaisedButton(
              color: Colors.lightBlue,
              child: Text('save'),
              onPressed: f,
            );
          },
        )
      ],
    );
  }
}