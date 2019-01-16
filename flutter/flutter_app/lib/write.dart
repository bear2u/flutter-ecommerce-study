import 'package:flutter/material.dart';

class Write extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
        child: _buildForm(context),
      ),
    );
  }

  _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: '타이틀을 입력해주세요'
          ),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: '내용을 입력해주세요'
          ),
        ),
        RaisedButton(
          color: Colors.lightBlue,
          child: Text('save'),
          onPressed: (){
          },
        )
      ],
    );
  }
}