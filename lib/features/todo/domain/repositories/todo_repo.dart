/*

  Repository interface for managing todo items.
  This abstracts the data layer from the rest of the application.
  It defines methods for adding, deleting, updating, and retrieving todos.
  The actual implementation will handle data storage (e.g., in-memory, database, etc.).

*/



import 'package:todo_app/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepo {

  Future<void> addTodo(TodoEntity newtodo);

  Future<void> deleteTodo(TodoEntity todo);

  Future<void> updateTodo(TodoEntity todo);
  
  Future<List<TodoEntity>> getTodos();
}



/*

  Note: 

  The methods use Future to indicate that these operations may be asynchronous,
  such as when interacting with a database or a remote server.
  The actual implementation of this interface will define how these operations are performed.

*/