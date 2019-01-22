import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

//flutter packages pub run build_runner build
@JsonSerializable(
  includeIfNull: false
)
class TodoModel {
  @JsonKey(name: "_id")
  String id;
  String title;
  String content;

  TodoModel({this.title, this.content})
      : assert(title != null),
        assert(content != null);

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toMap() => _$TodoModelToJson(this);

  @override
  String toString() {
    return 'TodoModel{id: $id, title: $title, content: $content}';
  }


}
