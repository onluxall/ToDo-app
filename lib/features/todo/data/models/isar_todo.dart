/*
  
  isar - A NoSQL database for Flutter/Dart developers.
  https://isar.dev

*/

import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';

// Run the command below to generate the code for this model:
// dart run build_runner build
part 'isar_todo.g.dart';

@collection
class IsarTodo {
  Id id = Isar.autoIncrement; // you can also use int? id; and set it manually
  late String text;
  late bool isComplete;


  TodoEntity toDomain() {
    return TodoEntity(
      id: id,
      text: text,
      isComplete: isComplete,
    );
  }

  static IsarTodo fromDomain(TodoEntity todo) {
    return IsarTodo()
    ..id = todo.id
    ..text = todo.text
    ..isComplete = todo.isComplete;
  }
}