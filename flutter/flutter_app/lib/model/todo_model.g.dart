// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return TodoModel(
      title: json['title'] as String, content: json['content'] as String)
    ..id = json['_id'] as String;
}

Map<String, dynamic> _$TodoModelToJson(TodoModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('title', instance.title);
  writeNotNull('content', instance.content);
  return val;
}
