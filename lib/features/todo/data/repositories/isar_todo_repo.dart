/*
  repository for isar todo is implemented here
  It interacts with the Isar database to perform CRUD operations on todo items.
*/


import 'package:isar/isar.dart';
import 'package:todo_app/features/todo/data/models/isar_todo.dart';
import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';
import 'package:todo_app/features/todo/domain/repositories/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {

  //database instance will be here
  
  final Isar db;

  IsarTodoRepo(this.db);


  // get todos from db
  @override
  Future<List<TodoEntity>> getTodos() async {
    // fatch from db
    final isarTodos = await db.isarTodos.where().findAll();

    //return list of todos
    return isarTodos.map((IsarTodo) => IsarTodo.toDomain()).toList();
    
  }

  // add todo to db

  @override
  Future<void> addTodo(TodoEntity newtodo) async{
    // convert to isar model
    final isarTodo = IsarTodo.fromDomain(newtodo);

    return db.writeTxn(() => db.isarTodos.put(isarTodo));
    
  }

  // update todo in db
  @override
  Future<void> updateTodo(TodoEntity todo) async {
     // convert to isar model
    final isarTodo = IsarTodo.fromDomain(todo);

    return db.writeTxn(() => db.isarTodos.put(isarTodo));
    
  }

  // delete todo from db
  @override
  Future<void> deleteTodo(TodoEntity todo) async{
    await db.writeTxn(() => db.isarTodos.delete(todo.id));
    
  }
  
}