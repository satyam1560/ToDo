// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoImpl _$$ToDoImplFromJson(Map<String, dynamic> json) => _$ToDoImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      completed: json['completed'] as bool?,
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ToDoImplToJson(_$ToDoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
      'userId': instance.userId,
    };
