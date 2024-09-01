import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    final int? id,
    final String? title,
    final bool? completed,
    final int? userId,
  }) = _ToDo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
